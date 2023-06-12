package com.my.imjob_clone.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.imjob_clone.dao.ProjectDao;
import com.my.imjob_clone.vo.Project;

@Controller
@RequestMapping(value="/project")
public class ProjectController {

	@Resource(name="ProjectDao")
	private ProjectDao projectDao;
	
	
	//project 총 개수
	@RequestMapping(value="/getCount", method=RequestMethod.GET)
	public @ResponseBody int getCount() {
		
		int count = projectDao.getCount();
		
		return count;		
	}
	
	@RequestMapping(value="/getProjectAll", method=RequestMethod.GET)
	public @ResponseBody List<Project> getProjectAll(
			@RequestParam(value="start") int start,
			@RequestParam(value="cnt") int cnt
			){
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("start", start);
		map.put("cnt", cnt);
		
		List<Project> projectList = projectDao.getProjectAll(map);
		
		return projectList;
	}
}
