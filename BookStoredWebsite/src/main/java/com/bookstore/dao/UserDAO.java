package com.bookstore.dao;

import com.bookstore.entity.Users;
import org.hibernate.Session;

import java.util.List;

public class UserDAO extends JpaDAO<Users> implements GenericDAO<Users>{

    public UserDAO(Session session) {
        super(session);
    }

    @Override
    public Users create(Users users) {
        return super.create(users);
    }

    @Override
    public Users update(Users entity) {
        return super.update(entity);
    }

    @Override
    public Users get(Object id) {
        return null;
    }

    @Override
    public void delete(Object id) {

    }

    @Override
    public List<Users> listAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }
}
