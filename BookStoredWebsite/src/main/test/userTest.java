import com.bookstore.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class userTest {
    public static void main(String[] args) {
        Users users = new Users("vusinger@gmail.com","1234","Pham Vu");
        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Users.class).buildSessionFactory();
        Session session = factory.getCurrentSession();
        try {
            session.beginTransaction();
            session.save(users);
            session.getTransaction().commit();
        } finally {
            factory.close();
        }
    }
}
