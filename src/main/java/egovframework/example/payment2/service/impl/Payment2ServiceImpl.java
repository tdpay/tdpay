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
package egovframework.example.payment2.service.impl;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.payment2.service.Payment2DefaultVO;
import egovframework.example.payment2.service.Payment2Service;
import egovframework.example.payment2.service.Payment2VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("payment2Service")
public class Payment2ServiceImpl extends EgovAbstractServiceImpl implements Payment2Service {

	private static final Logger LOGGER = LoggerFactory.getLogger(Payment2ServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
    @Resource(name="payment2Mapper")
	private Payment2Mapper payment2DAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public void cardBilling2(Payment2DefaultVO searchPayment2VO) throws IOException, SQLException {
		payment2DAO.cardBilling2(searchPayment2VO);
	}
	@Override
	public void cardBillingLink2(Payment2DefaultVO searchPayment2VO) throws IOException, SQLException {
		payment2DAO.cardBillingLink2(searchPayment2VO);
	}
	@Override
	public void cardBillingLinkMod2(Payment2DefaultVO searchPayment2VO) throws IOException, SQLException {
		payment2DAO.cardBillingLinkMod2(searchPayment2VO);
	}
	@Override
	public Payment2VO selectCardBillingLink2(Payment2DefaultVO searchPayment2VO) throws IOException, SQLException {
		return payment2DAO.selectCardBillingLink2(searchPayment2VO);
	}
	@Override
	public void cardCancel2(Payment2DefaultVO searchPayment2VO) throws IOException, SQLException {
		payment2DAO.cardCancel2(searchPayment2VO);
	}
}
