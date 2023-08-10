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
package egovframework.example.history.service;

import lombok.Data;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
@Data
public class HistoryVO extends HistoryDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;

	private int rownum;
	private String no;
	private int tocnt;
	private String paymethod;
	private String cpid;
	private String cp_type;
	private String daoutrx;
	private String settdate;
	private String authno;
	private String amount;
	private String tip;
	private String tax;
	private String imei;
	private String terminalid;
	private String agentno;
	private String cardtype;
	private String allotmon;
	private String cardcode;
	private String cardname;
	private String buycode;
	private String cardno;
	private String canceldate;
	private String canceltype;
	private String cancelamount;
	private String amountMod;
	private String commission_total;
	private String commission;
	private String pg_commission;
	private String userid;
	private String authdate;
	private String username;
	private String userphone;
	private String email;
	private String quota;
	private String orderno;
	private String terminal_id;
	private String business_nm;
	private String business_nm2;
	private String business_nm3;
	private String errormessage;
	private String no_cpid;
	private String created_datetime;
	private String paymenttype;
	private String period;
	private String period2;
	private String period3;
	private String period4;
	
	private String d_amount;
	private String d_cancel_sum;
	private int d_total_cnt;
	private String d_approval_cnt;
	private String d_cancel_cnt;
	  
	private String cptype;
	private String period_date;
	private String period_date2;
	private String period_date3;
	private String cancel_amount;
	private String franchisee_commission;
	private String commission_cost;
	private String vat;
	private String vat2;
	private String vat3;
	private String settlement;
	private String settlement2;
	private String settlement3;
	private String store_id;
	private String bank_nm;
	private String productname;
	private String cancel_datetime;
	private String tax_state;
	
	private String total_cnt;
	private String total_account_cnt;
	private String total_amount;
	private String total_approval_cnt;
	private String total_approval;
	private String total_cancel_cnt;
	private String total_cancel_sum;
	private String total_sum;
	private String day_paycnt;
	private String credit_card_k;
	private String credit_card;
	private String terminal;
	private String account_transfer;
	private String virtual_account;
	private String gift_voucher;
	private String smart_gift_voucher;
	private String book_gift_voucher;
	private String amount_commission;
	private String amount_pg_commission;
	
	private String seqno;
	
}
