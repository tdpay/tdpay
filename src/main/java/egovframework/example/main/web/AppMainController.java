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
package egovframework.example.main.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.cmmn.DataUtil;
import egovframework.example.main.service.MainDefaultVO;
import egovframework.example.main.service.MainService;
import egovframework.example.main.service.MainVO;
import egovframework.example.settlement.service.SettlementVO;
import egovframework.example.settlement.web.AppSettlementController;
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
public class AppMainController {
	
	Logger logger = LoggerFactory.getLogger(AppMainController.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	/** EgovSampleService */
	@Resource(name = "mainService")
	private MainService mainService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/main/main.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_main(MainDefaultVO searchMainVO, HttpSession session, Model model) throws IOException, SQLException {

		String role_id = (String)session.getAttribute("role_id");
		String store_id = (String)session.getAttribute("login_id");
		if(role_id.equals("1002")) {
			searchMainVO.setHigh_store_id(store_id);
		}else if(role_id.equals("1003")) {
			searchMainVO.setHigh_store_id2(store_id);
		}else if(role_id.equals("1004")) {
			searchMainVO.setStore_id(store_id);
		}
		
		Calendar mon = Calendar.getInstance();
        String yyyy = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
        searchMainVO.setYyyy(yyyy);
        
		String ym = new java.text.SimpleDateFormat("yyyyMM").format(mon.getTime());
		searchMainVO.setYm(ym);
		
		String ymd = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
		searchMainVO.setStart_datetime(ymd);
		searchMainVO.setEnd_datetime(ymd);
		logger.debug(searchMainVO.getStart_datetime());
		logger.debug(searchMainVO.getEnd_datetime());
		MainVO selectMainSettlementAllListCnt = mainService.selectMainSettlementAllListCnt(searchMainVO);
		String sett_tocnt1 = selectMainSettlementAllListCnt.getTocnt();
		String sett_amount1 = selectMainSettlementAllListCnt.getAmount();

		searchMainVO.setStart_datetime(new java.text.SimpleDateFormat("yyyy-MM").format(mon.getTime())+"-01");
		searchMainVO.setEnd_datetime(ymd);
		logger.debug(searchMainVO.getStart_datetime());
		logger.debug(searchMainVO.getEnd_datetime());	
		selectMainSettlementAllListCnt = mainService.selectMainSettlementAllListCnt(searchMainVO);
		String sett_tocnt2 = selectMainSettlementAllListCnt.getTocnt();
		String sett_amount2 = selectMainSettlementAllListCnt.getAmount();
		
		String preYmd = DataUtil.getPrevDate2(ym);
		searchMainVO.setStart_datetime(yyyy+"-"+preYmd+"-01");
		searchMainVO.setEnd_datetime(yyyy+"-"+preYmd+"-31");
		logger.debug(searchMainVO.getStart_datetime());
		logger.debug(searchMainVO.getEnd_datetime());		
		selectMainSettlementAllListCnt = mainService.selectMainSettlementAllListCnt(searchMainVO);
		String sett_tocnt3 = selectMainSettlementAllListCnt.getTocnt();
		String sett_amount3 = selectMainSettlementAllListCnt.getAmount();
		
		searchMainVO.setStart_datetime(yyyy+"-01-01");
		searchMainVO.setEnd_datetime(ymd);
		logger.debug(searchMainVO.getStart_datetime());
		logger.debug(searchMainVO.getEnd_datetime());		
		selectMainSettlementAllListCnt = mainService.selectMainSettlementAllListCnt(searchMainVO);
		String sett_tocnt4 = selectMainSettlementAllListCnt.getTocnt();
		String sett_amount4 = selectMainSettlementAllListCnt.getAmount();
		
		searchMainVO.setRole_id(role_id);
		List<MainVO> selectCalendarList = mainService.selectMainCalendarList(searchMainVO);
		MainVO mainVO = mainService.selectMainCalendarData(searchMainVO);
		
		
		MainVO selectMainSettlementHisListCnt = mainService.selectMainSettlementHisListCnt(searchMainVO);
		MainVO selectMainHistoryFailListCnt = mainService.selectMainHistoryFailListCnt(searchMainVO);
		
		/** EgovPropertyService.sample */
		searchMainVO.setPageUnit(3);
		searchMainVO.setPageSize(1);

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchMainVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchMainVO.getPageUnit());
		paginationInfo.setPageSize(searchMainVO.getPageSize());

		searchMainVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchMainVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchMainVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<MainVO> selectMainNotice01List = mainService.selectMainNotice01List(searchMainVO);
		List<MainVO> selectMainNotice02List = mainService.selectMainNotice02List(searchMainVO);
		List<MainVO> selectMainNotice03List = mainService.selectMainNotice03List(searchMainVO);
		
		model.addAttribute("sett_tocnt1", sett_tocnt1);
		model.addAttribute("sett_amount1", sett_amount1);
		model.addAttribute("sett_tocnt2", sett_tocnt2);
		model.addAttribute("sett_amount2", sett_amount2);
		model.addAttribute("sett_tocnt3", sett_tocnt3);
		model.addAttribute("sett_amount3", sett_amount3);
		model.addAttribute("sett_tocnt4", sett_tocnt4);
		model.addAttribute("sett_amount4", sett_amount4);
		
		model.addAttribute("mm", new java.text.SimpleDateFormat("MM").format(mon.getTime()));
		model.addAttribute("selectCalendarList", selectCalendarList);
		model.addAttribute("mainVO", mainVO);
		model.addAttribute("tocnt1", selectMainSettlementHisListCnt.getTocnt());
		model.addAttribute("tocnt2", selectMainHistoryFailListCnt.getTocnt());
		model.addAttribute("selectMainNotice01List", selectMainNotice01List);
		model.addAttribute("selectMainNotice02List", selectMainNotice02List);
		model.addAttribute("selectMainNotice03List", selectMainNotice03List);
		
		return "app/main/main";
	}
}
