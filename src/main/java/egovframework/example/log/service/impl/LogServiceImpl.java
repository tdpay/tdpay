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
package egovframework.example.log.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.log.service.LogDefaultVO;
import egovframework.example.log.service.LogService;
import egovframework.example.log.service.LogVO;
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

@Service("logService")
public class LogServiceImpl extends EgovAbstractServiceImpl implements LogService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LogServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="logMapper")
	private LogMapper logDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<LogVO> selectLogList(LogDefaultVO searchLogVO) throws IOException, SQLException {
		return logDAO.selectLogList(searchLogVO);
	}
	
	@Override
	public int selectLogListCnt(LogDefaultVO searchLogVO) throws IOException, SQLException {
		return logDAO.selectLogListCnt(searchLogVO);
	}
	@Override
	public void logDel(LogDefaultVO searchLogVO) throws IOException, SQLException {
		logDAO.logDel(searchLogVO);
	}
	
}
