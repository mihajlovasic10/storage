package com.mihajlo.storage.service;

import com.mihajlo.storage.service.base.BaseService;
import com.mihajlo.storage.entity.Role;
import com.mihajlo.storage.repository.RoleRepository;

public class RoleService extends BaseService<Role, Long, RoleRepository> {

    public RoleService() {
        super(RoleRepository.getInstance());
    }

}
