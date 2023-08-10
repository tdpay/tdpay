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
import java.util.List;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.history.service.HistoryDefaultVO;
import egovframework.example.history.service.HistoryService;
import egovframework.example.history.service.HistoryVO;
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
public class HistoryController {

	Logger logger = LoggerFactory.getLogger(HistoryController.class);
	
	/** EgovSampleService */
	@Resource(name = "historyService")
	private HistoryService historyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/history/history_all.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_all(HistoryDefaultVO searchHistoryVO, HttpSession session, Model model) throws IOException, SQLException {
		
		model.addAttribute("view_type", searchHistoryVO.getView_type());
		
		if(searchHistoryVO.getView_type() != null && searchHistoryVO.getView_type().equals("L")) {
			searchHistoryVO = (HistoryDefaultVO) session.getAttribute("searchHistoryVO");
			model.addAttribute("searchHistoryVO", searchHistoryVO);
		}else {
			session.setAttribute("searchHistoryVO",	searchHistoryVO);
		}	
		
		return "history/history_all";
	}
	
	@RequestMapping(value = "/history/history_all_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_all_data(HistoryDefaultVO searchHistoryVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchHistoryVO.getView_type().equals("L")) {
			

			searchHistoryVO = (HistoryDefaultVO) session.getAttribute("searchHistoryVO");

		}

		/** EgovPropertyService.sample */
		searchHistoryVO.setPageUnit(searchHistoryVO.getPageUnit());
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
		
		session.setAttribute("searchHistoryVO",	searchHistoryVO);
		
		return "history/data/history_all_data";
	}
	
	@RequestMapping(value = "/history/history_all_info.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_all_info(HistoryDefaultVO searchHistoryVO, HttpSession session, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchHistoryVO.setPageUnit(searchHistoryVO.getPageUnit());
		searchHistoryVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchHistoryVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchHistoryVO.getPageUnit());
		paginationInfo.setPageSize(searchHistoryVO.getPageSize());
		
		searchHistoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchHistoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchHistoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<HistoryVO> selectHistoryDetailList = historyService.selectHistoryDetailList(searchHistoryVO);
		int cnt = 0;
		
		HistoryVO historyVO = new HistoryVO();
		if(selectHistoryDetailList != null && selectHistoryDetailList.size() > 0) {
			
			historyVO.setD_amount(selectHistoryDetailList.get(0).getD_amount());
			historyVO.setD_cancel_sum(selectHistoryDetailList.get(0).getD_cancel_sum());
			cnt = selectHistoryDetailList.get(0).getD_total_cnt();
			historyVO.setD_approval_cnt(selectHistoryDetailList.get(0).getD_approval_cnt());
			historyVO.setD_cancel_cnt(selectHistoryDetailList.get(0).getD_cancel_cnt());
		}
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectHistoryDetailList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("historyVO", historyVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "history/data/history_all_info";
	}
	
	@RequestMapping(value = "/history/history_all_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_all_view(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		HistoryVO historyVo = historyService.selectHistoryInfo(searchHistoryVO);
		model.addAttribute("historyVo", historyVo);
		return "history/history_all_view";
	}
	
	@RequestMapping(value = "/history/history_all_excel.do")
	public void history_all_excel(HistoryDefaultVO searchHistoryVO, HttpServletResponse response, HttpSession session, Model model) throws IOException, SQLException {
		
		String role_id = (String)session.getAttribute("role_id");
		
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
        sheet.setColumnWidth(14, 3500);
        sheet.setColumnWidth(15, 3500);
        sheet.setColumnWidth(16, 3500);
        sheet.setColumnWidth(17, 3500);
        sheet.setColumnWidth(18, 3500);
        sheet.setColumnWidth(19, 3500);
        sheet.setColumnWidth(20, 3500);
        sheet.setColumnWidth(21, 3500);
        sheet.setColumnWidth(22, 3500);
        sheet.setColumnWidth(23, 3500);
        if(role_id.equals("1001")) {
        	sheet.setColumnWidth(24, 3500);
        	sheet.setColumnWidth(25, 3500);
        	sheet.setColumnWidth(26, 3500);
        }else if(role_id.equals("1002")) {
        	sheet.setColumnWidth(24, 3500);
        	sheet.setColumnWidth(25, 3500);
        }else if(role_id.equals("1003")) {
        	sheet.setColumnWidth(24, 3500);
        }else if(role_id.equals("1004")) {
        }
        
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		HSSFCellStyle titlestyle = wb.createCellStyle();
		titlestyle.setFont(font);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(1);
		cell.setCellValue("PG");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(2);
		cell.setCellValue("결제경로");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("PG수수율");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("PG수수료");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("승인금액");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("취소금액");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(7);
		cell.setCellValue("거래금액");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(8);
		cell.setCellValue("상점아이디");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(9);
		cell.setCellValue("터미널ID");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(10);
		cell.setCellValue("CPID");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("승인일자");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("가맹점 수수료율");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(13);
		cell.setCellValue("가맹점 수수료");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(14);
		cell.setCellValue("신용카드 금액(원)");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(15);
		cell.setCellValue("카드계열");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(16);
		cell.setCellValue("승인번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(17);
		cell.setCellValue("할부개월수");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(18);
		cell.setCellValue("주문번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(19);
		cell.setCellValue("거래상태");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(20);
		cell.setCellValue("영수증");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(21);
		cell.setCellValue("중복결제");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(22);
		cell.setCellValue("매입구분");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(23);
		cell.setCellValue("지급일");
		cell.setCellStyle(titlestyle);
		
        if(role_id.equals("1001")) {
    		cell = row.createCell(24);
    		cell.setCellValue("영업대행");
    		cell.setCellStyle(titlestyle);
    		
    		cell = row.createCell(25);
    		cell.setCellValue("대리점");
    		cell.setCellStyle(titlestyle);
    		
    		cell = row.createCell(26);
    		cell.setCellValue("가맹점");
    		cell.setCellStyle(titlestyle);
        }else if(role_id.equals("1002")) {
    		cell = row.createCell(24);
    		cell.setCellValue("대리점");
    		cell.setCellStyle(titlestyle);
    		
    		cell = row.createCell(25);
    		cell.setCellValue("가맹점");
    		cell.setCellStyle(titlestyle);
        }else if(role_id.equals("1003")) {
    		cell = row.createCell(24);
    		cell.setCellValue("가맹점");
    		cell.setCellStyle(titlestyle);
        }else if(role_id.equals("1004")) {
        }

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

			
		searchHistoryVO.setList(searchHistoryVO.getArr_check_id().split(","));
		
		List<HistoryVO> selectHistoryList = historyService.selectHistoryListExcel(searchHistoryVO);
		
		int i = 0;
		for (HistoryVO historyVO : selectHistoryList) {
				
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);
			
			String cp_type = "";
			
			/*if(historyVO.getCp_type() == "1") {
				cp_type = "페이조아";
			} else {
				cp_type = "케이에스넷";
			}*/
			
			cell = row.createCell(1);
			cell.setCellValue(Integer.parseInt(historyVO.getCp_type()) == 1 ? "페이조아":"케이에스");
			cell.setCellStyle(style);
			
			String paymenttype = "";
			
			if(Integer.parseInt(historyVO.getPaymenttype()) == 1) {
				paymenttype = "키인승인(수기)";
			} else if(Integer.parseInt(historyVO.getPaymenttype()) == 2) {
				paymenttype = "sms승인(수기)";
			} else if(Integer.parseInt(historyVO.getPaymenttype()) == 3) {
				paymenttype = "단말기승인";
			} else if(Integer.parseInt(historyVO.getPaymenttype()) == 4) {
				paymenttype = "일반카드";
			}			
			
			cell = row.createCell(2);
			cell.setCellValue(paymenttype);
			cell.setCellStyle(style);
			
			cell = row.createCell(3);
			cell.setCellValue(historyVO.getPg_commission());
			cell.setCellStyle(style);
			
			cell = row.createCell(4);
			cell.setCellValue(historyVO.getAmount_pg_commission());
			cell.setCellStyle(style);
			
			cell = row.createCell(5);
			cell.setCellValue(historyVO.getAmount());
			cell.setCellStyle(style);
			
			cell = row.createCell(6);
			cell.setCellValue(historyVO.getCancelamount());
			cell.setCellStyle(style);
			
			cell = row.createCell(7);
			cell.setCellValue(Integer.parseInt(historyVO.getAmount()) - Integer.parseInt(historyVO.getCancelamount()));
			cell.setCellStyle(style);
			
			cell = row.createCell(8);
			cell.setCellValue(historyVO.getUserid());
			cell.setCellStyle(style);
			
			cell = row.createCell(9);
			cell.setCellValue(historyVO.getTerminalid());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(historyVO.getCpid());
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue(historyVO.getAuthdate());
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue(historyVO.getCommission());
			cell.setCellStyle(style);
			
			cell = row.createCell(13);
			cell.setCellValue(historyVO.getAmount_commission());
			cell.setCellStyle(style);
			
			cell = row.createCell(14);
			cell.setCellValue(historyVO.getAmount());
			cell.setCellStyle(style);
			
			cell = row.createCell(15);
			cell.setCellValue(historyVO.getCardname());
			cell.setCellStyle(style);
			
			cell = row.createCell(16);
			cell.setCellValue(historyVO.getAuthno());
			cell.setCellStyle(style);
			
			cell = row.createCell(17);
			cell.setCellValue(historyVO.getQuota() == "00" && !"0".equals(historyVO.getQuota()) ? "일시불":"할부");
			cell.setCellStyle(style);
			
			cell = row.createCell(18);
			cell.setCellValue(historyVO.getOrderno());
			cell.setCellStyle(style);
			
			cell = row.createCell(19);
			cell.setCellValue(historyVO.getSeqno() == "0" ? "결제취소":"결제완료");
			cell.setCellStyle(style);
			
			cell = row.createCell(20);
			cell.setCellValue(Integer.parseInt(historyVO.getDay_paycnt()) > 1 ? "중복":"일반");
			cell.setCellStyle(style);
			
			cell = row.createCell(21);
			cell.setCellValue(Integer.parseInt(historyVO.getAmount()) >= 3000000 ? "고액":"일반");
			cell.setCellStyle(style);
			
			cell = row.createCell(22);
			cell.setCellValue("매입");
			cell.setCellStyle(style);
			
			cell = row.createCell(23);
			cell.setCellValue("D+"+historyVO.getPeriod());
			cell.setCellStyle(style);
			
			
	        if(role_id.equals("1001")) {
				cell = row.createCell(24);
				cell.setCellValue(historyVO.getBusiness_nm3());
				cell.setCellStyle(style);
				
				cell = row.createCell(25);
				cell.setCellValue(historyVO.getBusiness_nm2());
				cell.setCellStyle(style);
				
				cell = row.createCell(26);
				cell.setCellValue(historyVO.getBusiness_nm());
				cell.setCellStyle(style);
	        }else if(role_id.equals("1002")) {
				cell = row.createCell(24);
				cell.setCellValue(historyVO.getBusiness_nm2());
				cell.setCellStyle(style);
				
				cell = row.createCell(25);
				cell.setCellValue(historyVO.getBusiness_nm());
				cell.setCellStyle(style);
	        }else if(role_id.equals("1003")) {
				cell = row.createCell(24);
				cell.setCellValue(historyVO.getBusiness_nm());
				cell.setCellStyle(style);
	        }else if(role_id.equals("1004")) {
	        }

			i++;
		}

		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(date);
		cal.get(Calendar.YEAR);
		String name = "output.xls";

		File file = new File(propertiesService.getString("Globals.tmp"), name);
		
		logger.debug("history_all_excel Exception file : "+file);

		FileOutputStream fileOutputStream = new FileOutputStream(file);
		
		wb.write(fileOutputStream);

		byte b[] = new byte[(int) file.length()];
		
		//response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
		response.setContentType("application/vnd.ms-excel");
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
			logger.debug("history_all_excel Exception : "+e);
		} catch (IOException e) {
			logger.debug("history_all_excel Exception : "+e);
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
	
	@RequestMapping(value = "/history/history_fail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_fail(HistoryDefaultVO searchHistoryVO, HttpSession session, Model model) throws IOException, SQLException {
		
		model.addAttribute("view_type", searchHistoryVO.getView_type());
		
		if(searchHistoryVO.getView_type() != null && searchHistoryVO.getView_type().equals("L")) {
			searchHistoryVO = (HistoryDefaultVO) session.getAttribute("searchHistoryVO");
			model.addAttribute("searchHistoryVO", searchHistoryVO);
		}else {
			session.setAttribute("searchHistoryVO",	searchHistoryVO);
		}	
		
		return "history/history_fail";
	}
	
	@RequestMapping(value = "/history/history_fail_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_fail_data(HistoryDefaultVO searchHistoryVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchHistoryVO.getView_type().equals("L")) {

			searchHistoryVO = (HistoryDefaultVO) session.getAttribute("searchHistoryVO");

		}
		
		/** EgovPropertyService.sample */
		searchHistoryVO.setPageUnit(searchHistoryVO.getPageUnit());
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
		
		session.setAttribute("searchHistoryVO",	searchHistoryVO);
		
		return "history/data/history_fail_data";
	}
	
	@RequestMapping(value = "/history/history_fail_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_fail_view(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		HistoryVO historyVo = historyService.selectHistoryFailInfo(searchHistoryVO);
		model.addAttribute("historyVo", historyVo);		
		return "history/history_fail_view";
	}
	
	@RequestMapping(value = "/history/history_fail_excel.do")
	public void history_fail_excel(HistoryDefaultVO searchHistoryVO, HttpServletResponse response, HttpSession session, Model model) throws IOException, SQLException {
		
		String role_id = (String)session.getAttribute("role_id");
		
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
        sheet.setColumnWidth(14, 3500);
        sheet.setColumnWidth(15, 3500);
        sheet.setColumnWidth(16, 3500);
        sheet.setColumnWidth(17, 3500);
        sheet.setColumnWidth(18, 3500);
        sheet.setColumnWidth(19, 3500);
        
        if(role_id.equals("1001")) {
        	sheet.setColumnWidth(20, 3500);
        	sheet.setColumnWidth(21, 3500);
        	sheet.setColumnWidth(22, 3500);
        }else if(role_id.equals("1002")) {
        	sheet.setColumnWidth(20, 3500);
        	sheet.setColumnWidth(21, 3500);
        }else if(role_id.equals("1003")) {
        	sheet.setColumnWidth(20, 3500);
        }else if(role_id.equals("1004")) {
        }
        
        
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		HSSFCellStyle titlestyle = wb.createCellStyle();
		titlestyle.setFont(font);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(1);
		cell.setCellValue("결제");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(2);
		cell.setCellValue("상점아이디");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("CPID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("단말기번호");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("터미널ID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("매입구분");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(7);
		cell.setCellValue("요청금액");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(8);
		cell.setCellValue("메세지");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(9);
		cell.setCellValue("실패일자");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(10);
		cell.setCellValue("구매자");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("신용카드 금액(원)");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("할부개월수");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(13);
		cell.setCellValue("결제경로");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(14);
		cell.setCellValue("주문번호");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(15);
		cell.setCellValue("거래상태");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(16);
		cell.setCellValue("중복결제");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(17);
		cell.setCellValue("고액건");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(18);
		cell.setCellValue("거래취소");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(19);
		cell.setCellValue("매출전표");
		cell.setCellStyle(titlestyle);
		
        if(role_id.equals("1001")) {
    		cell = row.createCell(20);
    		cell.setCellValue("영업대행");
    		cell.setCellStyle(titlestyle);
    		
    		cell = row.createCell(21);
    		cell.setCellValue("대리점");
    		cell.setCellStyle(titlestyle);
    		
    		cell = row.createCell(22);
    		cell.setCellValue("가맹점");
    		cell.setCellStyle(titlestyle);
        }else if(role_id.equals("1002")) {
    		cell = row.createCell(20);
    		cell.setCellValue("대리점");
    		cell.setCellStyle(titlestyle);
    		
    		cell = row.createCell(21);
    		cell.setCellValue("가맹점");
    		cell.setCellStyle(titlestyle);
        }else if(role_id.equals("1003")) {
    		cell = row.createCell(20);
    		cell.setCellValue("가맹점");
    		cell.setCellStyle(titlestyle);
        }else if(role_id.equals("1004")) {
        }

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

		searchHistoryVO.setList(searchHistoryVO.getArr_check_id().split(","));
		
		List<HistoryVO> selectHistoryFailList = historyService.selectHistoryFailListExcel(searchHistoryVO);
		
		int i = 0;
		for (HistoryVO historyVO : selectHistoryFailList) {
			
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);
					
			cell = row.createCell(1);
			cell.setCellValue(Integer.parseInt(historyVO.getCp_type()) == 1 ? "페이조아":"케이에스넷");
			cell.setCellStyle(style);
			
			cell = row.createCell(2);
			cell.setCellValue(historyVO.getUserid());
			cell.setCellStyle(style);
			
			cell = row.createCell(3);
			cell.setCellValue(historyVO.getCpid());
			cell.setCellStyle(style);
			
			cell = row.createCell(4);
			cell.setCellValue(historyVO.getImei());
			cell.setCellStyle(style);
			
			cell = row.createCell(5);
			cell.setCellValue(historyVO.getTerminal_id());
			cell.setCellStyle(style);
			
			cell = row.createCell(6);
			cell.setCellValue(historyVO.getTerminal_id());
			cell.setCellStyle(style);
			
			cell = row.createCell(7);
			cell.setCellValue("매입");
			cell.setCellStyle(style);
			
			cell = row.createCell(8);
			cell.setCellValue(historyVO.getAmount());
			cell.setCellStyle(style);
			
			cell = row.createCell(8);
			cell.setCellValue(historyVO.getErrormessage());
			cell.setCellStyle(style);
			
			cell = row.createCell(9);
			cell.setCellValue(historyVO.getCreated_datetime());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(historyVO.getUsername());
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue(historyVO.getAmount());
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue(historyVO.getQuota() == "00" && !"0".equals(historyVO.getQuota()) ? "일시불":"할부");
			cell.setCellStyle(style);
			
			cell = row.createCell(13);
			cell.setCellValue(Integer.parseInt(historyVO.getCp_type()) == 1 ? "페이조아":"케이에스넷");
			cell.setCellStyle(style);
			
			cell = row.createCell(15);
			cell.setCellValue(historyVO.getOrderno());
			cell.setCellStyle(style);
			
			cell = row.createCell(15);
			cell.setCellValue((historyVO.getCanceldate() != null && !"".equals(historyVO.getCanceldate())) ? "결제취소":"결제완료");
			cell.setCellStyle(style);
			
			cell = row.createCell(16);
			cell.setCellValue(Integer.parseInt(historyVO.getDay_paycnt()) > 1 ? "중복":"일반");
			cell.setCellStyle(style);
			
			cell = row.createCell(17);
			cell.setCellValue(Integer.parseInt(historyVO.getAmount()) >= 3000000 ? "고액":"일반");
			cell.setCellStyle(style);
			
			cell = row.createCell(18);
			cell.setCellValue((historyVO.getCanceldate() != null && !"".equals(historyVO.getCanceldate())) ? "Y":"N");
			cell.setCellStyle(style);
			
			cell = row.createCell(19);
			cell.setCellValue((historyVO.getTax() != null && historyVO.getTax().equals("Y")) ? "Y":"N");
			cell.setCellStyle(style);
			
			
	        if(role_id.equals("1001")) {
				cell = row.createCell(20);
				cell.setCellValue(historyVO.getBusiness_nm3());
				cell.setCellStyle(style);
				
				cell = row.createCell(21);
				cell.setCellValue(historyVO.getBusiness_nm2());
				cell.setCellStyle(style);
				
				cell = row.createCell(22);
				cell.setCellValue(historyVO.getBusiness_nm());
				cell.setCellStyle(style);
	        }else if(role_id.equals("1002")) {
				cell = row.createCell(20);
				cell.setCellValue(historyVO.getBusiness_nm2());
				cell.setCellStyle(style);
				
				cell = row.createCell(21);
				cell.setCellValue(historyVO.getBusiness_nm());
				cell.setCellStyle(style);
	        }else if(role_id.equals("1003")) {
				cell = row.createCell(20);
				cell.setCellValue(historyVO.getBusiness_nm());
				cell.setCellStyle(style);
	        }else if(role_id.equals("1004")) {
	        }
			
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
			
			logger.debug("history_fail_excel Exception : "+e);
		} catch (IOException e) {
			
			logger.debug("history_fail_excel Exception : "+e);
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
	
	@RequestMapping(value = "/history/history_deduct.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String history_deduct(HistoryDefaultVO searchHistoryVO, Model model) throws IOException, SQLException {
		
		return "history/history_deduct";
	}
	
}
