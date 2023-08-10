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
public class ManageDefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	/** 검색Keyword */
	private String searchKeyword = "";
	private String searchKeyword1 = "";
	private String searchKeyword2 = "";

	private String start_datetime = "";
	private String end_datetime = "";
	private String business_nm = "";
	private String email = "";
	private String tel = "";
	private String phone_num = "";
	private String ceo = "";
	private String person_nm = "";
	private String terminal_id = "";
	private String store_id = "";
	private String commission = "";
	
	private String deposit = "";
	private String itg_limitset = "";
	private String id_firstset = "";
	private String id_firstset1 = "";
	private String id_firstset2 = "";
	
	private String state = "";
	private String role_id = "";
	private String roleStore = "";
	private String roleStore2 = "";
	private String high_store_id = "";
	private String arr_check_id = "";
	private String view_type = "";
	private String day_type = "";
	private String order_no = "";
	private String order_id = "";
	private String settlement_type = "";
	private String[] list;

	private String arrChk = "";
	private String no;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}

	public String getArrChk() {
		return arrChk;
	}

	public void setArrChk(String arrChk) {
		this.arrChk = arrChk;
	}

	/** 현재페이지 */
	private int nCount = 1;
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

	
	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	
	public String getSearchKeyword1() {
		return searchKeyword1;
	}

	public void setSearchKeyword1(String searchKeyword1) {
		this.searchKeyword1 = searchKeyword1;
	}

	public String getSearchKeyword2() {
		return searchKeyword2;
	}

	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
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

	public String getBusiness_nm() {
		return business_nm;
	}

	public void setBusiness_nm(String business_nm) {
		this.business_nm = business_nm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getPerson_nm() {
		return person_nm;
	}

	public void setPerson_nm(String person_nm) {
		this.person_nm = person_nm;
	}

	public String getTerminal_id() {
		return terminal_id;
	}

	public void setTerminal_id(String terminal_id) {
		this.terminal_id = terminal_id;
	}
	
	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getItg_limitset() {
		return itg_limitset;
	}

	public void setItg_limitset(String itg_limitset) {
		this.itg_limitset = itg_limitset;
	}

	public String getId_firstset() {
		return id_firstset;
	}

	public void setId_firstset(String id_firstset) {
		this.id_firstset = id_firstset;
	}

	public String getId_firstset1() {
		return id_firstset1;
	}

	public void setId_firstset1(String id_firstset1) {
		this.id_firstset1 = id_firstset1;
	}

	public String getId_firstset2() {
		return id_firstset2;
	}

	public void setId_firstset2(String id_firstset2) {
		this.id_firstset2 = id_firstset2;
	}	
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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

	public String getHigh_store_id() {
		return high_store_id;
	}

	public void setHigh_store_id(String high_store_id) {
		this.high_store_id = high_store_id;
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

	public String getSettlement_type() {
		return settlement_type;
	}

	public void setSettlement_type(String settlement_type) {
		this.settlement_type = settlement_type;
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
	   this.list = new String[list.length];
       for(int i = 0; i < list.length; ++i) {
	      this.list[i] = list[i];
	   }
//	   if(list!=null){
//		   this.list = new String[list.length];
//		   System.arraycopy(list, 0, this.list, 0, list.length);
//	   }else{
//		   this.list = null;
//	   }

	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
