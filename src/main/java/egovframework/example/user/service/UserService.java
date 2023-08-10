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
package egovframework.example.user.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface UserService {

	Map<String, String> loginAction(Map<String, String> params) throws IOException, SQLException;
	Map<String, String> ipCheck(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> findUserByMenu(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findUserByMenuM(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findUserBySubMenu(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findUserBySubMenuM(Map<String, String> params) throws IOException, SQLException;
	
	int findAdmCnt(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findAdmByMenu(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findAdmByMenuM(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findAdmBySubMenu(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findAdmBySubMenuM(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findAdmBySubMenuM2(Map<String, String> params) throws IOException, SQLException;
	List<Map<String, String>> findAdmBySubMenuM3(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> findUserByRole(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> findSmsUser(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> findEmailUser(Map<String, String> params) throws IOException, SQLException;

	void phoneAdd(Map<String, String> params) throws IOException, SQLException;
	
	void emailAdd(Map<String, String> params) throws IOException, SQLException;
	
	// 로그인 유지 처리
	void keepLogin(String userId, String sessionId, Date sessionLimit) throws IOException, SQLException;

	// 세션키 검증 
	Map<String, String> checkUserWithSessionKey(String value) throws IOException, SQLException;

	Map<String, String> idSearch(Map<String, String> params) throws IOException, SQLException;
	
	Map<String, String> pwSearch(Map<String, String> params) throws IOException, SQLException;
	
	void pwChange(Map<String, String> params) throws IOException, SQLException;
	
	void myPageMod(Map<String, String> params) throws IOException, SQLException;
	
	void logAdd(Map<String, String> params) throws IOException, SQLException;
	
	String pwCheck(Map<String, String> params) throws IOException, SQLException;
}
