package com.mihajlo.storage.service;

import com.mihajlo.storage.service.base.BaseService;
import com.mihajlo.storage.entity.User;
import com.mihajlo.storage.repository.UserRepository;

public class UserService extends BaseService<User, Long, UserRepository> {

    public UserService() {
        super(UserRepository.getInstance());
    }

    public User findByEmailAndPassword(String email, String password) {
        return repository.findByEmailAndPassword(email, password);
    }
}
