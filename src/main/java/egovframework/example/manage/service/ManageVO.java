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
package egovframework.example.manage.service;

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
public class ManageVO extends ManageDefaultVO {

	private static final long serialVersionUID = 1L;

	private int rownum;
	private String no;
	private String role_id;
	private String store_id;
	private String high_store_id;
	private String passwd;
	private String business_nm;
	private String business_nm2;
	private String business_nm3;
	private String high_business_nm;
	private String ceo;
	private String ceo_birth;
	private String corp_regist_num;
	private String corp_regist_num2;
	private String corp_type;
	private String business_cond;
	private String industry_type;
	private String tel;
	private String fax;
	private String phone_num;
	private String email;
	private String contract_date;
	private String bank_code;
	private String bank_nm;
	private String account_num;
	private String accounter;
	private String state;
	private String hompage;
	private String zip_code;
	private String address;
	private String detail_address;
	private String terminal_id;
	private String person_nm1;
	private String person_phone1;
	private String person_email1;
	private String person_nm2;
	private String person_phone2;
	private String person_email2;
	private String person_nm3;
	private String person_phone3;
	private String person_email3;
	private String tax;
	private String commission;
	private String main_commission;
	private String period;
	private String deposit;
	private String itg_limitset;
	private String settlement_type;
	private String id_firstset;
	private String id_firstset1;
	private String id_firstset2;
	private String file_no;	
	private String created_id;   
	private String created_datetime;    
	private String updated_id;   
	private String updated_datetime;

	// 상점 수수료
	private String credit_card_k;
	private String credit_card;
	private String terminal;
	private String account_transfer;
	private String virtual_account;
	private String gift_voucher;
	private String smart_gift_voucher;
	private String book_gift_voucher;
	
	private String use_amount;

}
