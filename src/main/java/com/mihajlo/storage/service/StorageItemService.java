package com.mihajlo.storage.service;

import com.mihajlo.storage.service.base.BaseService;
import com.mihajlo.storage.entity.StorageItem;
import com.mihajlo.storage.repository.StorageItemRepository;

import java.util.List;

public class StorageItemService extends BaseService<StorageItem, Long, StorageItemRepository> {

    public StorageItemService() {
        super(StorageItemRepository.getInstance());
    }

    public List<StorageItem> search(String name) {
        return repository.search(name);
    }
}
