package com.suyi.mapper;

import com.suyi.domain.Doctor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorMapper {
    int deleteByPrimaryKey(Integer did);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(Integer did);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

    List<Doctor> selectAll();

    List<Doctor> selectByName(String name);

    Doctor selectByPrimaryKeyAndName(@Param("did") Integer did,@Param("name") String name);

    int deleteByPrimaryKeyButch(List<String> did);

//    List<Doctor> selectDoctorAndDepartmentAll();
}