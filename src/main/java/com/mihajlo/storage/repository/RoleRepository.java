package com.mihajlo.storage.repository;

import com.mihajlo.storage.repository.base.BaseRepository;
import com.mihajlo.storage.entity.Role;

public class RoleRepository extends BaseRepository<Role, Long> {

    private static RoleRepository instance;

    private RoleRepository() {
        super(Role.class);
    }

    public static RoleRepository getInstance() {
        if (instance == null) instance = new RoleRepository();
        return instance;
    }

}
