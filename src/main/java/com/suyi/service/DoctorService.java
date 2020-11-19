package com.suyi.service;

import com.suyi.domain.Doctor;

import java.util.List;

public interface DoctorService {
    List<Doctor> selectByNameAndDepartment(int page, int size,String name,int dno);

    boolean insert(Doctor doctor,String depid);

    Doctor selectByPrimaryKey(Integer did);

    boolean updateByPrimaryKey(Doctor doctor,String depid);

    boolean deleteByPrimaryKeyButch(String did);

    List<Doctor> selectAll();
}
