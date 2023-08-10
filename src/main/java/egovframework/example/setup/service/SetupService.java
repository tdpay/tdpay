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
package egovframework.example.setup.service;

import java.io.IOException;
import java.sql.SQLException;
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
public interface SetupService {

	List<SetupVO> setupBankList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupBankAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupBankDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> setupAuthList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupPhoneEmailDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupPhoneNumAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupEmailAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> setupMenuList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	List<SetupVO> setupMenuList2(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	List<SetupVO> setupMenuListCheck(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	SetupVO setupStoreInfo(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	SetupVO setupMenuInfo(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> selectSetupList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int selectSetupListCnt(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> selectSetupIpList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int selectSetupIpListCnt(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupIpAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupIpMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupIpDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> selectSetupCardFeeList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupCardFeeAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupCardFeeDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupCardFeeMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> selectSetupPgFeeList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	int setupPgFeeAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupPgFeeMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	int setupPgFeeDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	SetupVO selectSetupPgFeeListDetail(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	
	
	List<Map<String, String>> selectMenu() throws IOException, SQLException;
	List<Map<String, String>> selectSubMenu() throws IOException, SQLException;
	List<Map<String, String>> selectMenuMapping() throws IOException, SQLException;
}
