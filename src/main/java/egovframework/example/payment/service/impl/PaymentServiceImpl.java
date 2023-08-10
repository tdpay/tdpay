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
package egovframework.example.payment.service.impl;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.payment.service.PaymentDefaultVO;
import egovframework.example.payment.service.PaymentService;
import egovframework.example.payment.service.PaymentVO;
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

@Service("paymentService")
public class PaymentServiceImpl extends EgovAbstractServiceImpl implements PaymentService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PaymentServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
    @Resource(name="paymentMapper")
	private PaymentMapper paymentDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public void cardBilling(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.cardBilling(searchPaymentVO);
	}
	@Override
	public void cardBillingLink(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.cardBillingLink(searchPaymentVO);
	}
	@Override
	public void cardBillingLinkMod(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.cardBillingLinkMod(searchPaymentVO);
	}
	@Override
	public PaymentVO selectCardBillingLink(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		return paymentDAO.selectCardBillingLink(searchPaymentVO);
	}
	@Override
	public void cardCancel(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.cardCancel(searchPaymentVO);
	}
	
	@Override
	public void cardTerminal(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.cardTerminal(searchPaymentVO);
	}
	
	@Override
	public void shopCard(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.shopCard(searchPaymentVO);
	}
	
	@Override
	public void cardTerminalCancel(PaymentDefaultVO searchPaymentVO) throws IOException, SQLException {
		paymentDAO.cardTerminalCancel(searchPaymentVO);
	}
	
}
