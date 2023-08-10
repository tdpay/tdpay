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
package egovframework.example.main.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.main.service.MainDefaultVO;
import egovframework.example.main.service.MainService;
import egovframework.example.main.service.MainVO;
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

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MainServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="mainMapper")
	private MainMapper mainDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public MainVO selectMainSettlementAllListCnt(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainSettlementAllListCnt(searchMainVO);
	}
	
	@Override
	public List<MainVO> selectMainCalendarList(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainCalendarList(searchMainVO);
	}
	@Override
	public MainVO selectMainCalendarData(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainCalendarData(searchMainVO);
	}
	
	@Override
	public MainVO selectMainSettlementHisListCnt(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainSettlementHisListCnt(searchMainVO);
	}
	@Override
	public MainVO selectMainHistoryFailListCnt(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainHistoryFailListCnt(searchMainVO);
	}
	
	@Override
	public List<MainVO> selectMainNotice01List(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainNotice01List(searchMainVO);
	}
	@Override
	public List<MainVO> selectMainNotice02List(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainNotice02List(searchMainVO);
	}
	@Override
	public List<MainVO> selectMainNotice03List(MainDefaultVO searchMainVO) throws IOException, SQLException {
		return mainDAO.selectMainNotice03List(searchMainVO);
	}
}
