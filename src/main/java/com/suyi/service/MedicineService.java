package com.suyi.service;

import com.suyi.domain.Doctor;
import com.suyi.domain.Medicine;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface MedicineService {
    List<Medicine> selectByNameAndType(int page,int size,String name,Integer type);

    boolean insertSelective(Medicine medicine, MultipartFile file) throws IOException;

    Medicine selectByPrimaryKey(Integer mid);

    boolean updateByPrimaryKeySelective(Medicine medicine, MultipartFile file) throws IOException;

    boolean deleteByPrimaryKeyButch(String mid);
}
