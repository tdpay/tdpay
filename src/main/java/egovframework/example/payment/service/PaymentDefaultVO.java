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
package egovframework.example.payment.service;

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
public class PaymentDefaultVO implements Serializable {

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

	private String no = "";
	private String paymethod = "";
	private String cpid = "";
	private String orderno = "";
	private String producttype = "";
	private String billtype = "";
	private String taxfreecd = "";
	private String amount = "";
	private String cardno = "";
	private String paymenttype = "";
	private String expirationdate = "";
	private String quota = "";
	private String sms_quota = "";
	private String cardpassword = "";
	private String cardauth = "";
	private String productname = "";
	private String email = "";
	private String ipaddress = "";
	private String userid = "";
	private String username = "";
	private String userphone = "";
	private String productcode = "";
	private String reservedindex1 = "";
	private String reservedindex2 = "";
	private String reservedstring = "";

	private String usermobileno = "";
	private String authreserved = "";

	private String daoutrx = "";
	private String settdate = "";
	private String authno = "";
	private String tip = "";
	private String tax = "";
	private String terminalid = "";
	private String agentno = "";
	private String cardtype = "";
	private String allotmon = "";
	private String cardcode = "";
	private String cardname = "";
	private String buycode = "";
	private String nointflag = "";
	
	private String resultcode = "";
	private String errormessage = "";
	private String cancelmemo = "";
	
	private String canceldate = "";
	private String created_id = "";
	private String authdate = "";
	private String canceltype = "";
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
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

	public String getCpid() {
		return cpid;
	}

	public void setCpid(String cpid) {
		this.cpid = cpid;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getProducttype() {
		return producttype;
	}

	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}

	public String getBilltype() {
		return billtype;
	}

	public void setBilltype(String billtype) {
		this.billtype = billtype;
	}

	public String getTaxfreecd() {
		return taxfreecd;
	}

	public void setTaxfreecd(String taxfreecd) {
		this.taxfreecd = taxfreecd;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	public String getExpirationdate() {
		return expirationdate;
	}

	public void setExpirationdate(String expirationdate) {
		this.expirationdate = expirationdate;
	}

	public String getQuota() {
		return quota;
	}

	public void setQuota(String quota) {
		this.quota = quota;
	}

	public String getSms_quota() {
		return sms_quota;
	}

	public void setSms_quota(String sms_quota) {
		this.sms_quota = sms_quota;
	}

	public String getCardpassword() {
		return cardpassword;
	}

	public void setCardpassword(String cardpassword) {
		this.cardpassword = cardpassword;
	}

	public String getCardauth() {
		return cardauth;
	}

	public void setCardauth(String cardauth) {
		this.cardauth = cardauth;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public String getReservedindex1() {
		return reservedindex1;
	}

	public void setReservedindex1(String reservedindex1) {
		this.reservedindex1 = reservedindex1;
	}

	public String getReservedindex2() {
		return reservedindex2;
	}

	public void setReservedindex2(String reservedindex2) {
		this.reservedindex2 = reservedindex2;
	}

	public String getReservedstring() {
		return reservedstring;
	}

	public void setReservedstring(String reservedstring) {
		this.reservedstring = reservedstring;
	}

	public String getUsermobileno() {
		return usermobileno;
	}

	public void setUsermobileno(String usermobileno) {
		this.usermobileno = usermobileno;
	}

	public String getAuthreserved() {
		return authreserved;
	}

	public void setAuthreserved(String authreserved) {
		this.authreserved = authreserved;
	}

	public String getDaoutrx() {
		return daoutrx;
	}

	public void setDaoutrx(String daoutrx) {
		this.daoutrx = daoutrx;
	}
	
	public String getSettdate() {
		return settdate;
	}

	public void setSettdate(String settdate) {
		this.settdate = settdate;
	}
	
	public String getAuthno() {
		return authno;
	}

	public void setAuthno(String authno) {
		this.authno = authno;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getTerminalid() {
		return terminalid;
	}

	public void setTerminalid(String terminalid) {
		this.terminalid = terminalid;
	}

	public String getAgentno() {
		return agentno;
	}

	public void setAgentno(String agentno) {
		this.agentno = agentno;
	}

	public String getCardtype() {
		return cardtype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}

	public String getAllotmon() {
		return allotmon;
	}

	public void setAllotmon(String allotmon) {
		this.allotmon = allotmon;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getCardname() {
		return cardname;
	}

	public void setCardname(String cardname) {
		this.cardname = cardname;
	}

	public String getBuycode() {
		return buycode;
	}

	public void setBuycode(String buycode) {
		this.buycode = buycode;
	}

	public String getNointflag() {
		return nointflag;
	}

	public void setNointflag(String nointflag) {
		this.nointflag = nointflag;
	}

	public String getResultcode() {
		return resultcode;
	}

	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}

	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}


	public String getCancelmemo() {
		return cancelmemo;
	}

	public void setCancelmemo(String cancelmemo) {
		this.cancelmemo = cancelmemo;
	}

	public String getCanceldate() {
		return canceldate;
	}

	public void setCanceldate(String canceldate) {
		this.canceldate = canceldate;
	}

	public String getCreated_id() {
		return created_id;
	}

	public void setCreated_id(String created_id) {
		this.created_id = created_id;
	}
	
	public String getAuthdate() {
		return authdate;
	}

	public void setAuthdate(String authdate) {
		this.authdate = authdate;
	}

	
	public String getCanceltype() {
		return canceltype;
	}

	public void setCanceltype(String canceltype) {
		this.canceltype = canceltype;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
