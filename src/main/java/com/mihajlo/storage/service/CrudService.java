package com.mihajlo.storage.service;

import com.mihajlo.storage.repository.CrudRepository;

import java.util.List;

public abstract class CrudService<T, K, R extends CrudRepository<T, K>> {

    protected final R repository;

    protected CrudService(R repository) {
        this.repository = repository;
    }

    public T create (T entity) {
        return repository.create(entity);
    }

    public T update (T entity) {
        return repository.update(entity);
    }

    public T getById (K id) {
        return repository.getById(id);
    }

    public List<T> getAll() { return repository.getAll(); }

    public T delete(K id) {
        return repository.delete(id);
    }

}
