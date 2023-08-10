/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.user.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.user.service.UserService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

	// TODO mybatis 사용
	@Resource(name="userMapper")
	private UserMapper userDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public Map<String, String> loginAction(Map<String, String> params) throws IOException, SQLException {
		return userDAO.loginAction(params);
	}
	
	@Override
	public Map<String, String> ipCheck(Map<String, String> params) throws IOException, SQLException {
		return userDAO.ipCheck(params);
	}
	
	@Override
	public List<Map<String, String>> findUserByMenu(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findUserByMenu(params);
	}
	@Override
	public List<Map<String, String>> findUserByMenuM(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findUserByMenuM(params);
	}
	@Override
	public List<Map<String, String>> findUserBySubMenu(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findUserBySubMenu(params);
	}
	@Override
	public List<Map<String, String>> findUserBySubMenuM(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findUserBySubMenuM(params);
	}
	
	@Override
	public int findAdmCnt(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmCnt(params);
	}
	
	@Override
	public List<Map<String, String>> findAdmByMenu(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmByMenu(params);
	}
	@Override
	public List<Map<String, String>> findAdmByMenuM(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmByMenuM(params);
	}
	@Override
	public List<Map<String, String>> findAdmBySubMenu(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmBySubMenu(params);
	}
	@Override
	public List<Map<String, String>> findAdmBySubMenuM(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmBySubMenuM(params);
	}
	@Override
	public List<Map<String, String>> findAdmBySubMenuM2(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmBySubMenuM2(params);
	}
	@Override
	public List<Map<String, String>> findAdmBySubMenuM3(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findAdmBySubMenuM3(params);
	}
	
	@Override
	public List<Map<String, String>> findUserByRole(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findUserByRole(params);
	}
	
	@Override
	public List<Map<String, String>> findSmsUser(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findSmsUser(params);
	}
	
	@Override
	public List<Map<String, String>> findEmailUser(Map<String, String> params) throws IOException, SQLException {
		return userDAO.findEmailUser(params);
	}
	
	@Override
	public void phoneAdd(Map<String, String> params) throws IOException, SQLException {
		userDAO.phoneAdd(params);
	}
	
	@Override
	public void emailAdd(Map<String, String> params) throws IOException, SQLException {
		userDAO.emailAdd(params);
	}
	
	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws IOException, SQLException{
		 
		Map<String, Object> params = new HashMap<String, Object>(); 
		params.put("userId", userId); 
		params.put("sessionId", sessionId); 
		params.put("sessionLimit", sessionLimit);

		userDAO.keepLogin(params);
	}

	@Override 
	public Map<String, String> checkUserWithSessionKey(String value) throws IOException, SQLException{
		
		Map<String, Object> params = new HashMap<String, Object>(); 
		params.put("value", value); 
		
		
		return userDAO.checkUserWithSessionKey(params);
	}
	
	@Override
	public Map<String, String> idSearch(Map<String, String> params) throws IOException, SQLException {
		
		String ceo_birth = params.get("ceo_birth").replaceAll("-", "");
		String corp_regist_num = params.get("corp_regist_num").replaceAll("-", "");
		
		params.put("ceo_birth", ceo_birth);
		params.put("corp_regist_num", corp_regist_num);
		return userDAO.idSearch(params);
	}
	
	@Override
	public Map<String, String> pwSearch(Map<String, String> params) throws IOException, SQLException {
		
		String ceo_birth = params.get("ceo_birth").replaceAll("-", "");
		String corp_regist_num = params.get("corp_regist_num").replaceAll("-", "");
		
		params.put("ceo_birth", ceo_birth);
		params.put("corp_regist_num", corp_regist_num);
		return userDAO.pwSearch(params);
	}
	
	@Override
	public void pwChange(Map<String, String> params) throws IOException, SQLException {
		
		userDAO.pwChange(params);
	}
	
	@Override
	public void myPageMod(Map<String, String> params) throws IOException, SQLException {
		userDAO.myPageMod(params);
	}
	
	@Override
	public void logAdd(Map<String, String> params) throws IOException, SQLException {
		userDAO.logAdd(params);
	}
	
	@Override
	public String pwCheck(Map<String, String> params) throws IOException, SQLException {
		return userDAO.pwCheck(params);
	}
}
