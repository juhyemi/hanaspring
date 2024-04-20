package com.hana.app.service;

import com.hana.app.data.dto.AdminDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminService implements TestService<String, AdminDto> {
    final AdminRepository adminRepository;
    @Override
    public int add(AdminDto adminDto) throws Exception {
        return adminRepository.insert(adminDto);
    }

    @Override
    public int del(String s) throws Exception {
        return adminRepository.delete(s);
    }

    @Override
    public int modify(AdminDto adminDto) throws Exception {
        return adminRepository.update(adminDto);
    }

    @Override
    public AdminDto get(String id) throws Exception {
        return adminRepository.selectOne(id);
    }

    @Override
    public List<AdminDto> get() throws Exception {
        return adminRepository.select();
    }
}
