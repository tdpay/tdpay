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
package egovframework.example.setup.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.setup.service.SetupDefaultVO;
import egovframework.example.setup.service.SetupService;
import egovframework.example.setup.service.SetupVO;
import egovframework.example.user.service.MailSendService;
import egovframework.example.user.service.SmsSendService;
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
public class SetupController {

	Logger logger = LoggerFactory.getLogger(SetupController.class);

	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
    @Autowired
    private SmsSendService smsSendService;
    
    @Autowired
    private MailSendService mss;
    
	/** EgovSampleService */
	@Resource(name = "setupService")
	private SetupService setupService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/setup/setup_bank.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_bank(SetupDefaultVO searchSetupVO, Model model) throws IOException {
		
		return "setup/setup_bank";
	}
	
	@RequestMapping(value = "/setup/setup_bank_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_bank_data(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		List<SetupVO> setupBankList = setupService.setupBankList(searchSetupVO);
		model.addAttribute("resultList", setupBankList);
		
		return "setup/data/setup_bank_data";
	}
	
	@RequestMapping(value = "/setup/pg_manage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String pg_manage(SetupDefaultVO searchSetupVO, Model model) throws IOException {
		
		return "setup/pg_manage";
	}
	
	@RequestMapping(value = "/setup/pg_manage_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String pg_manage_data(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		List<SetupVO> setupBankList = setupService.setupBankList(searchSetupVO);
		model.addAttribute("resultList", setupBankList);
		
		return "setup/data/pg_manage_data";
	}
	
	@RequestMapping(value = "/setup/setupBankAdd.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object setupBankAdd(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupBankAdd(searchSetupVO);
		return result;
	}
	
	@RequestMapping(value = "/setup/setupBankDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object setupBankDel(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		setupService.setupBankDel(searchSetupVO);
		return result;
	}
	
	@RequestMapping(value = "/setup/setup_login.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_login(SetupDefaultVO searchSetupVO, Model model) throws IOException {
		
		return "setup/setup_login";
	}
	
	@RequestMapping(value = "/setup/setup_login_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_login_data(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		List<SetupVO> setupAuthList = setupService.setupAuthList(searchSetupVO);
		model.addAttribute("resultList", setupAuthList);
		
		return "setup/data/setup_login_data";
	}
	
	@RequestMapping(value = "/setup/setupLoginDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object setup_setupLoginDel(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		setupService.setupPhoneEmailDel(searchSetupVO);
		
		return result;
		
	}
	
	@RequestMapping(value = "/setup/AuthAction.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String setup_AuthAction(SetupDefaultVO searchSetupVO, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		
		if(searchSetupVO.getType().equals("1")) {
			
			result = smsSendService.sendAuthSms(searchSetupVO.getCheck_no());
			session.setAttribute("smsAuthKey",	result);
			
		}else if(searchSetupVO.getType().equals("2")) {
			
			result = mss.sendAuthMail(searchSetupVO.getCheck_no());
			session.setAttribute("mailAuthKey",	result);
		}
		
		return searchSetupVO.getType();		
	}
	
	@RequestMapping(value = "/setup/AuthActionCehck.do", method = RequestMethod.POST)
	public @ResponseBody String setup_AuthActionCheck(SetupDefaultVO searchSetupVO, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		
		if(searchSetupVO.getType().equals("1")) {
			
			String smsAuthKey = (String) session.getAttribute("smsAuthKey");
			if(searchSetupVO.getAuth_no().equals(smsAuthKey)) {
				result = "AUTH_SUCCESS";
			}else {
				result = "AUTH_FALSE";
			}
			
		}else if(searchSetupVO.getType().equals("2")) {
			
			String mailAuthKey = (String) session.getAttribute("mailAuthKey");
			if(searchSetupVO.getAuth_no().equals(mailAuthKey)) {
				result = "AUTH_SUCCESS";
			}else {
				result = "AUTH_FALSE";
			}
		}
		
		logger.debug("searchSetupVO.getType()=="+searchSetupVO.getType());
		logger.debug("searchSetupVO.getSetup_auth_no()=="+searchSetupVO.getAuth_no());
		logger.debug("result=="+result);
		
		return result;		
	}
	
	@RequestMapping(value = "/setup/AuthActionAdd.do", method = RequestMethod.POST)
	public @ResponseBody String setup_AuthActionAdd(SetupDefaultVO searchSetupVO, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		
		if(searchSetupVO.getType().equals("1")) {
			
			searchSetupVO.setPhone_num(searchSetupVO.getCheck_no());
			setupService.setupPhoneNumAdd(searchSetupVO);
			
		}else if(searchSetupVO.getType().equals("2")) {
			
			searchSetupVO.setEmail(searchSetupVO.getCheck_no());
			setupService.setupEmailAdd(searchSetupVO);
		}
		
		return result;		
	}
	
	@RequestMapping(value = "/setup/setup_admin.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_admin(SetupDefaultVO searchSetupVO, HttpSession session, Model model) throws IOException, SQLException {
		
		model.addAttribute("view_type", searchSetupVO.getView_type());
		
		if(searchSetupVO.getView_type() != null && searchSetupVO.getView_type().equals("L")) {
			searchSetupVO = (SetupDefaultVO) session.getAttribute("searchSetupVO");
			model.addAttribute("searchSetupVO", searchSetupVO);
		}else {
			session.setAttribute("searchSetupVO",	searchSetupVO);
		}
		
		return "setup/setup_admin";
	}
	
	@RequestMapping(value = "/setup/setup_admin_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_admin_data(SetupDefaultVO searchSetupVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchSetupVO.getView_type().equals("L")) {

			searchSetupVO = (SetupDefaultVO) session.getAttribute("searchSetupVO");
			/** EgovPropertyService.sample */
			searchSetupVO.setPageUnit(searchSetupVO.getPageUnit());
			searchSetupVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchSetupVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchSetupVO.getPageUnit());
			paginationInfo.setPageSize(searchSetupVO.getPageSize());
			
			searchSetupVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchSetupVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchSetupVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
			
			List<SetupVO> selectSetupList = setupService.selectSetupList(searchSetupVO);
			int cnt = setupService.selectSetupListCnt(searchSetupVO);
			
			paginationInfo.setTotalRecordCount(cnt);
			
			model.addAttribute("resultList", selectSetupList);
			model.addAttribute("cnt", cnt);
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchSetupVO.getPageUnit());

		}else {

			/** EgovPropertyService.sample */
			searchSetupVO.setPageUnit(searchSetupVO.getPageUnit());
			searchSetupVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchSetupVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchSetupVO.getPageUnit());
			paginationInfo.setPageSize(searchSetupVO.getPageSize());
			
			searchSetupVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchSetupVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchSetupVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
			
			List<SetupVO> selectSetupList = setupService.selectSetupList(searchSetupVO);
			int cnt = setupService.selectSetupListCnt(searchSetupVO);
			
			paginationInfo.setTotalRecordCount(cnt);
			
			model.addAttribute("resultList", selectSetupList);
			model.addAttribute("cnt", cnt);
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchSetupVO.getPageUnit());
		}
		
		
		session.setAttribute("searchSetupVO",	searchSetupVO);
		
		return "setup/data/setup_admin_data";
	}
	
	
	@RequestMapping(value = "/setup/setup_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_register(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		List<SetupVO> setupMenuList = setupService.setupMenuList(searchSetupVO);
		List<SetupVO> setupMenuList2 = setupService.setupMenuList2(searchSetupVO);
		
		model.addAttribute("resultList", setupMenuList);
		model.addAttribute("resultList2", setupMenuList2);
		return "setup/setup_register";
	}
	
	@RequestMapping(value = "/setup/setupAdd.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setupAdd(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		searchSetupVO.setPasswd(passwordEncoder.encode(searchSetupVO.getPasswd()));
		setupService.setupAdd(searchSetupVO);
		
		return "redirect:/setup/setup_admin.do";
	}
	
	@RequestMapping(value = "/setup/setup_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_modify(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		SetupVO setupVO = setupService.setupStoreInfo(searchSetupVO);
		List<SetupVO> setupMenuList = setupService.setupMenuList(searchSetupVO);
		List<SetupVO> setupMenuList2 = setupService.setupMenuListCheck(searchSetupVO);
		
		model.addAttribute("setupVO", setupVO);
		model.addAttribute("resultList", setupMenuList);
		model.addAttribute("resultList2", setupMenuList2);
		
		return "setup/setup_modify";
	}
	@RequestMapping(value = "/setup/setupMod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setupMod(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		setupService.setupMod(searchSetupVO);
		
		return "redirect:/setup/setup_admin.do";
	}
	
	@RequestMapping(value = "/setup/setupDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setupDel(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		setupService.setupDel(searchSetupVO);
		
		return "redirect:/setup/setup_admin.do";
	}
	
	@RequestMapping(value = "/setup/setup_ip.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_ip(SetupDefaultVO searchSetupVO, Model model) throws IOException {
		
		return "setup/setup_ip";
	}
	
	@RequestMapping(value = "/setup/setup_ip_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_ip_data(SetupDefaultVO searchSetupVO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchSetupVO.setPageUnit(searchSetupVO.getPageUnit());
		searchSetupVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSetupVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSetupVO.getPageUnit());
		paginationInfo.setPageSize(searchSetupVO.getPageSize());
		
		searchSetupVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSetupVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSetupVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<SetupVO> selectSetupIpList = setupService.selectSetupIpList(searchSetupVO);
		int cnt = setupService.selectSetupIpListCnt(searchSetupVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSetupIpList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSetupVO.getPageUnit());
		
		return "setup/data/setup_ip_data";
	}
	
	@RequestMapping(value = "/setup/setup_ip_add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object setupIpAdd(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupIpAdd(searchSetupVO);
		
		return result;
	}
	
	@RequestMapping(value = "/setup/setup_ip_mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object setupIpMod(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupIpMod(searchSetupVO);
		
		return result;
	}
	
	@RequestMapping(value = "/setup/setup_ip_del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object setupIpDel(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupIpDel(searchSetupVO);
		
		return result;
	}
	

	

	
	@RequestMapping(value = "/setup/setup_card_fee.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_card_fee(SetupDefaultVO searchSetupVO, Model model) throws IOException {
		
		return "setup/setup_card_fee";
	}
	@RequestMapping(value = "/setup/setup_card_fee_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_card_fee_data(SetupDefaultVO searchSetupVO, HttpSession session, Model model) throws IOException, SQLException {
		
		List<SetupVO> selectSetupCardFeeList = setupService.selectSetupCardFeeList(searchSetupVO);
		model.addAttribute("resultList", selectSetupCardFeeList);
		
		return "setup/data/setup_card_fee_data";
	}
	@RequestMapping(value = "/setup/setup_card_fee_Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody int setup_card_fee_Add(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		int result=0;
		result = setupService.setupCardFeeAdd(searchSetupVO);
		
		return result;
	}	
	@RequestMapping(value = "/setup/setup_card_fee_Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public Object setup_card_fee_Del(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupCardFeeDel(searchSetupVO);
		model.addAttribute("delResult", result);
		return "redirect:/setup/setup_card_fee.do";  
	}
	
	@RequestMapping(value = "/setup/setup_card_fee_Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public Object setup_card_fee_Mod(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		
		System.out.println("arrCardfee===========>" + searchSetupVO.getCardfeeList());
		searchSetupVO.setCardfeeList(searchSetupVO.getCardfeeList());
		
		result = setupService.setupCardFeeMod(searchSetupVO);
		model.addAttribute("updateResult", result);
		return "redirect:/setup/setup_card_fee.do";  
	}
	
	@RequestMapping(value = "/setup/setup_pg_fee.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_pg_fee(SetupDefaultVO searchSetupVO, Model model) throws IOException {
		return "setup/setup_pg_fee";
	}	
	@RequestMapping(value = "/setup/setup_pg_fee_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String setup_pg_fee_data(SetupDefaultVO searchSetupVO, HttpSession session, Model model) throws IOException, SQLException {
		
		List<SetupVO> selectSetupPgFeeList = setupService.selectSetupPgFeeList(searchSetupVO);
		model.addAttribute("resultList", selectSetupPgFeeList);
		return "setup/data/setup_pg_fee_data";
	}	
	@RequestMapping(value = "/setup/setup_pg_fee_Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody int setup_pg_fee_Add(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		int result=0;
		searchSetupVO.setCreated_id("gmgMaster");
		result = setupService.setupPgFeeAdd(searchSetupVO);
	
		return result;
	}	
	@RequestMapping(value = "/setup/setup_pg_fee_Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public Object setup_pg_fee_Del(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupPgFeeDel(searchSetupVO);
		//model.addAttribute("delResult", result);
		return "redirect:/setup/setup_pg_fee.do";  
	}	
	@RequestMapping(value = "/setup/setup_pg_fee_Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public Object setup_pg_fee_Mod(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = setupService.setupPgFeeMod(searchSetupVO);
		
		return result;
	}	
	@RequestMapping(value = "/setup/setup_pg_list.do", method = {RequestMethod.POST, RequestMethod.GET}) 
	public String setup_pg_list(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		SetupVO selectSetupPgFeeListDetail = setupService.selectSetupPgFeeListDetail(searchSetupVO);
		model.addAttribute("resultList", selectSetupPgFeeListDetail);
		return "setup/setup_pg_list";
	}
	
	@RequestMapping(value = "/setup/setup_permission.do", method = {RequestMethod.POST, RequestMethod.GET}) 
	public String setup_permission(SetupDefaultVO searchSetupVO, Model model) throws IOException, SQLException {
		
		List<Map<String, String>> menu = null;
		List<Map<String, String>> subMenu = null;
		List<Map<String, String>> menuMapping = null;
		
		menu = setupService.selectMenu();
		subMenu = setupService.selectSubMenu();
		menuMapping = setupService.selectMenuMapping();
		
		model.addAttribute("menu", menu);
		model.addAttribute("subMenu", subMenu);
		
		return "setup/setup_permission";
	}
	
}
