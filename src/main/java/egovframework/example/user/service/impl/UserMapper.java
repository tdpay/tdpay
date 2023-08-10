/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("userMapper")
public interface UserMapper {

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
	
	void keepLogin(Map<String, Object> params) throws IOException, SQLException;
	
	Map<String, String> checkUserWithSessionKey(Map<String, Object> params) throws IOException, SQLException;
	
	Map<String, String> idSearch(Map<String, String> params) throws IOException, SQLException;
	
	Map<String, String> pwSearch(Map<String, String> params) throws IOException, SQLException;
	
	void pwChange(Map<String, String> params) throws IOException, SQLException;
	
	void myPageMod(Map<String, String> params) throws IOException, SQLException;
	
	void logAdd(Map<String, String> params) throws IOException, SQLException;
	
	String pwCheck(Map<String, String> params) throws IOException, SQLException;
}
