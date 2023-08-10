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
package egovframework.example.cmmn.web;


import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.cmmn.service.CommonService;

/**
 * @Class Name : EnvSetController.java
 * @Description : EnvSet Controller Class
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
@RequestMapping(value="/common")
public class CommonController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);
	
	/** boardService */
	@Resource(name = "commonService")
	private CommonService commonService;

	@RequestMapping(value = "/selectList.do")
	public @ResponseBody Object selectList(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		Object result = commonService.commonList(params);
		return result;
	}
	
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public @ResponseBody Object upload(MultipartHttpServletRequest multiRequest, @RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException {
		
		Object result=null;
		
		String commonUpload = commonService.commonUpload(params, multiRequest);
		
		result = commonUpload;
		return result;
		
	}	
	
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	public @ResponseBody Object check_id(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		Object result = false;
		
		int cnt = commonService.checkId(params);
		if(cnt == 0) {
			result = true;
		}
		
		return result;
	}
	
	@RequestMapping(value = "/store_id.do", method = RequestMethod.POST)
	public @ResponseBody Object check_id2(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		Object result = false;
		
		int cnt = commonService.store_id(params);
		if(cnt > 0) {
			result = true;
		}
		
		return result;
	}
	
	@RequestMapping(value = "/cp_id.do", method = RequestMethod.POST)
	public @ResponseBody Object cp_id(String store_id, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		return commonService.cp_id(store_id);
		
	}
	
}
























