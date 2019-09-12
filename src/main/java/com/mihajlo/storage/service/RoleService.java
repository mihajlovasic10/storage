package com.mihajlo.storage.service;

import com.mihajlo.storage.entity.Role;
import com.mihajlo.storage.repository.RoleRepository;

public class RoleService extends CrudService<Role, Long, RoleRepository> {

    public RoleService() {
        super(RoleRepository.getInstance());
    }

}
