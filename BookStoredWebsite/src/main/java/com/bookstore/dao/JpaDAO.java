package com.bookstore.dao;

import org.hibernate.Session;

public class JpaDAO<E> {

    protected Session session;

    public JpaDAO(Session session) {

        this.session = session;

    }

    public E create(E entity) {

        session.getTransaction().begin();

        session.persist(entity);
        session.flush();
        session.refresh(entity);

        session.getTransaction().commit();

        return entity;
    }

    public E update(E entity) {
        session.getTransaction().begin();
        entity = (E) session.merge(entity);
        session.getTransaction().commit();
        return entity;
    }
}
