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
package egovframework.example.manage2.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import egovframework.example.manage2.service.Manage2DefaultVO;
import egovframework.example.manage2.service.Manage2VO;
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
@Mapper("manage2Mapper")
public interface Manage2Mapper {

	List<Manage2VO> selectManage2List(Manage2DefaultVO searchManage2VO) throws IOException, SQLException;
	
	int selectManage2ListToCnt(Manage2DefaultVO searchManage2VO) throws IOException, SQLException;
	
	Manage2VO selectManage2Info(Manage2VO vo) throws IOException, SQLException;
	
	void manage2Add(Manage2VO vo) throws IOException, SQLException;
	void manage2RoleAdd(Manage2VO vo) throws IOException, SQLException;
	
	void manage2Mod(Manage2VO vo) throws IOException, SQLException;
	
	int manage2Del(Manage2VO vo) throws IOException, SQLException;
	int manage2RoleDel(Manage2VO vo) throws IOException, SQLException;
	int manage2InquiryDel(Manage2VO vo) throws IOException, SQLException;
	int manage2EmailDel(Manage2VO vo) throws IOException, SQLException;
	int manage2PhoneDel(Manage2VO vo) throws IOException, SQLException;
	
	List<Manage2VO> selectManage2ListExcel(Manage2DefaultVO searchManage2VO) throws IOException, SQLException;

	void manageCommissionActiveMod(Manage2VO vo) throws IOException, SQLException;

	int manageCommissionAdd(Manage2VO vo) throws IOException, SQLException;

}
