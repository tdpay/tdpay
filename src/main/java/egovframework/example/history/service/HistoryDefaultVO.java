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

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : SampleDefaultVO.java
 * @Description : SampleDefaultVO Class
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
public class HistoryDefaultVO implements Serializable {

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

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	
	private String start_datetime = "";
	private String end_datetime = "";
	private String account_num1 = "";
	private String account_num2 = "";
	private String cardcode = "";
	private String cardno = "";
	private String terminalid = "";
	private String imei = "";
	private String state = "";
	private String allotmon = "";
	private String amount1 = "";
	private String amount2 = "";
	private String quota = "";
	private String username = "";
	private String orderno = "";
	private String roleStore = "";
	private String roleStore2 = "";
	private String roleStore3 = "";
	private String high_store_id = "";
	private String high_store_id2 = "";
	private String arr_check_id = "";
	private String view_type = "";
	private String day_type = "";
	private String order_no = "";
	private String order_id = "";
	private String amount_pay = "";
	private String authdate_type = "";
	private String canceldate_type = "";
	private String[] list;
	
	private String no;
	private String daoutrx;
	private String cpid;
	private String dealing_yn;
	private String cp_type;
	private String search_id;
	private String search_nm;
	private String authdate;
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public String getDaoutrx() {
		return daoutrx;
	}

	public void setDaoutrx(String daoutrx) {
		this.daoutrx = daoutrx;
	}

	public String getStart_datetime() {
		return start_datetime;
	}

	public void setStart_datetime(String start_datetime) {
		this.start_datetime = start_datetime;
	}

	public String getEnd_datetime() {
		return end_datetime;
	}

	public void setEnd_datetime(String end_datetime) {
		this.end_datetime = end_datetime;
	}

	public String getAccount_num1() {
		return account_num1;
	}

	public void setAccount_num1(String account_num1) {
		this.account_num1 = account_num1;
	}

	public String getAccount_num2() {
		return account_num2;
	}

	public void setAccount_num2(String account_num2) {
		this.account_num2 = account_num2;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getTerminalid() {
		return terminalid;
	}

	public void setTerminalid(String terminalid) {
		this.terminalid = terminalid;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public String getAllotmon() {
		return allotmon;
	}

	public void setAllotmon(String allotmon) {
		this.allotmon = allotmon;
	}
	
	public String getAmount1() {
		return amount1;
	}

	public void setAmount1(String amount1) {
		this.amount1 = amount1;
	}

	public String getAmount2() {
		return amount2;
	}

	public void setAmount2(String amount2) {
		this.amount2 = amount2;
	}

	public String getQuota() {
		return quota;
	}

	public void setQuota(String quota) {
		this.quota = quota;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getRoleStore() {
		return roleStore;
	}

	public void setRoleStore(String roleStore) {
		this.roleStore = roleStore;
	}

	public String getRoleStore2() {
		return roleStore2;
	}

	public void setRoleStore2(String roleStore2) {
		this.roleStore2 = roleStore2;
	}
	
	public String getRoleStore3() {
		return roleStore3;
	}

	public void setRoleStore3(String roleStore3) {
		this.roleStore3 = roleStore3;
	}
	
	public String getHigh_store_id() {
		return high_store_id;
	}

	public void setHigh_store_id(String high_store_id) {
		this.high_store_id = high_store_id;
	}

	public String getHigh_store_id2() {
		return high_store_id2;
	}

	public void setHigh_store_id2(String high_store_id2) {
		this.high_store_id2 = high_store_id2;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getArr_check_id() {
		return arr_check_id;
	}

	public void setArr_check_id(String arr_check_id) {
		this.arr_check_id = arr_check_id;
	}

	public String getView_type() {
		return view_type;
	}

	public void setView_type(String view_type) {
		this.view_type = view_type;
	}

	public String getDay_type() {
		return day_type;
	}

	public void setDay_type(String day_type) {
		this.day_type = day_type;
	}
	
	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	public String getAmount_pay() {
		return amount_pay;
	}

	public void setAmount_pay(String amount_pay) {
		this.amount_pay = amount_pay;
	}

	public String getAuthdate_type() {
		return authdate_type;
	}

	public void setAuthdate_type(String authdate_type) {
		this.authdate_type = authdate_type;
	}

	public String getCanceldate_type() {
		return canceldate_type;
	}

	public void setCanceldate_type(String canceldate_type) {
		this.canceldate_type = canceldate_type;
	}

	public String[] getList() {
		if(list!=null){
			String[] tempData = new String[list.length];
			System.arraycopy(list, 0, tempData, 0, list.length);
			return tempData;
		}else{
			return null;
		}
//		return list;
	}

	public void setList(String[] list) {
//		this.list = list;
	   this.list = new String[list.length];
       for(int i = 0; i < list.length; ++i) {
	      this.list[i] = list[i];
	   }
	}

	public String getCpid() {
		return cpid;
	}

	public void setCpid(String cpid) {
		this.cpid = cpid;
	}

	public String getDealing_yn() {
		return dealing_yn;
	}

	public void setDealing_yn(String dealing_yn) {
		this.dealing_yn = dealing_yn;
	}
	
	public String getCp_type() {
		return cp_type;
	}

	public void setCp_type(String cp_type) {
		this.cp_type = cp_type;
	}

	public String getSearch_id() {
		return search_id;
	}

	public void setSearch_id(String search_id) {
		this.search_id = search_id;
	}

	public String getSearch_nm() {
		return search_nm;
	}

	public void setSearch_nm(String search_nm) {
		this.search_nm = search_nm;
	}

	public String getAuthdate() {
		return authdate;
	}

	public void setAuthdate(String authdate) {
		this.authdate = authdate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
