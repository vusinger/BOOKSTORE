import com.bookstore.entity.Category;
import com.bookstore.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class CategoryTest {
    public static void main(String[] args) {
        Category category = new Category("Business");
        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Category.class).buildSessionFactory();
        Session session = factory.getCurrentSession();
        try {
            session.beginTransaction();
            session.save(category);
            session.getTransaction().commit();
        } finally {
            factory.close();
        }
    }
}
