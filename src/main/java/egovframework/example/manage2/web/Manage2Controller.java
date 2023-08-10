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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.manage2.service.Manage2DefaultVO;
import egovframework.example.manage2.service.Manage2Service;
import egovframework.example.manage2.service.Manage2VO;
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
public class Manage2Controller {

	Logger logger = LoggerFactory.getLogger(Manage2Controller.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name = "manage2Service")
	private Manage2Service manage2Service;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@RequestMapping(value = "/manage2/manage2.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage2(Manage2DefaultVO searchManage2VO, HttpSession session, Model model) throws IOException {
		
		model.addAttribute("view_type", searchManage2VO.getView_type());
		
		if(searchManage2VO.getView_type() != null && searchManage2VO.getView_type().equals("L")) {
			searchManage2VO = (Manage2DefaultVO) session.getAttribute("searchManage2VO");
			model.addAttribute("searchManage2VO", searchManage2VO);
		}else {
			session.setAttribute("searchManage2VO",	searchManage2VO);
		}		
		
		return "manage2/manage2";
	}
	@RequestMapping(value = "/manage2/manage2_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_all_data(Manage2DefaultVO searchManage2VO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchManage2VO.getView_type().equals("L")) {

			searchManage2VO = (Manage2DefaultVO) session.getAttribute("searchManage2VO");
			/** EgovPropertyService.sample */
			searchManage2VO.setPageUnit(searchManage2VO.getPageUnit());
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
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchManage2VO.getPageUnit());

		}else {
			
			/** EgovPropertyService.sample */
			searchManage2VO.setPageUnit(searchManage2VO.getPageUnit());
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
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchManage2VO.getPageUnit());
		}
		
		session.setAttribute("searchManage2VO",	searchManage2VO);
		
		return "manage2/data/manage2_data";
	}
	
	@RequestMapping(value = "/manage2/manage2_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage2_register(Model model) throws IOException {
		return "manage2/manage2_register";
	}
	@RequestMapping(value = "/manage2/manage2Add.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage2Add(Manage2VO vo, Model model, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		
		//vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
		manage2Service.manage2Add(vo, multiRequest);
		return "redirect:/manage2/manage2.do";
	}
	
	@RequestMapping(value = "/manage2/manage2_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage2_modify(Manage2VO vo,Model model, @RequestParam("store_id") String pStore_id) throws IOException, SQLException {
		
		if(!pStore_id.equals("")) {vo.setStore_id(pStore_id);}
		
		Manage2VO manage2Vo = manage2Service.selectManage2Info(vo);
		
		NoticeDefaultVO searchNoticeVO = new NoticeDefaultVO();
		searchNoticeVO.setNo(manage2Vo.getNo());
		searchNoticeVO.setFile_check("F");
		searchNoticeVO.setFile_type(vo.getRole_id());
		
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		
		model.addAttribute("manage2Vo", manage2Vo);
		model.addAttribute("fileList", selectFileListInfo);
		return "manage2/manage2_modify";
	}
	
	@RequestMapping(value = "/manage2/manage2_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage2_view(Manage2VO vo,Model model) throws IOException, SQLException {
		
		Manage2VO manage2Vo = manage2Service.selectManage2Info(vo);
		
		NoticeDefaultVO searchNoticeVO = new NoticeDefaultVO();
		searchNoticeVO.setNo(manage2Vo.getNo());
		searchNoticeVO.setFile_check("F");
		searchNoticeVO.setFile_type(vo.getRole_id());
		
		List<NoticeVO> selectFileListInfo = noticeService.selectFileListInfo(searchNoticeVO);
		
		model.addAttribute("manage2Vo", manage2Vo);
		model.addAttribute("fileList", selectFileListInfo);
		
		return "manage2/manage2_view";
	}
	
	@RequestMapping(value = "/manage2/manage2Mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage2Mod(Manage2VO vo, Model model, MultipartHttpServletRequest multiRequest, RedirectAttributes redirect) throws IOException, SQLException {
		
		//if(vo.getPasswd()!=null &&  !"".equals(vo.getPasswd())) vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
		manage2Service.manage2Mod(vo, multiRequest);
		
		//String pStore_id = vo.getStore_id();
		
		//redirect.addAttribute("store_id", pStore_id); 
		
		return "redirect:/manage2/manage2.do";
	}
	
	@RequestMapping(value = "/manage2/manage2Del.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object manage2Del(Manage2VO vo, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = manage2Service.manage2Del(vo);
		
		return result;
	}	
	
	@RequestMapping(value = "/manage2/manage2_excel.do")
	public void manage2_excel(Manage2DefaultVO searchManage2VO, HttpServletResponse response, HttpSession session, Model model) throws IOException, SQLException {
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("Sheet1");
		HSSFRow row = sheet.createRow((short) 0);

		sheet.setColumnWidth(0, 1500);
      	sheet.setColumnWidth(1, 3500);
      	sheet.setColumnWidth(2, 3500);
      	sheet.setColumnWidth(3, 3500);
      	sheet.setColumnWidth(4, 3500);
      	sheet.setColumnWidth(5, 3500);
      	sheet.setColumnWidth(6, 3500);
      	sheet.setColumnWidth(7, 3500);
      	sheet.setColumnWidth(8, 3500);
      	sheet.setColumnWidth(9, 3500);
      	sheet.setColumnWidth(10, 3500);
        sheet.setColumnWidth(11, 3500);
        sheet.setColumnWidth(12, 3500);
        sheet.setColumnWidth(13, 3500);
        
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		HSSFCellStyle titlestyle = wb.createCellStyle();
		titlestyle.setFont(font);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(1);
		cell.setCellValue("상점아이디");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(2);
		cell.setCellValue("상점명");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("가입일자");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("사업자번호");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("영업대행");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("대리점");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(7);
		cell.setCellValue("터미널ID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(8);
		cell.setCellValue("매입구분");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(9);
		cell.setCellValue("회사번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(10);
		cell.setCellValue("수수료");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("세금계산서 발행");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("정산주기");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(13);
		cell.setCellValue("상태");
		cell.setCellStyle(titlestyle);

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

		searchManage2VO.setList(searchManage2VO.getArr_check_id().split(","));
		
		List<Manage2VO> selectManageList = manage2Service.selectManage2ListExcel(searchManage2VO);
		
		
		int i = 0;
		for (Manage2VO manage2VO : selectManageList) {
			
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);
			
			cell = row.createCell(1);
			cell.setCellValue(manage2VO.getStore_id());
			cell.setCellStyle(style);

			cell = row.createCell(2);
			cell.setCellValue(manage2VO.getBusiness_nm());
			cell.setCellStyle(style);

			cell = row.createCell(3);
			cell.setCellValue(manage2VO.getContract_date());
			cell.setCellStyle(style);

			cell = row.createCell(4);
			cell.setCellValue(manage2VO.getCorp_regist_num());
			cell.setCellStyle(style);

			cell = row.createCell(5);
			cell.setCellValue(manage2VO.getBusiness_nm3());
			cell.setCellStyle(style);

			cell = row.createCell(6);
			cell.setCellValue(manage2VO.getBusiness_nm2());
			cell.setCellStyle(style);

			cell = row.createCell(7);
			cell.setCellValue(manage2VO.getTerminal_id());
			cell.setCellStyle(style);

			cell = row.createCell(8);
			cell.setCellValue("매입");
			cell.setCellStyle(style);

			cell = row.createCell(9);
			cell.setCellValue(manage2VO.getTel());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(manage2VO.getCommission()+"%");
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue(manage2VO.getTax().equals("Y")?"발행":"미발행");
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue(manage2VO.getPeriod()+"일");
			cell.setCellStyle(style);
			
			cell = row.createCell(13);
			cell.setCellValue(manage2VO.getState().equals("Y")?"사용중":"미사용");
			cell.setCellStyle(style);

			i++;
		}

		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(date);
		cal.get(Calendar.YEAR);
		String name = "output.xls";

		File file = new File(propertiesService.getString("Globals.tmp"), name);

		FileOutputStream fileOutputStream = new FileOutputStream(file);

		wb.write(fileOutputStream);

		byte b[] = new byte[(int) file.length()];

		response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
		response.setHeader("Content-Length", String.valueOf(file.length()));
		
		FileInputStream fis = null;
		BufferedInputStream fin = null;
		
		try {
			if (file.isFile()) {
				
				fis = new FileInputStream(file);
				fin = new BufferedInputStream(fis);
				
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
			}
			
			if(file.exists()) file.delete();
			
		} catch (FileNotFoundException e) {
			
			logger.debug("manage2_excel Exception : "+e);
		} catch (IOException e) {
			
			logger.debug("manage2_excel Exception : "+e);
		} finally {
            try {
                if (fileOutputStream != null)
                	fileOutputStream.close();
                
                if (fin != null)
                	fin.close();
                
                if (fis != null)
                	fis.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
	}
}
