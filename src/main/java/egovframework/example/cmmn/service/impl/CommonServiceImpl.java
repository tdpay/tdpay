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
package egovframework.example.cmmn.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import egovframework.example.cmmn.FileUtil;
import egovframework.example.cmmn.service.CommonService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

/**
 * @Class Name : EnvSetServiceImpl.java
 * @Description : EnvSet Business Implement Class
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

@Service("commonService")
public class CommonServiceImpl extends AbstractServiceImpl implements CommonService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonServiceImpl.class);

	/** envSetDAO */
	@Resource(name="commonMapper")
	private CommonMapper commonDAO;

	@Resource(name = "fileUtil")
	protected FileUtil fileUtil;
	
	@Override
	public List<Map<String, String>> commonList(Map<String, String> params) throws IOException, SQLException {
		
		String command = params.get("command");
		
		List<Map<String, String>> list = null;
		
		if(command.equals("bank")){
			list = commonDAO.commonBankList(params);
		}else if(command.equals("high_store_id")){
			list = commonDAO.commonhighStoreIdList(params);
		}else if(command.equals("high_store_id2")){
			list = commonDAO.commonhighStoreId2List(params);
		}else if(command.equals("high_store_id3")){
			list = commonDAO.commonhighStoreId3List(params);
		}else if(command.equals("email")){
			list = commonDAO.commonEmailList(params);
		}else if(command.equals("high_store_list")){
			list = commonDAO.commonHighStoreList(params);
		}else if(command.equals("cardcode")){
			list = commonDAO.commonCardCodeList(params);
		}
		return list;
	}
	
	@Override
	public Map<String, String> fileInfo(Map<String, String> params) throws IOException, SQLException {
		
		return commonDAO.fileInfo(params);
	}
	
	@Override
	public int checkId(Map<String, String> params) throws IOException, SQLException {
		
		return commonDAO.checkId(params);
	}
	
	@Override
	public int store_id(Map<String, String> params) throws IOException, SQLException {
		
		return commonDAO.store_id(params);
	}
	
	@Override
	public String cp_id(String store_id) throws IOException, SQLException {
		
		return commonDAO.cp_id(store_id);
	}
	
	@Override
	public String commonUpload(Map<String, String> params, MultipartHttpServletRequest multiRequest) throws IOException {
		
		String url = "";
		
		Map<String, MultipartFile> files = multiRequest.getFileMap();
	    CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("file2");
	    
	    if(!cmf.getOriginalFilename().equals("")){
	    	
			Map<String, String> map = fileUtil.parseFileInfoEdit(params, multiRequest);
			url = map.get("server_path");
	    }
			
	    return url;
	}
}




