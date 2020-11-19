package com.suyi.mapper;

import com.suyi.domain.Medicine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MedicineMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Medicine record);

    int insertSelective(Medicine record);

    Medicine selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(Medicine record);

    int updateByPrimaryKey(Medicine record);

    List<Medicine> selectAll();

    List<Medicine> selectByNameAndType(@Param("name") String name,@Param("type") Integer type);

    int deleteByPrimaryKeyButch(List<String> strings);
}