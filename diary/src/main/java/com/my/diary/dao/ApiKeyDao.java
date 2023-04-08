package com.my.diary.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.my.diary.vo.ApiKey;

public class ApiKeyDao extends SqlSessionDaoSupport{
	
	public String getApiKey(ApiKey ap) {
		return this.getSqlSession().selectOne("getApiKey",ap);
	}
}
