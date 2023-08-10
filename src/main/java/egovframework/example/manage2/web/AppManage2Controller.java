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
package egovframework.example.manage2.web;

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

import egovframework.example.manage2.service.Manage2DefaultVO;
import egovframework.example.manage2.service.Manage2Service;
import egovframework.example.manage2.service.Manage2VO;
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
public class AppManage2Controller {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	/** EgovSampleService */
	@Resource(name = "manage2Service")
	private Manage2Service manage2Service;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/manage2/manage2.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2(Manage2DefaultVO searchManage2VO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchManage2VO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchManage2VO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchManage2VO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchManage2VO.getPageUnit());
		paginationInfo.setPageSize(searchManage2VO.getPageSize());

		searchManage2VO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchManage2VO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchManage2VO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<Manage2VO> selectManage2List = manage2Service.selectManage2List(searchManage2VO);
		int cnt = manage2Service.selectManage2ListToCnt(searchManage2VO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectManage2List);
		model.addAttribute("cnt", cnt);
		
		return "app/manage2/manage2";
	}
	
	@RequestMapping(value = "/app/manage2/manage2_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2_data(Manage2DefaultVO searchManage2VO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchManage2VO.setPageUnit(searchManage2VO.getPageUnit() * propertiesService.getInt("pageUnit"));
		searchManage2VO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchManage2VO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchManage2VO.getPageUnit());
		paginationInfo.setPageSize(searchManage2VO.getPageSize());

		searchManage2VO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchManage2VO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchManage2VO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<Manage2VO> selectManage2List = manage2Service.selectManage2List(searchManage2VO);
		int cnt = manage2Service.selectManage2ListToCnt(searchManage2VO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectManage2List);
		model.addAttribute("cnt", cnt);
		
		return "app/manage2/manage2_data";
	}
	
	@RequestMapping(value = "/app/manage2/manage2_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2_register(Model model) throws IOException {
		return "app/manage2/manage2_register";
	}
	
	@RequestMapping(value = "/app/manage2/manage2_search.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2_search(Model model) throws IOException {
		return "app/manage2/manage2_search";
	}
	
	@RequestMapping(value = "/app/manage2/manage2Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2Add(Manage2VO vo, Model model) throws IOException, SQLException {
		
		vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
		manage2Service.manage2Add(vo);		
		return "redirect:/app/manage2/manage2.do";
	}
	
	@RequestMapping(value = "/app/manage2/manage2_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2_modify(Manage2VO vo,Model model) throws IOException, SQLException {
		
		Manage2VO manage2Vo = manage2Service.selectManage2Info(vo);
		model.addAttribute("manage2Vo", manage2Vo);		
		return "app/manage2/manage2_modify";
	}
	
	@RequestMapping(value = "/app/manage2/manage2_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2_view(Manage2VO vo,Model model) throws IOException, SQLException {
		
		Manage2VO manage2Vo = manage2Service.selectManage2Info(vo);
		model.addAttribute("manage2Vo", manage2Vo);
		return "app/manage2/manage2_view";
	}
	
	@RequestMapping(value = "/app/manage2/manage2Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2Mod(Manage2VO vo, Model model) throws IOException, SQLException {
		
		manage2Service.manage2Mod(vo);
		
		return "redirect:/app/manage2/manage2.do";
	}
	
	@RequestMapping(value = "/app/manage2/manage2Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_manage2Del(Manage2VO vo, Model model) throws IOException, SQLException {
		manage2Service.manage2Del(vo);
		
		return "redirect:/app/manage2/manage2.do";
	}	
}
