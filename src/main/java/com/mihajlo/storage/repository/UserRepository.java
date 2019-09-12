package com.mihajlo.storage.repository;

import com.mihajlo.storage.entity.User;
import org.hibernate.Session;

public class UserRepository extends CrudRepository<User, Long> {

    private static UserRepository instance;

    private UserRepository() {
        super(User.class);
    }

    public static UserRepository getInstance() {
        if (instance == null) instance = new UserRepository();
        return instance;
    }

    public User findByEmailAndPassword(String email, String password) {
        Session session = getSessionFactory().openSession();
        session.getTransaction().begin();
        String hql = "FROM User u WHERE u.email = :email AND u.password = :password";
        User user = session
                .createQuery(hql, type)
                .setParameter("email", email)
                .setParameter("password", password)
                .uniqueResult();
        session.getTransaction().commit();
        session.close();
        return user;
    }
}
