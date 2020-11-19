package com.suyi.mapper;

import com.suyi.domain.Register;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegisterMapper {
    int deleteByPrimaryKey(Integer rid);

    int insert(Register record);

    int insertSelective(Register record);

    Register selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(Register record);

    int updateByPrimaryKey(Register record);

    List<Register> selectAll();

    List<Register> selectByPrimaryKeyAndNameAndDepartmentSelective(@Param("rid") Integer rid,@Param("name") String name,@Param("department") Integer department);
}