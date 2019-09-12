package com.mihajlo.storage.repository;

import com.mihajlo.storage.entity.StorageItem;
import org.hibernate.Session;

import java.util.List;

public class StorageItemRepository extends CrudRepository<StorageItem, Long> {

    private static StorageItemRepository instance;

    private StorageItemRepository() {
        super(StorageItem.class);
    }

    public static StorageItemRepository getInstance() {
        if (instance == null) instance = new StorageItemRepository();
        return instance;
    }

    public List<StorageItem> search(String name) {
        Session session = getSessionFactory().openSession();
        session.getTransaction().begin();
        String hql = "FROM StorageItem s WHERE upper(s.name) LIKE concat('%', upper(:name), '%')";
        List<StorageItem> items = session
                .createQuery(hql, type)
                .setParameter("name", name)
                .list();
        session.getTransaction().commit();
        session.close();
        return items;
    }
}
