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
package egovframework.example.setup.service;

import java.util.ArrayList;
import java.util.List;

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
public class SetupVO extends SetupDefaultVO {

	private static final long serialVersionUID = 1L;

	private int rownum;
	private String state;
	private String store_id;
	private String ceo;
	private String phone_num;
	private String email;
	private String auth_type;
	private String auth_result;
	private String type;
	private String menu_id;
	private String high_menu_id;
	private String menu_nm;
	private String menu_url;
	private String ip;
	private String memo;
	private String use_yn;
	private String bank_code;
	private String bank_nm;
	private int tocnt;
	private int no;
	private String check_yn;
	private String created_id;
	private String created_datetime;
	private String updated_id;
	private String updated_datetime;
	private String cardcode;
	private String cardname;
	private String rate;	
	
	private String pgcode;
	private String pgname;
	private String pgway;
	private String creditcard_RT="";	
	private String creditcardK_RT="";	
	private String cellphone_RT="";	
	private String cellphonePay_RT="";	
	private String ARS700_RT="";		
	private String phonebill_RT="";	
	private String accountTRF_RT="";	
	private String vaccountTRF_RT="";	
	private String CMS_RT="";		
	private String giftvoucher_RT="";	
	private String sgiftvoucher_RT="";
	private String bgiftvoucher_RT="";	
	private String hgiftvoucher_RT="";	
	private String eggmony_RT="";	
	private String teencash_RT="";	
	private String tmoney_RT="";		
	private String mobilepop_RT="";	
	private String alipay_RT="";		
	private String kakaopay_RT="";
	private String terminal_RT="";
	
}
