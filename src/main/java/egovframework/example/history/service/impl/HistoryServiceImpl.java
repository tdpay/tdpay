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
package egovframework.example.history.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.history.service.HistoryDefaultVO;
import egovframework.example.history.service.HistoryService;
import egovframework.example.history.service.HistoryVO;
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

@Service("historyService")
public class HistoryServiceImpl extends EgovAbstractServiceImpl implements HistoryService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HistoryServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="historyMapper")
	private HistoryMapper historyDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<HistoryVO> selectHistoryList(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryList(searchHistoryVO);
	}
	@Override
	public HistoryVO selectHistoryTotalInfo(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryTotalInfo(searchHistoryVO);
	}
	@Override
	public HistoryVO selectHistoryListCnt(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryListCnt(searchHistoryVO);
	}
	@Override
	public List<HistoryVO> selectHistoryDetailList(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryDetailList(searchHistoryVO);
	}	
	@Override
	public List<HistoryVO> selectHistoryListExcel(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryListExcel(searchHistoryVO);
	}
	
	@Override
	public HistoryVO selectHistoryInfo(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryInfo(searchHistoryVO);
	}
	
	@Override
	public List<HistoryVO> selectHistoryFailList(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryFailList(searchHistoryVO);
	}
	@Override
	public HistoryVO selectHistoryFailListCnt(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryFailListCnt(searchHistoryVO);
	}
	@Override
	public List<HistoryVO> selectHistoryFailListExcel(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryFailListExcel(searchHistoryVO);
	}
	
	@Override
	public HistoryVO selectHistoryFailInfo(HistoryDefaultVO searchHistoryVO) throws IOException, SQLException {
		return historyDAO.selectHistoryFailInfo(searchHistoryVO);
	}
}
