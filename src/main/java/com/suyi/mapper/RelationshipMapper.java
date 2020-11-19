package com.suyi.mapper;

import com.suyi.domain.Relationship;

import java.util.List;

public interface RelationshipMapper {
    int insert(Relationship record);

    int insertSelective(Relationship record);

    List<Relationship> selectByDepid(Integer depid);

    List<Relationship> selectByDocid(Integer docid);

    void deleteByDocid(Integer docid);
}