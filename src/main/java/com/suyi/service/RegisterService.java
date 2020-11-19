package com.suyi.service;

import com.suyi.domain.Register;

import java.util.List;

public interface RegisterService {
    List<Register> selectByRidAndNameAndDepartment(int page, int size, Integer rid, String name, Integer dno);

    Register selectByPrimaryKey(Integer rid);

    boolean insertSelective(Register register);

    boolean updateByPrimaryKeySelective(Register register);

    boolean deleteByPrimaryKeyButch(Integer rid);
}
