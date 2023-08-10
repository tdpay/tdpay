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
package egovframework.example.settlement.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.settlement.service.SettlementDefaultVO;
import egovframework.example.settlement.service.SettlementService;
import egovframework.example.settlement.service.SettlementVO;
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

@Service("settlementService")
public class SettlementServiceImpl extends EgovAbstractServiceImpl implements SettlementService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SettlementServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
    @Resource(name="settlementMapper")
	private SettlementMapper settlementDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<SettlementVO> selectCalendarList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectCalendarList(searchSettlementVO);
	}
	
	@Override
	public SettlementVO storeidSearch(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.storeidSearch(searchSettlementVO);
	}
	
	@Override
	public List<SettlementVO> selectCalendarData(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectCalendarData(searchSettlementVO);
	}
//	@Override
//	public SettlementVO selectCalendarData(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
//		return settlementDAO.selectCalendarData(searchSettlementVO);
//	}
	
	@Override
	public List<SettlementVO> selectSettlementAllList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementAllList(searchSettlementVO);
	}
	@Override
	public List<SettlementVO> selectSettlementAllDetail(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementAllDetail(searchSettlementVO);
	}
	
	@Override
	public SettlementVO selectSettlementAllListCnt(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementAllListCnt(searchSettlementVO);
	}
	@Override
	public List<SettlementVO> selectSettlementAllListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementAllListExcel(searchSettlementVO);
	}
	
	@Override
	public SettlementVO selectSettlementAllInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementAllInfo(searchSettlementVO);
	}
	
	@Override
	public void settlementAllHoldAdd(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		settlementDAO.settlementAllHoldAdd(searchSettlementVO);
	}
	
	@Override
	public void settlementAllHoldDel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		settlementDAO.settlementAllHoldDel(searchSettlementVO);
	}
	
	@Override
	public List<SettlementVO> selectSettlementHisList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementHisList(searchSettlementVO);
	}
	
	@Override
	public SettlementVO selectSettlementAllTotalInfo(SettlementDefaultVO searchSettlementVO)
			throws IOException, SQLException {
		
		return settlementDAO.selectSettlementAllTotalInfo(searchSettlementVO);
	}

	@Override
	public SettlementVO selectSettlementHisListCnt(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementHisListCnt(searchSettlementVO);
	}
	@Override
	public List<SettlementVO> selectSettlementHisListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementHisListExcel(searchSettlementVO);
	}
	
	@Override
	public SettlementVO selectSettlementHisInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementHisInfo(searchSettlementVO);
	}
	
	@Override
	public List<SettlementVO> selectSettlementManageListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementManageListExcel(searchSettlementVO);
	}	
	
	@Override
	public List<SettlementVO> selectSettlementManageDetailList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementManageDetailList(searchSettlementVO);
	}
	
	@Override
	public List<SettlementVO> selectSettlementManageList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementManageList(searchSettlementVO);
	}

	@Override
	public List<SettlementVO> selectBranchSettlementManageList(SettlementDefaultVO searchSettlementVO)
			throws IOException, SQLException {
				return settlementDAO.selectBranchSettlementManageList(searchSettlementVO);
	}	
	
	@Override
	public List<SettlementVO> selectSettlementManageListExcel2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementManageListExcel2(searchSettlementVO);
	}
	
	/*
	 * 부가세신고자료 - 신용카드 (가맹점 매출 세금계산서)
	 */
	@Override
	public List<SettlementVO> selectSettlementVatReportList1(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportList1(searchSettlementVO);
	}
	@Override
	public int selectSettlementVatReportListCnt1(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportListCnt1(searchSettlementVO);
	}
	@Override
	public List<SettlementVO> selectSettlementVatReportList1Excel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportList1Excel(searchSettlementVO);
	}
	
	/*
	 * 부가세신고자료 - 신용카드 (가맹점 매출 세금계산서) 합계
	 */
	@Override
	public SettlementVO selectSettlementVatReportSum1(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportSum1(searchSettlementVO);
	}
	
	/*
	 * 부가세신고자료 - 신용카드 (대리점 매입 세금계산서)
	 */	
	@Override
	public List<SettlementVO> selectSettlementVatReportList2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportList2(searchSettlementVO);
	}
	@Override
	public int selectSettlementVatReportListCnt2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportListCnt2(searchSettlementVO);
	}
	@Override
	public List<SettlementVO> selectSettlementVatReportList2Excel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportList2Excel(searchSettlementVO);
	}
	
	/*
	 * 부가세신고자료 - 신용카드 (대리점 매입 세금계산서) 합계
	 */	
	@Override
	public SettlementVO selectSettlementVatReportSum2(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportSum2(searchSettlementVO);
	}
	
	/*
	 * 부가세신고자료 - 신용카드 (영업대행 매입 세금계산서)
	 */	
	@Override
	public List<SettlementVO> selectSettlementVatReportList3(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportList3(searchSettlementVO);
	}
	@Override
	public int selectSettlementVatReportListCnt3(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportListCnt3(searchSettlementVO);
	}
	@Override
	public List<SettlementVO> selectSettlementVatReportList3Excel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportList3Excel(searchSettlementVO);
	}
	
	/*
	 * 부가세신고자료 - 신용카드 (영업대행 매입 세금계산서) 합계
	 */	
	@Override
	public SettlementVO selectSettlementVatReportSum3(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementVatReportSum3(searchSettlementVO);
	}
	
	@Override
	public List<SettlementVO> selectSettlementCardAllList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException{
		return settlementDAO.selectSettlementCardAllList(searchSettlementVO);
	}
	
	@Override
	public SettlementVO selectSettlementCardAllTotalInfo(SettlementDefaultVO searchSettlementVO)
			throws IOException, SQLException {
		
		return settlementDAO.selectSettlementCardAllTotalInfo(searchSettlementVO);
	}
}
