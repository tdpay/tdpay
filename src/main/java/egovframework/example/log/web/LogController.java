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
package egovframework.example.log.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.log.service.LogDefaultVO;
import egovframework.example.log.service.LogService;
import egovframework.example.log.service.LogVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *r
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class LogController {
	
	Logger logger = LoggerFactory.getLogger(LogController.class);
	
	
	/** EgovSampleService */
	@Resource(name = "logService")
	private LogService logService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/log/log.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String log(LogDefaultVO searchLogVO, Model model) throws IOException {
		
		return "log/log";
	}
	
	@RequestMapping(value = "/log/log_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String log_data(LogDefaultVO searchLogVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchLogVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchLogVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchLogVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchLogVO.getPageUnit());
		paginationInfo.setPageSize(searchLogVO.getPageSize());

		searchLogVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchLogVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchLogVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<LogVO> selectLogList = logService.selectLogList(searchLogVO);
		int cnt = logService.selectLogListCnt(searchLogVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectLogList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "log/data/log_data";
	}
	
	@RequestMapping(value = "/log/logDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object logDel(LogDefaultVO searchLogVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		searchLogVO.setList(searchLogVO.getArr_check_id().split(","));
		
		logService.logDel(searchLogVO);
		return result;
	}
}
