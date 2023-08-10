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

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Data;


@Data
public class SetupDefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	private String searchKeyword;
	private String view_type;
	private int no;
	private String check;
	private String check_no;
	private String auth_no;
	private String type;
	private String auth_type;
	private String store_id;
	private String passwd;
	private String ceo;
	private String phone_num;
	private String email;
	private String state;
	private String role_id;
	private String menu_id;
	private String created_id;
	private String updated_id;
	private String arr_check_id;
	private String ip;
	private String memo;
	private String use_yn;
	private String bank_code;
	private String bank_nm;
	
	private String cardcode;
	private String cardname;
	private String rate;
	
	private String pgname;
	private String pgway;
	private String creditcard_RT;	
	private String creditcardK_RT;	
	private String cellphone_RT;	
	private String cellphonePay_RT;	
	private String ARS700_RT;		
	private String phonebill_RT;	
	private String accountTRF_RT;	
	private String vaccountTRF_RT;	
	private String CMS_RT;		
	private String giftvoucher_RT;	
	private String sgiftvoucher_RT;	
	private String bgiftvoucher_RT;	
	private String hgiftvoucher_RT;	
	private String eggmony_RT;	
	private String teencash_RT;	
	private String tmoney_RT;		
	private String mobilepop_RT;	
	private String alipay_RT;		
	private String kakaopay_RT;	
	private String terminal_RT;
	
	
	private List<Map<String, Object>> cardfeeList = new ArrayList<>();
	

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	
}
