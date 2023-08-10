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
package egovframework.example.settlement.service;

import java.io.Serializable;

import lombok.Data;

@Data
public class SettlementDefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

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
	
	private String seqno = "";
	private String start_datetime = "";
	private String end_datetime = "";
	private String amount1 = "";
	private String amount2 = "";
	private String cardcode = "";
	private String cardno = "";
	private String allotmon = "";
	private String username = "";
	private String roleStore = "";
	private String roleStore2 = "";
	private String roleStore3 = "";
	private String high_store_id = "";
	private String high_store_id2 = "";	
	private String orderno = "";
	private String terminalid = "";
	private String state = "";
	private String commission = "";
	private String tax_state = "";
	private String tax_state2 = "";
	private String arr_check_id = "";
	private String[] list;
	private String no = "";
	private String daoutrx = "";
	private String quota = "";
	private String userid = "";
	private String ym = "";
	private String yyyy = "";
	private String store_id = "";
	private String role_id = "";
	private String auth_id = "";
	private String hold_yn = "";
	private String created_id = "";
	private String updated_id = "";
	private String created_datetime = "";
	private String cpid = "";
	private String cp_type = "";
	private String view_type = "";
	private String day_type = "";
	private String order_no = "";
	private String order_id = "";
	private String search_id = "";
	private String search_id2 = "";
	private String bussincess_id = "";
	private String search_nm = "";
	private String authdate = "";
	private String period_date = "";
	private String settlement_type = "";
	private String period = "";
	private String paymenttype = "";
	private String branch_store_id = "";
	private String manage_store_id = "";
	private String corp_regist_num = "";
	
	/** recordCountPerPage */
	private int recordCountPerPage = 10;


}
