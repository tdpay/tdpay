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
package egovframework.example.settlement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.cmmn.DataUtil;
import egovframework.example.settlement.service.SettlementDefaultVO;
import egovframework.example.settlement.service.SettlementService;
import egovframework.example.settlement.service.SettlementVO;
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
public class AppSettlementController {

	Logger logger = LoggerFactory.getLogger(AppSettlementController.class);
	/** EgovSampleService */
	@Resource(name = "settlementService")
	private SettlementService settlementService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/settlement/{pageId}")
	public String getAppSettlement(@PathVariable("pageId") String pageId, Model model) throws Exception {

		return "app/settlement/"+pageId;
	}
	
	@RequestMapping(value = "/app/settlement/calendar.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_calender(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		Calendar mon = Calendar.getInstance();
		logger.debug("getYyyy : "+searchSettlementVO.getYyyy());
		if(searchSettlementVO.getYyyy() == null || "".equals(searchSettlementVO.getYyyy())) {
	        String yyyy = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
			searchSettlementVO.setYyyy(yyyy);
		}
		logger.debug("getYm : "+searchSettlementVO.getYm());
		if(searchSettlementVO.getYm() == null || "".equals(searchSettlementVO.getYm())) {
			String ym = new java.text.SimpleDateFormat("yyyyMM").format(mon.getTime());
			searchSettlementVO.setYm(ym);
		}
		List<SettlementVO> selectCalendarList = settlementService.selectCalendarList(searchSettlementVO);
		
		logger.debug("store_id : "+searchSettlementVO.getStore_id());
		if(searchSettlementVO.getStore_id() != null && !searchSettlementVO.getStore_id().equals("")) {
			List<SettlementVO> settlementVo = settlementService.selectCalendarData(searchSettlementVO);
			model.addAttribute("settlementVo", settlementVo);
		}
		
		model.addAttribute("resultList", selectCalendarList);
		model.addAttribute("store_id", searchSettlementVO.getStore_id());
		model.addAttribute("yyyy", searchSettlementVO.getYyyy());
		model.addAttribute("pre", DataUtil.getPrevDate2(searchSettlementVO.getYm()));
		model.addAttribute("now", DataUtil.getMaxDate2(searchSettlementVO.getYm()));
		model.addAttribute("afe", DataUtil.getNextDate2(searchSettlementVO.getYm()));
		
		return "app/settlement/calendar";
	}
	
	@RequestMapping(value = "/app/settlement/storeid_search.do", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String app_storeid_search(SettlementDefaultVO searchSettlementVO, Model model)
			throws IOException, SQLException {
		
		String result = null;
		
		SettlementVO settlementVo = settlementService.storeidSearch(searchSettlementVO);
		
		if(settlementVo != null) {
			result = settlementVo.getBusiness_nm();
		}else {
			result = "none";
		}
		
		logger.debug("result="+result);
		return result;		
	}
	
	
	@RequestMapping(value = "/app/settlement/settlement_all.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		
//		Calendar mon = Calendar.getInstance();
//		String month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
//		
//		if(searchSettlementVO.getStart_datetime() == null || "".equals(searchSettlementVO.getStart_datetime())) {
//			searchSettlementVO.setStart_datetime(month);
//		}
//		if(searchSettlementVO.getEnd_datetime() == null || "".equals(searchSettlementVO.getEnd_datetime())) {
//			searchSettlementVO.setEnd_datetime(month);
//		}
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());

		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementAllList = settlementService.selectSettlementAllList(searchSettlementVO);
		SettlementVO settlementVO = settlementService.selectSettlementAllListCnt(searchSettlementVO);
		int cnt = settlementVO.getTocnt();
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementAllList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", settlementVO.getAmount());
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		
		return "app/settlement/settlement_all";
	}
	@RequestMapping(value = "/app/settlement/settlement_all_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all_search(Model model) throws IOException {
		return "app/settlement/settlement_all_search";
	}
	@RequestMapping(value = "/app/settlement/settlement_all_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		SettlementVO settlementVO = settlementService.selectSettlementAllInfo(searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);		
		return "app/settlement/settlement_all_view";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_all_detail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all_detail(Model model) throws IOException {
		return "app/settlement/settlement_all_detail";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_all_detail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all_detail_view(Model model) throws IOException {
		return "app/settlement/settlement_all_detail_view";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_all_hold.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all_hold(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		settlementService.settlementAllHoldAdd(searchSettlementVO);
		
		return "redirect:/app/settlement/settlement_all.do";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_all_mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_all_mod(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		settlementService.settlementAllHoldDel(searchSettlementVO);
		
		return "redirect:/app/settlement/settlement_his.do";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_manage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_manage(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_manage";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_manage_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_manage_search(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_manage_search";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_manage_detail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_manage_detail(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_manage_detail";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_manage_detail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_manage_detail_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_manage_detail_view";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_branch.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_branch(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_branch";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_branch_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_branch_search(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_branch_search";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_branch_detail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_branch_detail(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_branch_detail";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_branch_detail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_branch_detail_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_branch_detail_view";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_store.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_store(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_store";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_store_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_store_search(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_store_search";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_store_detail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_store_detail(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_store_detail";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_store_detail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_store_detail_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		
		return "app/settlement/settlement_store_detail_view";
	}
	
	@RequestMapping(value = "/app/settlement/settlement_his.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_his(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
//		Calendar mon = Calendar.getInstance();
//		String month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
//		
//		if(searchSettlementVO.getStart_datetime() == null || "".equals(searchSettlementVO.getStart_datetime())) {
//			searchSettlementVO.setStart_datetime(month);
//		}
//		if(searchSettlementVO.getEnd_datetime() == null || "".equals(searchSettlementVO.getEnd_datetime())) {
//			searchSettlementVO.setEnd_datetime(month);
//		}
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());

		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementHisList = settlementService.selectSettlementHisList(searchSettlementVO);
		SettlementVO settlementVO = settlementService.selectSettlementHisListCnt(searchSettlementVO);
		int cnt = settlementVO.getTocnt();
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementHisList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", settlementVO.getAmount());
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		
		return "app/settlement/settlement_his";
	}
	@RequestMapping(value = "/app/settlement/settlement_his_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_his_search(Model model) throws IOException {
		return "app/settlement/settlement_his_search";
	}
	@RequestMapping(value = "/app/settlement/settlement_his_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_settlement_his_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		SettlementVO settlementVO = settlementService.selectSettlementHisInfo(searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);		
		return "app/settlement/settlement_his_view";
	}
	
	@RequestMapping(value = "/app/settlement/vat_report.do")
	public String app_vat_report(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		return "app/settlement/vat_report";
	}	
}
