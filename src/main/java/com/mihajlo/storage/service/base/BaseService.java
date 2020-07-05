package com.mihajlo.storage.service.base;

import com.mihajlo.storage.repository.base.BaseRepository;

import java.util.List;

public abstract class BaseService<T, K, R extends BaseRepository<T, K>> {

    protected final R repository;

    protected BaseService(R repository) {
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
