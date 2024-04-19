package com.hana.app.service;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.data.entity.CustInfoEntity;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CustInfoRepository;
import com.hana.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CustInfoService implements HanaService<CustInfoEntity,Integer> {
    final CustInfoRepository custInfoRepository;
    @Override
    public CustInfoEntity insert(CustInfoEntity custInfoEntity) {
        return custInfoRepository.save(custInfoEntity);
    }

    @Override
    public Optional<CustInfoEntity> get(Integer integer) {
        return custInfoRepository.findById(integer);
    }

    @Override
    public List<CustInfoEntity> get() {
        return custInfoRepository.findAll();
    }

    @Override
    public Boolean delete(Integer integer) {
        custInfoRepository.deleteById(integer);
        return true;
    }

    @Override
    public CustInfoEntity update(CustInfoEntity custInfoEntity) {
        return custInfoRepository.save(custInfoEntity);
    }
}
