package com.mihajlo.storage.repository.base;

import com.mihajlo.storage.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public abstract class BaseRepository<T, K> {

    protected final Class<T> type;

    protected BaseRepository(Class<T> type) {
        this.type = type;
    }

    protected static SessionFactory getSessionFactory() {
        return HibernateUtil.getSessionFactory();
    }

    public T create(T entity) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }

    public T getById(K id) {
        Session session = getSessionFactory().openSession();
        T entity = session.find(type, id);
        session.detach(entity);
        session.close();
        return entity;
    }

    public List<T> getAll() {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        List<T> entity = session
                .createQuery("FROM " + type.getName(), type).list();
        transaction.commit();
        session.close();
        return entity;
    }

    public T update(T entity) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }

    public T delete(K id) {
        T entity = getById(id);
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.createQuery("DELETE FROM " + type.getName() + " WHERE id = :id")
                .setParameter("id", id).executeUpdate();
        transaction.commit();
        session.close();
        return entity;
    }
}
