package com.hana.app.service;

import com.hana.app.data.entity.CustAddrEntity;
import com.hana.app.data.entity.CustInfoEntity;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CustAddrRepotory;
import com.hana.app.repository.CustInfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CustAddrService implements HanaService<CustAddrEntity, Long> {
    private final CustAddrRepotory custAddrRepotory;

    @Override
    public CustAddrEntity insert(CustAddrEntity custAddrEntity) {
        return custAddrRepotory.save(custAddrEntity);
    }

    @Override
    public Optional<CustAddrEntity> get(Long aLong) {
        return custAddrRepotory.findById(aLong);
    }

    @Override
    public List<CustAddrEntity> get() {
        return custAddrRepotory.findAll();
    }

    @Override
    public Boolean delete(Long aLong) {
        custAddrRepotory.deleteById(aLong);
        return true;
    }

    @Override
    public CustAddrEntity update(CustAddrEntity custAddrEntity) {
        return custAddrRepotory.save(custAddrEntity);
    }
}
