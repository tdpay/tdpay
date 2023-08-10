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
package egovframework.example.setup.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import egovframework.example.setup.service.SetupDefaultVO;
import egovframework.example.setup.service.SetupVO;
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
@Mapper("setupMapper")
public interface SetupMapper {

	List<SetupVO> setupBankList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupBankCnt(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupBankAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupBankDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> setupAuthList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupPhoneNumDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupPhoneNumDel2(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupEmailDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupEmailDel2(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	void setupPhoneNumAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupEmailAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupStoreAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupRoleAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupMenuAdd(Map<String, Object> param) throws IOException, SQLException;
	void setupStoreMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupRoleDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupStoreDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	void setupMenuDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
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
	int setupCardFeeMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupCardFeeDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	
	List<SetupVO> selectSetupPgFeeList(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	int setupPgFeeAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException;
	int setupPgFeeMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	int setupPgFeeDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	SetupVO selectSetupPgFeeListDetail(SetupDefaultVO searchSetupVO) throws IOException, SQLException;	
	
	List<Map<String, String>> selectMenu() throws IOException, SQLException;
	List<Map<String, String>> selectSubMenu() throws IOException, SQLException;
	List<Map<String, String>> selectMenuMapping() throws IOException, SQLException;
}
