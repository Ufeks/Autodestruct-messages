package pl.prnote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.prnote.model.Message;
import pl.prnote.repository.MessageRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Properties;
import java.util.UUID;

@Controller
public class MessageController {


    public JavaMailSender emailSender;
    private MessageRepository messageRepository;

    @Autowired
    public MessageController(MessageRepository messageRepository, JavaMailSender emailSender) {
        this.messageRepository = messageRepository;
        this.emailSender = emailSender;
    }

    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("autodestructible.messages@gmail.com");
        mailSender.setPassword("qxijipjjcqwmnblu");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

    @GetMapping("/")
    private String addMessage(Model model) {
        Message message = new Message();
        model.addAttribute("message", message);
        return "index";
    }

    @PostMapping("/")
    public String saveMessage(@ModelAttribute @Valid Message message, BindingResult result) {
        if (result.hasErrors()) {
            return "index";
        }
        UUID randomLink = UUID.randomUUID();
        String encrypted = encrypt(message.getMessageContent());
        message.setCreated(LocalDateTime.now());
        message.setLink(randomLink.toString().replaceAll("-", "").substring(0, 24));
        if (!message.getPassword().isEmpty()) {
            message.setMessageContent(encrypted);
            messageRepository.save(message);
            return "showLinkWithPassword";
        }
        message.setMessageContent(encrypted);
        messageRepository.save(message);
        return "showLink";
    }

    @GetMapping("/showLink")
    private String showLinkToCreatedMessage(Model model, @ModelAttribute Message message) {
        model.addAttribute("message", message);
        return "showLink";
    }


    @GetMapping("/{link}")
    private String requestParamsUri(@PathVariable("link") String link, Model model) {
        Message message = messageRepository.findByLink(link);
        if (message == null) {
            return "noMessage";
        }

        if (!message.isActiv()) {
            model.addAttribute("message", message);
            return "inactivMessage";
        }

        if (message.isDestructionAsk() && message.isActiv() && (!message.getPassword().isEmpty())) {
            model.addAttribute("message", message);
            return "passwordWarning";
        }
        if (message.isDestructionAsk() && message.isActiv()) {
            model.addAttribute("message", message);
            message.setActiv(false);
            message.setDestroyed(LocalDateTime.now());
            message.setMessageContent(decrypt(message.getMessageContent()));
            messageRepository.save(message);
            return "showFullMessage";
        }

        if (!message.getPassword().isEmpty()) {
            model.addAttribute("message", message);
            return "passwordWarning";
        }
        model.addAttribute("message", message);
        return "confirmToShow";
    }

    @GetMapping("/{link}/@")
    private String showMessage(@PathVariable("link") String link, Model model) {

        Message message = messageRepository.findByLink(link);

        if (message == null) {
            return "noMessage";
        }

        if (!message.getPassword().isEmpty()) {
            model.addAttribute("message", message);
            return "passwordWarning";
        }

        if (!message.isActiv()) {
            model.addAttribute("message", message);
            return "inactivMessage";
        }

        model.addAttribute("message", message);
        message.setActiv(false);
        message.setMessageContent(decrypt(message.getMessageContent()));
        messageRepository.save(message);
        return "showFullMessage";
    }

    @GetMapping("/{link}/d")
    private void deleteContent(@PathVariable("link") String link) {
        Message message = messageRepository.findByLink(link);
        message.setDestroyed(LocalDateTime.now());

        if (!message.getEmail().isEmpty()) {
            SimpleMailMessage messageE = new SimpleMailMessage();
            messageE.setTo(message.getEmail());
            messageE.setSubject("Message you created was destroyed");
            messageE.setText("Message with link: /" + message.getLink() + " was destroyed at: " + message.getDestroyed());
            emailSender.send(messageE);
        }


        message.setMessageContent("---");
        message.setActiv(false);
        message.setEmail(null);
        messageRepository.save(message);


    }

    @GetMapping("/{link}/password")
    private String askPassword(HttpServletRequest req, @PathVariable("link") String link, Model model) {
        Message message = messageRepository.findByLink(link);
        if (message == null) {
            return "noMessage";
        }
        model.addAttribute("message", message);
        return "password";

    }

    @PostMapping("/{link}/password")
    private String password(HttpServletRequest req, @PathVariable("link") String link, Model model) {
        String givenPassword = req.getParameter("password");
        Message message = messageRepository.findByLink(link);
        if (message == null) {
            return "noMessage";
        }
        if (!message.isActiv()) {
            model.addAttribute("message", message);
            return "inactivMessage";
        }
        if (message.getPassword().equals(givenPassword)) {
            model.addAttribute("message", message);
            message.setPassword(null);
            message.setMessageContent(decrypt(message.getMessageContent()));
            messageRepository.save(message);
            return "showFullMessage";
        } else {
            message.setActiv(false);
            message.setMessageContent("---");
            message.setDestroyed(LocalDateTime.now());
            messageRepository.save(message);
            return "wrongPassword";
        }
    }

    @GetMapping("/noMessage")
    private String noMessage() {
        return "noMessage";
    }

    public String decrypt(String value) {
        return new String(Base64.getDecoder().decode(value.getBytes(StandardCharsets.UTF_8)), StandardCharsets.UTF_8);
    }

    public String encrypt(String value) {
        return Base64.getEncoder().encodeToString(value.getBytes(StandardCharsets.UTF_8));
    }
}
