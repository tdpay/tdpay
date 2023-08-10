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

import egovframework.example.cmmn.service.SchedulerService;
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

@Service("schedulerService")
public class SchedulerServiceImpl extends AbstractServiceImpl implements SchedulerService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SchedulerServiceImpl.class);

	/** envSetDAO */
	@Resource(name="schedulerMapper")
	private SchedulerMapper schedulerDAO;

	@Override
	public List<Map<String, String>> registAndIssueTaxInvoiceList(Map<String, String> params) throws IOException, SQLException {
		List<Map<String, String>> list = schedulerDAO.registAndIssueTaxInvoiceList(params);
		return list;
	}
	
	@Override
	public List<Map<String, String>> registAndReverseIssueTaxInvoiceList(Map<String, String> params) throws IOException, SQLException {
		List<Map<String, String>> list = schedulerDAO.registAndReverseIssueTaxInvoiceList(params);
		return list;
	}
	
	@Override
	public Map<String, String> adminStoreId(Map<String, String> params) throws IOException, SQLException {
		
		return schedulerDAO.adminStoreId(params);
	}
	
	@Override
	public void taxResultAdd(Map<String, String> params) throws IOException, SQLException {
		schedulerDAO.taxResultAdd(params);
	}
	
	@Override
	public void taxStateMod(Map<String, String> params) throws IOException, SQLException {
		schedulerDAO.taxStateMod1(params);
		schedulerDAO.taxStateMod2(params);
		schedulerDAO.taxStateMod3(params);
	}
	
	@Override
	public void taxStateCancelMod(Map<String, String> params) throws IOException, SQLException {
		schedulerDAO.taxStateCancelMod(params);
	}
	
	@Override
	public List<Map<String, String>> auth2PgsbmList(Map<String, String> params) throws IOException, SQLException {
		List<Map<String, String>> list = schedulerDAO.auth2PgsbmList(params);
		return list;
	}
	@Override
	public List<Map<String, String>> auth2PgtmsList(Map<String, String> params) throws IOException, SQLException {
		List<Map<String, String>> list = schedulerDAO.auth2PgtmsList(params);
		return list;
	}
	
	@Override
	public void auth2TgAdd(Map<String, String> params) throws IOException, SQLException {
		schedulerDAO.auth2TgAdd(params);
	}
	
	@Override
	public int auth2TypeDList(Map<String, String> params) throws IOException, SQLException {
		return schedulerDAO.auth2TypeDList(params);
	}
	
}




