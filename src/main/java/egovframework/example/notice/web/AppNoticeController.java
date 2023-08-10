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
package egovframework.example.notice.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.notice.service.NoticeDefaultVO;
import egovframework.example.notice.service.NoticeService;
import egovframework.example.notice.service.NoticeVO;
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
public class AppNoticeController {

	/** EgovSampleService */
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/notice/notice01.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice01(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		List<NoticeVO> selectNotice01List2 = noticeService.selectNotice01List2(searchNoticeVO);
		
		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());

		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
		
		List<NoticeVO> selectNotice01List = noticeService.selectNotice01List(searchNoticeVO);
		int cnt = noticeService.selectNotice01ListToCnt(searchNoticeVO);
		int cnt2 = noticeService.selectNotice01ListToCnt2(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList2", selectNotice01List2);
		model.addAttribute("resultList", selectNotice01List);
		model.addAttribute("cnt", cnt2);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("VO", searchNoticeVO);
		
		return "app/notice/notice01";
	}
	@RequestMapping(value = "/app/notice/notice01_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice01_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice01CntMod(vo);
		
		NoticeVO selectNotice01Info = noticeService.selectNotice01Info(searchNoticeVO); 
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice01Info);		
		model.addAttribute("resultList", selectFileListInfo);		
		return "app/notice/notice01_view";
	}	
	
	@RequestMapping(value = "/app/notice/notice01_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice01_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice01Info = noticeService.selectNotice01Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice01Info);			
			model.addAttribute("resultList", selectFileListInfo);
		}
		
		model.addAttribute("view_type", searchNoticeVO.getView_type());			
		return "app/notice/notice01_write";
	}
	@RequestMapping(value = "/app/notice/notice01Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice01Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice01Add(vo, multiRequest);
		return "redirect:/app/notice/notice01.do";
	}
	@RequestMapping(value = "/app/notice/notice01Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice01Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice01Mod(vo, multiRequest);
		return "redirect:/app/notice/notice01.do";
	}
	@RequestMapping(value = "/app/notice/notice01Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice01Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice01Del(vo);
		return "redirect:/app/notice/notice01.do";
	}
	
	@RequestMapping(value = "/app/notice/notice02.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice02(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		List<NoticeVO> selectNotice02List2 = noticeService.selectNotice02List2(searchNoticeVO);
		
		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());

		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<NoticeVO> selectNotice02List = noticeService.selectNotice02List(searchNoticeVO);
		int cnt = noticeService.selectNotice02ListToCnt(searchNoticeVO);
		int cnt2 = noticeService.selectNotice02ListToCnt2(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList2", selectNotice02List2);
		model.addAttribute("resultList", selectNotice02List);
		model.addAttribute("cnt", cnt2);
		model.addAttribute("paginationInfo", paginationInfo);	
		model.addAttribute("VO", searchNoticeVO);
		
		return "app/notice/notice02";
	}
	
	@RequestMapping(value = "/app/notice/notice02_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice02_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {

		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice02CntMod(vo);
		
		NoticeVO selectNotice02Info = noticeService.selectNotice02Info(searchNoticeVO); 
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice02Info);		
		model.addAttribute("resultList", selectFileListInfo);
		return "app/notice/notice02_view";
	}	
	
	@RequestMapping(value = "/app/notice/notice02_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice02_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice02Info = noticeService.selectNotice02Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice02Info);		
			model.addAttribute("resultList", selectFileListInfo);
		}		
		model.addAttribute("view_type", searchNoticeVO.getView_type());			
		return "app/notice/notice02_write";
	}
	@RequestMapping(value = "/app/notice/notice02Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice02Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice02Add(vo, multiRequest);
		return "redirect:/app/notice/notice02.do";
	}
	@RequestMapping(value = "/app/notice/notice02Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice02Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice02Mod(vo, multiRequest);
		return "redirect:/app/notice/notice02.do";
	}
	@RequestMapping(value = "/app/notice/notice02Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice02Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice02Del(vo);
		return "redirect:/app/notice/notice02.do";
	}
	
	@RequestMapping(value = "/app/notice/notice03.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice03(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());

		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<NoticeVO> selectNotice03List = noticeService.selectNotice03List(searchNoticeVO);
		int cnt = noticeService.selectNotice03ListToCnt(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectNotice03List);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);		
		model.addAttribute("VO", searchNoticeVO);
		
		return "app/notice/notice03";
	}
	
	@RequestMapping(value = "/app/notice/notice03_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String notice03_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice03CntMod(vo);
		
		NoticeVO selectNotice03Info = noticeService.selectNotice03Info(searchNoticeVO); 
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice03Info);			
		model.addAttribute("resultList", selectFileListInfo);
		return "app/notice/notice03_view";
	}
	
	@RequestMapping(value = "/app/notice/notice03_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice03_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice03Info = noticeService.selectNotice03Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice03Info);			
			model.addAttribute("resultList", selectFileListInfo);
		}		
		model.addAttribute("view_type", searchNoticeVO.getView_type());			
		return "app/notice/notice03_write";
	}
	@RequestMapping(value = "/app/notice/notice03Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice03Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice03Add(vo, multiRequest);
		return "redirect:/app/notice/notice03.do";
	}
	@RequestMapping(value = "/app/notice/notice03Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice03Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice03Mod(vo, multiRequest);
		return "redirect:/app/notice/notice03.do";
	}
	@RequestMapping(value = "/app/notice/notice03Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice03Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice03Del(vo);
		return "redirect:/app/notice/notice03.do";
	}
	
	@RequestMapping(value = "/app/notice/notice04.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice04(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());

		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		searchNoticeVO.setRole_id("1004");
		List<NoticeVO> selectNotice04List = noticeService.selectNotice04List(searchNoticeVO);
		int cnt = noticeService.selectNotice04ListToCnt(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectNotice04List);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);			
		return "app/notice/notice04";
	}
	
	@RequestMapping(value = "/app/notice/notice04_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice04_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice04CntMod(vo);
		
		NoticeVO selectNotice04Info = noticeService.selectNotice04Info(searchNoticeVO); 
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice04Info);			
		model.addAttribute("resultList", selectFileListInfo);		
		return "app/notice/notice04_view";
	}
	
	@RequestMapping(value = "/app/notice/notice04_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice04_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice04Info = noticeService.selectNotice04Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice04Info);			
			model.addAttribute("resultList", selectFileListInfo);
		}		
		model.addAttribute("view_type", searchNoticeVO.getView_type());			
		return "app/notice/notice04_write";
	}
	@RequestMapping(value = "/app/notice/notice04Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice04Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice04Mod(vo, multiRequest);
		return "redirect:/app/notice/notice04.do";
	}
	@RequestMapping(value = "/app/notice/notice04Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice04Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice04Del(vo);
		return "redirect:/app/notice/notice04.do";
	}
	@RequestMapping(value = "/app/notice/notice04Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice04Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice04Add(vo, multiRequest);
		return "redirect:/app/notice/notice04.do";
	}	
	
	@RequestMapping(value = "/app/notice/notice05.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String notice05(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());

		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		searchNoticeVO.setRole_id("1003");
		List<NoticeVO> selectNotice05List = noticeService.selectNotice04List(searchNoticeVO);
		int cnt = noticeService.selectNotice04ListToCnt(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectNotice05List);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);			
		return "app/notice/notice05";
	}
	
	@RequestMapping(value = "/app/notice/notice05_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice05_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice04CntMod(vo);
		
		NoticeVO selectNotice05Info = noticeService.selectNotice04Info(searchNoticeVO); 
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice05Info);			
		model.addAttribute("resultList", selectFileListInfo);		
		return "app/notice/notice05_view";
	}
	
	@RequestMapping(value = "/app/notice/notice05_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice05_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice05Info = noticeService.selectNotice04Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice05Info);			
			model.addAttribute("resultList", selectFileListInfo);
		}		
		model.addAttribute("view_type", searchNoticeVO.getView_type());			
		return "app/notice/notice05_write";
	}
	@RequestMapping(value = "/app/notice/notice05Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice05Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice04Mod(vo, multiRequest);
		return "redirect:/app/notice/notice05.do";
	}	
	@RequestMapping(value = "/app/notice/notice05Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice05Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice04Del(vo);
		return "redirect:/app/notice/notice05.do";
	}
	@RequestMapping(value = "/app/notice/notice05Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice05Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice04Add(vo, multiRequest);
		return "redirect:/app/notice/notice05.do";
	}	
	
	@RequestMapping(value = "/app/notice/notice06.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice06(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {

		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());

		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		searchNoticeVO.setRole_id("1002");
		List<NoticeVO> selectNotice06List = noticeService.selectNotice04List(searchNoticeVO);
		int cnt = noticeService.selectNotice04ListToCnt(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectNotice06List);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);
		return "app/notice/notice06";
	}
	
	@RequestMapping(value = "/app/notice/notice06_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice06_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice04CntMod(vo);
		
		NoticeVO selectNotice06Info = noticeService.selectNotice04Info(searchNoticeVO); 
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice06Info);			
		model.addAttribute("resultList", selectFileListInfo);			
		return "app/notice/notice06_view";
	}
	
	@RequestMapping(value = "/app/notice/notice06_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice06_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {

		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice06Info = noticeService.selectNotice04Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice06Info);			
			model.addAttribute("resultList", selectFileListInfo);
		}		
		model.addAttribute("view_type", searchNoticeVO.getView_type());
		return "app/notice/notice06_write";
	}	
	@RequestMapping(value = "/app/notice/notice06Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice06Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice04Mod(vo, multiRequest);
		return "redirect:/app/notice/notice06.do";
	}
	@RequestMapping(value = "/app/notice/notice06Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice06Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice04Del(vo);
		return "redirect:/app/notice/notice06.do";
	}
	@RequestMapping(value = "/app/notice/notice06Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice06Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice04Add(vo, multiRequest);
		return "redirect:/app/notice/notice06.do";
	}
	
	@RequestMapping(value = "/app/notice/notice07.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice07(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchNoticeVO.setPageUnit(propertiesService.getInt("pageUnit")*100);
		searchNoticeVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchNoticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchNoticeVO.getPageUnit());
		paginationInfo.setPageSize(searchNoticeVO.getPageSize());
		
		searchNoticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchNoticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchNoticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<NoticeVO> selectNotice07List = noticeService.selectNotice07List(searchNoticeVO);
		int cnt = noticeService.selectNotice07ListToCnt(searchNoticeVO);
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectNotice07List);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paginationInfo", paginationInfo);	
		return "app/notice/notice07";
	}
	
	@RequestMapping(value = "/app/notice/notice07_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice07_view(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(searchNoticeVO.getNo());
		noticeService.notice07CntMod(vo);
		
		NoticeVO selectNotice07Info = noticeService.selectNotice07Info(searchNoticeVO); 
		if(searchNoticeVO.getRole_id().equals("1001") && selectNotice07Info.getRole_check().equals("N")) {
			noticeService.notice07RoleCkMod(vo);
		}
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		model.addAttribute("noticeVO", selectNotice07Info);			
		model.addAttribute("resultList", selectFileListInfo);			
		return "app/notice/notice07_view";
	}
	@RequestMapping(value = "/app/notice/notice07_write.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice07_write(NoticeDefaultVO searchNoticeVO, Model model) throws IOException, SQLException {

		if(searchNoticeVO.getView_type().equals("I")) {
			NoticeVO selectNotice07Info = noticeService.selectNotice07Info(searchNoticeVO); 
			List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
			model.addAttribute("noticeVO", selectNotice07Info);			
			model.addAttribute("resultList", selectFileListInfo);
		}		
		model.addAttribute("view_type", searchNoticeVO.getView_type());		
		return "app/notice/notice07_write";
	}	
	@RequestMapping(value = "/app/notice/notice07Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice07Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice07Mod(vo, multiRequest);
		return "redirect:/app/notice/notice07.do";
	}
	@RequestMapping(value = "/app/notice/notice07Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice07Del(NoticeVO vo, Model model) throws IOException, SQLException {
		
		noticeService.notice07Del(vo);
		return "redirect:/app/notice/notice07.do";
	}
	@RequestMapping(value = "/app/notice/notice07Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_notice07Add(NoticeVO vo, MultipartHttpServletRequest multiRequest, Model model) throws IOException, SQLException {
		
		noticeService.notice07Add(vo, multiRequest);
		return "redirect:/app/notice/notice07.do";
	}		
}
