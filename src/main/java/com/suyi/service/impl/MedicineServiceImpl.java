package com.suyi.service.impl;

import com.github.pagehelper.PageHelper;
import com.suyi.domain.Doctor;
import com.suyi.domain.Medicine;
import com.suyi.mapper.MedicineMapper;
import com.suyi.service.MedicineService;
import com.suyi.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Service
public class MedicineServiceImpl implements MedicineService {
    @Autowired
    private MedicineMapper medicineMapper;

    @Override
    public List<Medicine> selectByNameAndType(int page, int size,String name,Integer type) {
        PageHelper.startPage(page, size);
        if (type==0 && (name==null || name=="")){
            return medicineMapper.selectAll();
        }else {
            return medicineMapper.selectByNameAndType(name, type);
        }
    }

    @Override
    public boolean insertSelective(Medicine medicine, MultipartFile file) throws IOException {
        String picture = new UploadFileUtils().uploadFile(file);
        medicine.setPicture(picture);
        int i = medicineMapper.insertSelective(medicine);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public Medicine selectByPrimaryKey(Integer mid) {
        return medicineMapper.selectByPrimaryKey(mid);
    }

    @Override
    public boolean updateByPrimaryKeySelective(Medicine medicine, MultipartFile file) throws IOException {
        String picture = new UploadFileUtils().uploadFile(file);
        medicine.setPicture(picture);
        int i = medicineMapper.updateByPrimaryKeySelective(medicine);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteByPrimaryKeyButch(String mid) {
        String[] split = mid.split(",");
        List<String> strings = Arrays.asList(split);
        int i = medicineMapper.deleteByPrimaryKeyButch(strings);
        if (i>0){
            return true;
        }
        return false;
    }
}
