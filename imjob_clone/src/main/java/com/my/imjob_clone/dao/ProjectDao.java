package com.my.imjob_clone.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.my.imjob_clone.vo.Project;

public class ProjectDao extends SqlSessionDaoSupport{
	
	public int getCount() {
		return this.getSqlSession().selectOne("project.getCount");
	}
	
	public List<Project> getProjectAll(HashMap<String,Object> map){
		return this.getSqlSession().selectList("project.getProjectAll",map);
	}

}
