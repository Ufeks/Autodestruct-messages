package pl.prnote.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.prnote.model.Message;

public interface MessageRepository extends JpaRepository<Message, Long> {
    Message findByLink(String link);

}
