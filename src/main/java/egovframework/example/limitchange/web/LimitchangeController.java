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
package egovframework.example.limitchange.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import egovframework.example.limitchange.service.LimitchangeDefaultVO;
import egovframework.example.limitchange.service.LimitchangeService;
import egovframework.example.limitchange.service.LimitchangeVO;


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
public class LimitchangeController {

	Logger logger = LoggerFactory.getLogger(LimitchangeController.class);
	
	/** EgovSampleService */
	@Resource(name = "limitchangeService")
	private LimitchangeService limitchangeService;	

	@RequestMapping(value = "/limitchange/limitchange_list.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange_list(LimitchangeDefaultVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		//List<LimitchangeVO> selectLimitchangeList = limitchangeService.selectLimitchangeList(searchLimitchangeVO);
		//model.addAttribute("searchLimitchangeVO", selectLimitchangeList);
		return "limitchange/limitchange_list";
	}
	@RequestMapping(value = "/limitchange/limitchange_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange_data(LimitchangeDefaultVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		List<LimitchangeVO> selectLimitchangeList = limitchangeService.selectLimitchangeList(searchLimitchangeVO);
		model.addAttribute("searchLimitchangeVO", selectLimitchangeList);
		return "limitchange/data/limitchange_data";
	}
	@RequestMapping(value = "/limitchange/limitchange.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange(LimitchangeDefaultVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		return "limitchange/limitchange";
	}
	@RequestMapping(value = "/limitchange/limitchangeAdd.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange_Add(LimitchangeVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		limitchangeService.limitchangeAdd(searchLimitchangeVO);
		return "limitchange/limitchange";
	}	
	@RequestMapping(value = "/limitchange/limitchangeDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange_Del(LimitchangeVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		limitchangeService.limitchangeDel(searchLimitchangeVO);
		return "redirect:/limitchange/limitchange_list.do";  
	}	
	@RequestMapping(value = "/limitchange/limitchange_reply.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange_reply(LimitchangeVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		LimitchangeVO selectLimitchangeVO = limitchangeService.limitchangeReply(searchLimitchangeVO);
		model.addAttribute("selectLimitchangeVO", selectLimitchangeVO);		
		return "limitchange/limitchange_reply";
	}
	@RequestMapping(value = "/limitchange/limitchangeMod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String limitchange_Mod(LimitchangeVO searchLimitchangeVO, HttpSession session, Model model) throws IOException, SQLException {
		limitchangeService.limitchangeMod(searchLimitchangeVO);
		return "redirect:/limitchange/limitchange_list.do";  
	}	
	
}
