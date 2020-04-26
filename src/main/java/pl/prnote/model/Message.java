package pl.prnote.model;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Entity
@Table(name = "messages")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Length(max = 999)
    private String messageContent;


    private String password;

    @Email
    private String email;


    private String link;


    private boolean destructionAsk = false;

    private LocalDateTime created;
    private LocalDateTime destroyed;
    private boolean activ = true;

    public LocalDateTime getDestroyed() {
        return destroyed;
    }

    public void setDestroyed(LocalDateTime destroyed) {
        this.destroyed = destroyed;
    }

    public boolean isActiv() {
        return activ;
    }

    public void setActiv(boolean activ) {
        this.activ = activ;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public boolean isDestructionAsk() {
        return destructionAsk;
    }

    public void setDestructionAsk(boolean destructionAsk) {
        this.destructionAsk = destructionAsk;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", messageContent='" + messageContent + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", link='" + link + '\'' +
                ", destructionAsk=" + destructionAsk +
                ", created=" + created +
                '}';
    }
}
