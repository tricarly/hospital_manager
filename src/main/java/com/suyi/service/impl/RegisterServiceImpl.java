package com.suyi.service.impl;

import com.github.pagehelper.PageHelper;
import com.suyi.domain.Department;
import com.suyi.domain.Doctor;
import com.suyi.domain.Register;
import com.suyi.domain.Relationship;
import com.suyi.mapper.RegisterMapper;
import com.suyi.mapper.RelationshipMapper;
import com.suyi.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    private RegisterMapper registerMapper;

    @Override
    public List<Register> selectByRidAndNameAndDepartment(int page, int size, Integer rid, String name, Integer department) {
        PageHelper.startPage(page,size);
        if (rid==0 && (null==name || "".equals(name)) && department==0){
            return registerMapper.selectAll();
        }
        else {
            return registerMapper.selectByPrimaryKeyAndNameAndDepartmentSelective(rid, name, department);
        }
    }

    @Override
    public Register selectByPrimaryKey(Integer rid) {
        return registerMapper.selectByPrimaryKey(rid);
    }

    @Override
    public boolean insertSelective(Register register) {
        register.setCreatetime(new Date());
        register.setState(1);
        int i = registerMapper.insertSelective(register);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean updateByPrimaryKeySelective(Register register) {
        int i = registerMapper.updateByPrimaryKeySelective(register);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteByPrimaryKeyButch(Integer rid) {
        int i = registerMapper.deleteByPrimaryKey(rid);
        if (i>0){
            return true;
        }
        return false;
    }
}
