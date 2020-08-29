package com.bookstore.dao;

import com.bookstore.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;

import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import static org.junit.Assert.*;

public class UserDAOTest {

    public static SessionFactory factory;
    public static Session session;
    public static UserDAO userDAO;

    @Before
    public void setUp() throws Exception {
        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Users.class).buildSessionFactory();
        session = factory.getCurrentSession();
        userDAO = new UserDAO(session);
    }

    @Test
    public void create() throws Exception {
        setUp();
        Users users = new Users("Tommy@gmail.com","abcdef","Tommy Camel");
        users = userDAO.create(users);
        assertTrue(users.getUserId()>0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateUsersFieldNotSet() throws Exception {
        setUp();
        Users users = new Users();
        users = userDAO.create(users);
    }

    @Test
    public void testUpdateUsers() {
        Users user = new Users();
        user.setUserId(19);
        user.setEmail("vupham@gmail.com");
        user.setPassword("secret");
        user.setFullName("Pham Hoang Vu");

        user = userDAO.update(user);
        String expected = "Pham Hoang Vu";
        String actual = user.getFullName();

        assertEquals(expected,actual);
    }

    @AfterClass
    public static void afterClass() throws Exception {
        session.close();
        factory.close();
    }
}