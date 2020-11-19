package com.suyi.service.impl;

import com.github.pagehelper.PageHelper;
import com.suyi.domain.Department;
import com.suyi.domain.Doctor;
import com.suyi.domain.Relationship;
import com.suyi.mapper.DepartmentMapper;
import com.suyi.mapper.DoctorMapper;
import com.suyi.mapper.RelationshipMapper;
import com.suyi.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private RelationshipMapper relationshipMapper;

    @Override
    public List<Doctor> selectByNameAndDepartment(int page, int size,String name,int dno) {
        PageHelper.startPage(page,size);
        List<Doctor> doctorList=new ArrayList<>();
        if (dno==0){
            if (name!=null && name!="") {
                List<Doctor> doctors = doctorMapper.selectByName(name);
                for (Doctor doctor : doctors) {
                    doctorList.add(doctor);
                }
            }
            else {
                doctorList = doctorMapper.selectAll();
            }
        }
        else{
            List<Relationship> relationshipList = relationshipMapper.selectByDepid(dno);
            for (Relationship relationship : relationshipList) {
                Doctor doctor = doctorMapper.selectByPrimaryKey(relationship.getDocid());
                if (doctor.getName()==name || name==null || name==""){
                    doctorList.add(doctor);
                }
            }
        }
        for (Doctor doctor : doctorList) {
            List<Department> departments = new ArrayList<>();
            List<Relationship> relationshipList = relationshipMapper.selectByDocid(doctor.getDid());
            for (Relationship relationship : relationshipList) {
                Department department = departmentMapper.selectByPrimaryKey(relationship.getDepid());
                departments.add(department);
            }
            doctor.setDepartmentList(departments);
        }
        return doctorList;
    }

    @Override
    public boolean insert(Doctor doctor,String depid) {
        int i = doctorMapper.insert(doctor);
        String[] split = depid.split(",");
        List<String> strings = Arrays.asList(split);
        Relationship relationship = new Relationship();
        for (String string : strings) {
            relationship.setDepid(Integer.valueOf(string));
            relationship.setDocid(doctor.getDid());
            relationshipMapper.insert(relationship);
        }
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public Doctor selectByPrimaryKey(Integer did) {
        List<Department> departments = new ArrayList<>();
        Doctor doctor = doctorMapper.selectByPrimaryKey(did);
        List<Relationship> relationshipList = relationshipMapper.selectByDocid(doctor.getDid());
        for (Relationship relationship : relationshipList) {
            Department department = departmentMapper.selectByPrimaryKey(relationship.getDepid());
            departments.add(department);
        }
        doctor.setDepartmentList(departments);
        return doctor;
    }

    @Override
    public boolean updateByPrimaryKey(Doctor doctor,String depid) {
        int i = doctorMapper.updateByPrimaryKey(doctor);
        relationshipMapper.deleteByDocid(doctor.getDid());
        Relationship relationship=new Relationship();
        String[] split = depid.split(",");
        List<String> strings = Arrays.asList(split);
        for (String string : strings) {
            relationship.setDepid(Integer.valueOf(string));
            relationship.setDocid(doctor.getDid());
            relationshipMapper.insert(relationship);
        }
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteByPrimaryKeyButch(String did) {
        String[] split = did.split(",");
        List<String> strings = Arrays.asList(split);
        int i = doctorMapper.deleteByPrimaryKeyButch(strings);
        for (String string : strings) {
            relationshipMapper.deleteByDocid(Integer.valueOf(string));
        }
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Doctor> selectAll() {
        return doctorMapper.selectAll();
    }
}
