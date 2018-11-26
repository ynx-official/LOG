package com.web.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.IUserDao;
import com.web.pojo.User;
import com.web.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService{
	@Resource
	private IUserDao userDao;
	
	public IUserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	//登陆
	@Override
	public List<User> login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	


	
}
