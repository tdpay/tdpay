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
package egovframework.example.manage.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.manage.service.ManageDefaultVO;
import egovframework.example.manage.service.ManageService;
import egovframework.example.manage.service.ManageVO;
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
public class AppManageController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	/** EgovSampleService */
	@Resource(name = "manageService")
	private ManageService manageService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/manage/manage_all.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_all(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchManageVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
		paginationInfo.setPageSize(searchManageVO.getPageSize());

		searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<ManageVO> selectManageList = manageService.selectManageList(searchManageVO);
		int cnt = manageService.selectManageListToCnt(searchManageVO);

		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectManageList);
		model.addAttribute("cnt", cnt);
		
		return "app/manage/manage_all";
	}
	
	@RequestMapping(value = "/app/manage/manage_all_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_all_data(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchManageVO.setPageUnit(searchManageVO.getPageUnit());
		searchManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
		paginationInfo.setPageSize(searchManageVO.getPageSize());

		searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<ManageVO> selectManageList = manageService.selectManageList(searchManageVO);
		int cnt = manageService.selectManageListToCnt(searchManageVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectManageList);
		model.addAttribute("cnt", cnt);
		
		return "app/manage/data/manage_all_data";
	}
	
	@RequestMapping(value = "/app/manage/manage_all_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_all_register(Model model) throws IOException {
		return "app/manage/manage_all_register";
	}
	
	@RequestMapping(value = "/app/manage/manage_all_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_all_search(Model model) throws IOException {
		return "app/manage/manage_all_search";
	}
	
	@RequestMapping(value = "/app/manage/manageAdd.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manageAdd(ManageVO vo, Model model) throws IOException, SQLException {
		
		vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
		manageService.manageAdd(vo);
		String url = "";
		if(vo.getRole_id().equals("1002")) {
			url = "redirect:/app/manage/manage_all.do";
		}else if(vo.getRole_id().equals("1003")) {
			url = "redirect:/app/manage/manage_branch.do";
		}		
		return url;
	}
	
	@RequestMapping(value = "/app/manage/manage_all_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_all_modify(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);		
		return "app/manage/manage_all_modify";
	}
	
	@RequestMapping(value = "/app/manage/manage_all_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_all_view(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		return "app/manage/manage_all_view";
	}
	
	@RequestMapping(value = "/app/manage/manageMod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manageMod(ManageVO vo, Model model) throws IOException, SQLException {
		
		manageService.manageMod(vo);
		
		String url = "";
		if(vo.getRole_id().equals("1002")) {
			url = "redirect:/app/manage/manage_all.do";
		}else if(vo.getRole_id().equals("1003")) {
			url = "redirect:/app/manage/manage_branch.do";
		}	
		return url;
	}
	
	@RequestMapping(value = "/app/manage/manageDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manageDel(ManageVO vo, Model model) throws IOException, SQLException {
		
		manageService.manageDel(vo);
		
		String url = "";
		if(vo.getRole_id().equals("1002")) {
			url = "redirect:/app/manage/manage_all.do";
		}else if(vo.getRole_id().equals("1003")) {
			url = "redirect:/app/manage/manage_branch.do";
		}	
		return url;
	}
	
	@RequestMapping(value = "/app/manage/manage_branch.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_branch(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchManageVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
		paginationInfo.setPageSize(searchManageVO.getPageSize());

		searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<ManageVO> selectManageList2 = manageService.selectManageList2(searchManageVO);
		int cnt2 = manageService.selectManageListToCnt2(searchManageVO);
		
		paginationInfo.setTotalRecordCount(cnt2);
		
		model.addAttribute("resultList", selectManageList2);
		model.addAttribute("cnt", cnt2);
		
		return "app/manage/manage_branch";
	}
	
	@RequestMapping(value = "/app/manage/manage_branch_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_branch_data(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchManageVO.setPageUnit(searchManageVO.getPageUnit() * propertiesService.getInt("pageUnit"));
		searchManageVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
		paginationInfo.setPageSize(searchManageVO.getPageSize());

		searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<ManageVO> selectManageList2 = manageService.selectManageList2(searchManageVO);
		int cnt2 = manageService.selectManageListToCnt2(searchManageVO);
		
		paginationInfo.setTotalRecordCount(cnt2);
		
		model.addAttribute("resultList", selectManageList2);
		model.addAttribute("cnt", cnt2);
		
		return "app/manage/manage_branch_data";
	}
	
	@RequestMapping(value = "/app/manage/manage_branch_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_branch_register(Model model) throws IOException {
		return "app/manage/manage_branch_register";
	}
	
	@RequestMapping(value = "/app/manage/manage_branch_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_branch_search(Model model) throws IOException {
		return "app/manage/manage_branch_search";
	}
	
	@RequestMapping(value = "/app/manage/manage_branch_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_branch_modify(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		return "app/manage/manage_branch_modify";
	}
	
	@RequestMapping(value = "/app/manage/manage_branch_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage_branch_view(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		
		return "app/manage/manage_branch_view";
	}
	
}
