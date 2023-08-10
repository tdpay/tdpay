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
package egovframework.example.cmmn.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Tag에 관한 데이터처리 매퍼 클래스
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
@Mapper("commonMapper")
public interface CommonMapper {

	List<Map<String, String>> commonBankList(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> commonhighStoreIdList(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> commonhighStoreId2List(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> commonhighStoreId3List(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> commonEmailList(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> commonHighStoreList(Map<String, String> params) throws IOException, SQLException;
	
	List<Map<String, String>> commonCardCodeList(Map<String, String> params) throws IOException, SQLException;
	
	int checkId(Map<String, String> params) throws IOException, SQLException;
	
	int store_id(Map<String, String> params) throws IOException, SQLException;
	
	String cp_id(String store_id) throws IOException, SQLException;
	
	Map<String, String> fileInfo(Map<String, String> params) throws IOException, SQLException;
	
}
