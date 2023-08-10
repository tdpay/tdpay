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
package egovframework.example.history.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.history.service.HistoryDefaultVO;
import egovframework.example.history.service.HistoryService;
import egovframework.example.history.service.HistoryVO;
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
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class AppHistoryController {

	/** EgovSampleService */
	@Resource(name = "historyService")
	private HistoryService historyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/history/history_all.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_all(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		Calendar mon = Calendar.getInstance();
		String month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
		
		if(searchHistoryVO.getStart_datetime() == null || "".equals(searchHistoryVO.getStart_datetime())) {
			searchHistoryVO.setStart_datetime(month);
		}
		if(searchHistoryVO.getEnd_datetime() == null || "".equals(searchHistoryVO.getEnd_datetime())) {
			searchHistoryVO.setEnd_datetime(month);
		}
		
		/** EgovPropertyService.sample */
		searchHistoryVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchHistoryVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchHistoryVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchHistoryVO.getPageUnit());
		paginationInfo.setPageSize(searchHistoryVO.getPageSize());

		searchHistoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchHistoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchHistoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<HistoryVO> selectHistoryList = historyService.selectHistoryList(searchHistoryVO);
		HistoryVO historyVO = historyService.selectHistoryTotalInfo(searchHistoryVO);
		int cnt = 0; 
		
		if(historyVO != null) {
			cnt = Integer.parseInt(historyVO.getTotal_cnt());
		}
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectHistoryList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchHistoryVO.getPageUnit());
		model.addAttribute("historyVO", historyVO);
		
		return "app/history/history_all";
	}
	
	@RequestMapping(value = "/app/history/history_all_detail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_all_detail(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
//		Calendar mon = Calendar.getInstance();
//		String month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
//		
//		if(searchHistoryVO.getStart_datetime() == null || "".equals(searchHistoryVO.getStart_datetime())) {
//			searchHistoryVO.setStart_datetime(month);
//		}
//		if(searchHistoryVO.getEnd_datetime() == null || "".equals(searchHistoryVO.getEnd_datetime())) {
//			searchHistoryVO.setEnd_datetime(month);
//		}
		
		/** EgovPropertyService.sample */
		searchHistoryVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchHistoryVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchHistoryVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchHistoryVO.getPageUnit());
		paginationInfo.setPageSize(searchHistoryVO.getPageSize());

		searchHistoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchHistoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchHistoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<HistoryVO> selectHistoryList = historyService.selectHistoryList(searchHistoryVO);
		HistoryVO historyVO = historyService.selectHistoryTotalInfo(searchHistoryVO);
		int cnt = 0; 
		
		if(historyVO != null) {
			cnt = Integer.parseInt(historyVO.getTotal_cnt());
		}
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectHistoryList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchHistoryVO.getPageUnit());
		model.addAttribute("historyVO", historyVO);
		
		return "app/history/history_all_detail";
	}
	
	@RequestMapping(value = "/app/history/history_all_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_all_search(Model model) throws IOException, SQLException {
		return "app/history/history_all_search";
	}
	
	@RequestMapping(value = "/app/history/history_all_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_all_view(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		HistoryVO historyVo = historyService.selectHistoryInfo(searchHistoryVO);
		model.addAttribute("historyVo", historyVo);
		return "app/history/history_all_view";
	}
	
	@RequestMapping(value = "/app/history/history_all_detail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_all_detail_view(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		HistoryVO historyVo = historyService.selectHistoryInfo(searchHistoryVO);
		model.addAttribute("historyVo", historyVo);
		return "app/history/history_all_detail_view";
	}
	
	@RequestMapping(value = "/app/history/history_fail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_fail(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
//		Calendar mon = Calendar.getInstance();
//		String month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
//		
//		if(searchHistoryVO.getStart_datetime() == null || "".equals(searchHistoryVO.getStart_datetime())) {
//			searchHistoryVO.setStart_datetime(month);
//		}
//		if(searchHistoryVO.getEnd_datetime() == null || "".equals(searchHistoryVO.getEnd_datetime())) {
//			searchHistoryVO.setEnd_datetime(month);
//		}
		
		/** EgovPropertyService.sample */
		searchHistoryVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchHistoryVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchHistoryVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchHistoryVO.getPageUnit());
		paginationInfo.setPageSize(searchHistoryVO.getPageSize());

		searchHistoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchHistoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchHistoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<HistoryVO> selectHistoryFailList = historyService.selectHistoryFailList(searchHistoryVO);
		HistoryVO historyVO = historyService.selectHistoryFailListCnt(searchHistoryVO);
		int cnt = historyVO.getTocnt();
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectHistoryFailList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", historyVO.getAmount());
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchHistoryVO.getPageUnit());
		
		return "app/history/history_fail";
	}
	
	@RequestMapping(value = "/app/history/history_fail_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_fail_search(Model model) throws IOException, SQLException {
		return "app/history/history_fail_search";
	}
	
	@RequestMapping(value = "/app/history/history_fail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_fail_view(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		HistoryVO historyVo = historyService.selectHistoryFailInfo(searchHistoryVO);
		model.addAttribute("historyVo", historyVo);		
		return "app/history/history_fail_view";
	}
	
	@RequestMapping(value = "/app/history/history_deduct.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_history_deduct(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		return "app/history/history_deduct";
	}
}
