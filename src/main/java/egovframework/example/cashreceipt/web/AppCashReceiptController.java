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
package egovframework.example.cashreceipt.web;

import java.io.IOException;
import java.sql.SQLException;
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
public class AppCashReceiptController {

	Logger logger = LoggerFactory.getLogger(CashReceiptController.class);

	@RequestMapping(value = "/app/cash_receipt/receipt_iuuse.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_receipt_iuuse(HttpSession session, Model model) throws IOException {
		
		
		return "app/cash_receipt/receipt_iuuse";
	}

	@RequestMapping(value = "/app/cash_receipt/receipt_inquire.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_receipt_inquire(HttpSession session, Model model) throws IOException {
		
		
		return "app/cash_receipt/receipt_inquire";
	}
	
	@RequestMapping(value = "/app/cash_receipt/receipt_file.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_receipt_file(HttpSession session, Model model) throws IOException {
		
		
		return "app/cash_receipt/receipt_file";
	}

	
}
