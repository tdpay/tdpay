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
package egovframework.example.settlement.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import egovframework.example.settlement.service.SettlementDefaultVO;
import egovframework.example.settlement.service.SettlementVO;
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
@Mapper("settlementMapper")
public interface SettlementMapper {

	List<SettlementVO> selectCalendarList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	SettlementVO storeidSearch(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectCalendarData(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
//	SettlementVO selectCalendarData(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementAllList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementAllTotalInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementAllDetail(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementCardAllList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementCardAllTotalInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	SettlementVO selectSettlementAllListCnt(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementAllListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementAllInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	void settlementAllHoldAdd(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	void settlementAllHoldDel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementHisList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementHisListCnt(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementHisListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	SettlementVO selectSettlementHisInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementManageList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementManageDetailList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementManageListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;

	List<SettlementVO> selectBranchSettlementManageList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementManageListExcel2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	/*
	 * 부가세신고자료 - 신용카드 (가맹점 매출 세금계산서)
	 */
	List<SettlementVO> selectSettlementVatReportList1(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	int selectSettlementVatReportListCnt1(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementVatReportList1Excel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	/*
	 * 부가세신고자료 - 신용카드 (가맹점 매출 세금계산서) 합계
	 */
	SettlementVO selectSettlementVatReportSum1(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	/*
	 * 부가세신고자료 - 신용카드 (대리점 매입 세금계산서)
	 */	
	List<SettlementVO> selectSettlementVatReportList2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	int selectSettlementVatReportListCnt2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementVatReportList2Excel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	/*
	 * 부가세신고자료 - 신용카드 (대리점 매입 세금계산서) 합계
	 */	
	SettlementVO selectSettlementVatReportSum2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	/*
	 * 부가세신고자료 - 신용카드 (영업대행 매입 세금계산서)
	 */	
	List<SettlementVO> selectSettlementVatReportList3(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	int selectSettlementVatReportListCnt3(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementVatReportList3Excel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	/*
	 * 부가세신고자료 - 신용카드 (영업대행 매입 세금계산서) 합계
	 */	
	SettlementVO selectSettlementVatReportSum3(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
}
