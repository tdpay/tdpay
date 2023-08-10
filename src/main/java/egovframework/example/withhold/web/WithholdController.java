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
package egovframework.example.withhold.web;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.withhold.service.WithHoldDefaultVO;
import egovframework.example.withhold.service.WithholdService;
import egovframework.example.withhold.service.WithholdVO;

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
public class WithholdController {

	Logger logger = LoggerFactory.getLogger(WithholdController.class); 
	
	/** EgovSampleService */
	@Resource(name = "withholdService")
	private WithholdService withholdService;

	@RequestMapping(value = "/withhold/withholding_manage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String withholding_manage(WithHoldDefaultVO searchWithholdVO, HttpSession session, Model model) throws IOException {
		
		model.addAttribute("searchWithholdVO", searchWithholdVO);
		
		return "withhold/withholding_manage";
	}
	
	@RequestMapping(value = "/withhold/withholding_manage_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String withholding_manage_data(WithHoldDefaultVO searchWithholdVO, HttpSession session, Model model) throws IOException, SQLException {
		
		List<WithholdVO> selectWithholdList = withholdService.selectWithholdList(searchWithholdVO);
		List<WithholdVO> selectCardList = withholdService.selectCardList();
		
		model.addAttribute("resultList", selectWithholdList);
		model.addAttribute("resultCardList", selectCardList);
		session.setAttribute("searchWithholdVO",	searchWithholdVO);
		
		return "withhold/data/withholding_manage_data";
		
	}
	
}
