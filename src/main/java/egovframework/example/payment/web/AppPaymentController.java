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
package egovframework.example.payment.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.daou.auth.common.Crypto;
import com.daou.auth.common.PayStruct;
import com.daou.auth.directCard.DaouDirectCardAPI;
import com.daou.util.CommonUtil;

import egovframework.example.cmmn.service.CommonService;
import egovframework.example.payment.service.PaymentDefaultVO;
import egovframework.example.payment.service.PaymentService;
import egovframework.example.payment.service.PaymentVO;
import egovframework.example.user.service.SmsSendService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
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

@Controller
public class AppPaymentController {

	Logger logger = LoggerFactory.getLogger(AppPaymentController.class);
	/** EgovSampleService */
	@Resource(name = "paymentService")
	private PaymentService paymentService;

    @Autowired
    private SmsSendService smsSendService;
    
	@Resource(name = "commonService")
	private CommonService commonService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/app/payment/payment.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String app_payment(Model model) throws IOException {
		return "app/payment/payment";
	}
	
	@RequestMapping(value = "/app/payment/cardSugido.do", produces="application/json;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Map app_cardSugido(HttpServletRequest request, HttpServletResponse response, PaymentDefaultVO searchPaymentVO, Model model) throws IOException, SQLException, Exception {
		
		Map result = new HashMap<String, Object>();
		
		String PubS_DIRECTCARD_IP    = propertiesService.getString("card.dev"); 
		int PubI_DIRECTCARD_PORT	 = propertiesService.getInt("card.port"); 
		String PubS_LOGDIR 			 = propertiesService.getString("card.log");
		String PubS_KEY 			 = propertiesService.getString("card.key");
		
		PayStruct struct = new PayStruct();
		PayStruct struct2 = new PayStruct();
		PayStruct struct3 = new PayStruct();
		DaouDirectCardAPI payDirect = new DaouDirectCardAPI(PubS_DIRECTCARD_IP,PubI_DIRECTCARD_PORT);
		
		String NO				= CommonUtil.checkNull(request.getParameter("NO")); 
		String USERID			= CommonUtil.checkNull(request.getParameter("USERID"));
		String CPID				= commonService.cp_id(USERID);  
		if(CPID == null && "".equals(CPID)) {
			result.put("FAILED", "상점정보에  CPID 등록해주세요.");
			return result;
		}		
		String ORDERNO			= CommonUtil.checkNull(request.getParameter("ORDERNO")); 
		String PRODUCTTYPE		= CommonUtil.checkNull(request.getParameter("PRODUCTTYPE"));
		String BILLTYPE			= CommonUtil.checkNull(request.getParameter("BILLTYPE"));	//13번(카드번호+비밀번호+유효기간+생년월일), 18번(카드번호+유효기간)
		String TAXFREECD		= CommonUtil.checkNull(request.getParameter("TAXFREECD")); 	
		String AMOUNT			= CommonUtil.checkNull(request.getParameter("AMOUNT")).replaceAll(",","");
		String CARDNO			= CommonUtil.checkNull(request.getParameter("CARDNO"));		//카드번호
		String EXPIRATIONDATE	= CommonUtil.checkNull(request.getParameter("EXPIRATIONDATE"));//카드유효기간
		String QUOTA			= CommonUtil.checkNull(request.getParameter("QUOTA")); 
		String CARDPASSWORD		= CommonUtil.checkNull(request.getParameter("CARDPASSWORD")); //인증유형 14번일때 사용(비밀번호 앞 2자리)
		String CARDAUTH			= CommonUtil.checkNull(request.getParameter("CARDAUTH"));		//인증유형 14번일때 사용(개인:생년월일, 법인:사업자번호10자리)
		String PRODUCTNAME		= CommonUtil.checkNull(request.getParameter("PRODUCTNAME")); 
		String EMAIL			= CommonUtil.checkNull(request.getParameter("EMAIL"));
		
		String ipAddress=request.getRemoteAddr();
		if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
		    InetAddress inetAddress=InetAddress.getLocalHost();
		    ipAddress=inetAddress.getHostAddress();
		}
		
		String IPADDRESS		= ipAddress;
		String USERNAME			= CommonUtil.checkNull(request.getParameter("USERNAME")); 
		String USERPHONE		= CommonUtil.checkNull(request.getParameter("USERPHONE")); 
		String PRODUCTCODE		= CommonUtil.checkNull(request.getParameter("PRODUCTCODE"));
		String RESERVEDINDEX1	= CommonUtil.checkNull(request.getParameter("RESERVEDINDEX1"));
		String RESERVEDINDEX2	= CommonUtil.checkNull(request.getParameter("RESERVEDINDEX2"));
		String RESERVEDSTRING	= CommonUtil.checkNull(request.getParameter("RESERVEDSTRING"));
		String CARDCD			= "";
		String CARDBINNO		= "";
		
		logger.debug("IPADDRESS=="+IPADDRESS);
		
		searchPaymentVO.setNo(NO);
		searchPaymentVO.setCpid(CPID);
		searchPaymentVO.setOrderno(ORDERNO);
		searchPaymentVO.setProducttype(PRODUCTTYPE);
		searchPaymentVO.setBilltype(BILLTYPE);
		searchPaymentVO.setTaxfreecd(TAXFREECD);
		searchPaymentVO.setAmount(AMOUNT);
		searchPaymentVO.setCardno(CARDNO);
		searchPaymentVO.setExpirationdate(EXPIRATIONDATE);
		searchPaymentVO.setQuota(QUOTA);
		searchPaymentVO.setCardpassword(CARDPASSWORD);
		searchPaymentVO.setCardauth(CARDAUTH);
		searchPaymentVO.setProductname(PRODUCTNAME);
		searchPaymentVO.setEmail(EMAIL);
		searchPaymentVO.setIpaddress(IPADDRESS);
		searchPaymentVO.setUserid(USERID);
		searchPaymentVO.setUsername(USERNAME);
		searchPaymentVO.setUserphone(USERPHONE);
		searchPaymentVO.setProductcode(PRODUCTCODE);
		searchPaymentVO.setReservedindex1(RESERVEDINDEX1);
		searchPaymentVO.setReservedindex2(RESERVEDINDEX2);
		searchPaymentVO.setReservedstring(RESERVEDSTRING);
		
		if(!CARDNO.equals("") && CARDNO.length()>6){
			CARDBINNO=CARDNO.substring(0,6);
		}
		                                                   
		String RESULTCODE		= "";				
		String ERRORMESSAGE		= "";
		
		//2. AUTH 
		String USERMOBILENO			= CommonUtil.checkNull(request.getParameter("usermobileno"));
		String AUTHRESERVED			= CommonUtil.checkNull(request.getParameter("authreserved"));
		String NOINTFLAG			= "N";
		String ENC_DATA1			= "";
		String ENC_DATA2			= "";
		String ENC_DATA3			= "";
		String ENC_DATA4			= "";

	/** 결제정보 구조체 Value 설정 **/
		struct.PubSet_Function			= "DCHKBIN_01"; 
		struct.PubSet_Key				= PubS_KEY;
		struct.PubSet_CPID				= CPID;
		struct.PubSet_CardBinNum		= CARDBINNO;
		
		struct = payDirect.directCardSugiChkBin(struct, PubS_LOGDIR+CPID);
		CARDCD = struct.PubGet_CardCd;
		
		logger.debug("struct=="+struct.PubGet_ResultCode);
		searchPaymentVO.setCardcode(CARDCD);
		
		if(struct.PubGet_ResultCode.equals("0000")){
			
			/** 결제정보 구조체 Value 설정 **/
			struct2.PubSet_Function			= "DORDER__01";		
			struct2.PubSet_Key				= PubS_KEY;		
			struct2.PubSet_CPID				= CPID;
			struct2.PubSet_OrderNo			= ORDERNO;
			struct2.PubSet_ProductType		= PRODUCTTYPE;
			struct2.PubSet_BillType			= BILLTYPE;
			struct2.PubSet_CardCode			= CARDCD;
			struct2.PubSet_TaxFreeCD  		= TAXFREECD;
			struct2.PubSet_AllotMon			= QUOTA;
			struct2.PubSet_Amount			= AMOUNT;
			struct2.PubSet_IPAddress		= IPADDRESS;
			
			struct2.PubSet_Email			= EMAIL;	
			struct2.PubSet_UserID			= USERID;
			struct2.PubSet_UserName			= USERNAME;
			struct2.PubSet_ProductCode		= PRODUCTCODE;
			struct2.PubSet_ProductName      = PRODUCTNAME;
			struct2.PubSet_telno1       	= "";
			struct2.PubSet_telno2       	= "";
			struct2.PubSet_OrderReserved	= "";
			struct2.PubSet_ReservedIndex1   = RESERVEDINDEX1;
			struct2.PubSet_ReservedIndex2   = RESERVEDINDEX2;
			struct2.PubSet_ReservedString   = RESERVEDSTRING;
			struct2 = payDirect.directCardOrder(struct2, PubS_LOGDIR+CPID);
			
			logger.debug("struct2=="+struct2.PubGet_ResultCode);
			if(struct2.PubGet_ResultCode.equals("0000")) {
				
				/** 결제정보 구조체 Value 설정 **/
				struct3.PubSet_Function				= "DAUTH___01";		//승인요청
				struct3.PubSet_Key					= PubS_KEY;		//가맹점Key
				struct3.PubSet_CPID					= CPID;
				struct3.PubSet_DaouTrx				= struct2.PubGet_DaouTrx;
				struct3.PubSet_CertType				= struct2.PubGet_CertType;
				struct3.PubSet_CertResultCode		= struct2.PubGet_ResultCode;
				struct3.PubSet_CertResultMsg		= struct2.PubGet_ErrorMessage;
				struct3.PubSet_UserEmail			= EMAIL;
				struct3.PubSet_UserMobileNo			= USERMOBILENO;
				struct3.PubSet_Amount				= AMOUNT;
				struct3.PubSet_Quota				= QUOTA;
				struct3.PubSet_NoIntFlag			= NOINTFLAG;
				struct3.PubSet_EncData1				= Crypto.Encrypt(PubS_KEY, CARDNO);
				struct3.PubSet_EncData2				= Crypto.Encrypt(PubS_KEY, EXPIRATIONDATE);
				struct3.PubSet_EncData3				= Crypto.Encrypt(PubS_KEY, CARDPASSWORD);
				struct3.PubSet_EncData4				= Crypto.Encrypt(PubS_KEY, CARDAUTH);
				struct3.PubSet_AuthReserved			= "";
				
				struct3 = payDirect.directCardAuth(struct3, PubS_LOGDIR+CPID);
				logger.debug("struct3=="+struct3.PubGet_ResultCode);
				
				if(struct3.PubGet_ResultCode.equals("0000")){
					
					RESULTCODE		=	struct3.PubGet_ResultCode;
					ERRORMESSAGE	=	struct3.PubGet_ErrorMessage;
					ORDERNO	= struct3.PubGet_OrderNo;
					AMOUNT	= struct3.PubGet_Amount;
					String DAOUTRX	= struct3.PubGet_DaouTrx;
					String AUTHNO 	= struct3.PubGet_AuthNO;
					String AUTHDATE	= struct3.PubGet_AuthDate;
					NOINTFLAG= struct3.PubGet_NoIntFlag;
					QUOTA	= struct3.PubGet_Quota;
					String DAOURESERVED1	= struct3.PubGet_DaouReserved1;
					String DAOURESERVED2	= struct3.PubGet_DaouReserved2;
					
					logger.debug("DAOUTRX=="+DAOUTRX);
					logger.debug("CPID=="+CPID);
					logger.debug("AMOUNT=="+AMOUNT);
					logger.debug("RESULTCODE=="+RESULTCODE);
					logger.debug("ERRORMESSAGE=="+ERRORMESSAGE);
					
					
					searchPaymentVO.setDaoutrx(DAOUTRX);
					searchPaymentVO.setAuthno(AUTHNO);
					searchPaymentVO.setAuthdate(AUTHDATE);
					searchPaymentVO.setResultcode(RESULTCODE);
					searchPaymentVO.setErrormessage(ERRORMESSAGE);
					paymentService.cardBilling(searchPaymentVO);
					
					result.put("SUCCESS", DAOUTRX);
		            
				} else {
					RESULTCODE		=	struct3.PubGet_ResultCode;
					ERRORMESSAGE	=	struct3.PubGet_ErrorMessage;
					
					searchPaymentVO.setDaoutrx(struct3.PubGet_DaouTrx);
					searchPaymentVO.setAuthno(struct3.PubGet_AuthNO);
					searchPaymentVO.setAuthdate(struct3.PubGet_AuthDate);
		            searchPaymentVO.setResultcode(RESULTCODE);
		            searchPaymentVO.setErrormessage(ERRORMESSAGE);
		            paymentService.cardBilling(searchPaymentVO);
		            
		            result.put("FAILED", "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE);
				}
				
			} else {
				RESULTCODE		=	struct2.PubGet_ResultCode;
				ERRORMESSAGE	=	struct2.PubGet_ErrorMessage;
				
	            if("9103".equals(RESULTCODE)) {
	            	result.put("9103", "과금 유형을 확인해 주세요.");
	            }else {
	            	searchPaymentVO.setDaoutrx(struct3.PubGet_DaouTrx);
	            	searchPaymentVO.setAuthno(struct3.PubGet_AuthNO);
	            	searchPaymentVO.setAuthdate(struct3.PubGet_AuthDate);
	            	searchPaymentVO.setResultcode(RESULTCODE);
	            	searchPaymentVO.setErrormessage(ERRORMESSAGE);
	            	paymentService.cardBilling(searchPaymentVO);
	            	
	            	result.put("FAILED", "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE);
	            }
			}
			
		} else {
			RESULTCODE		=	struct.PubGet_ResultCode;
			ERRORMESSAGE	=	struct.PubGet_ErrorMessage;
			
			searchPaymentVO.setDaoutrx(struct3.PubGet_DaouTrx);
			searchPaymentVO.setAuthno(struct3.PubGet_AuthNO);
			searchPaymentVO.setAuthdate(struct3.PubGet_AuthDate);
            searchPaymentVO.setResultcode(RESULTCODE);
            searchPaymentVO.setErrormessage(ERRORMESSAGE);
            paymentService.cardBilling(searchPaymentVO);
            
            result.put("FAILED", "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE);
			
		}
		
		return result;
	}	
	
	@RequestMapping(value = "/app/payment/payment_link_sms.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object app_payment_link_sms(PaymentDefaultVO searchPaymentVO, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, SQLException {
		
		Object result=null;
		
//		String CPID				   	 = propertiesService.getString("card.cpid"); 
		String USERID			= CommonUtil.checkNull(request.getParameter("USERID")); 
		String CPID				= commonService.cp_id(USERID); 
		String ORDERNO			= CommonUtil.checkNull(request.getParameter("ORDERNO")); 
		String PRODUCTTYPE		= CommonUtil.checkNull(request.getParameter("PRODUCTTYPE"));
		String BILLTYPE			= CommonUtil.checkNull(request.getParameter("BILLTYPE"));	//13번(카드번호+비밀번호+유효기간+생년월일), 18번(카드번호+유효기간)
		String TAXFREECD		= CommonUtil.checkNull(request.getParameter("TAXFREECD")); 	
		String AMOUNT			= CommonUtil.checkNull(request.getParameter("AMOUNT")).replaceAll(",","");
		String PRODUCTNAME		= CommonUtil.checkNull(request.getParameter("PRODUCTNAME")); 
		String USERNAME			= CommonUtil.checkNull(request.getParameter("USERNAME")); 
		String USERPHONE		= CommonUtil.checkNull(request.getParameter("USERPHONE")); 
		String EMAIL			= CommonUtil.checkNull(request.getParameter("EMAIL"));
		String PRODUCTCODE		= CommonUtil.checkNull(request.getParameter("PRODUCTCODE"));
		String SMS_QUOTA		= CommonUtil.checkNull(request.getParameter("SMS_QUOTA"));
		
		searchPaymentVO.setCpid(CPID);
		searchPaymentVO.setUserid(USERID);
		searchPaymentVO.setOrderno(ORDERNO);
		searchPaymentVO.setProducttype(PRODUCTTYPE);
		searchPaymentVO.setBilltype(BILLTYPE);
		searchPaymentVO.setTaxfreecd(TAXFREECD);
		searchPaymentVO.setAmount(AMOUNT);
		searchPaymentVO.setProductname(PRODUCTNAME);
		searchPaymentVO.setUsername(USERNAME);
		searchPaymentVO.setUserphone(USERPHONE);
		searchPaymentVO.setEmail(EMAIL);
		searchPaymentVO.setProductcode(PRODUCTCODE);
		searchPaymentVO.setSms_quota(SMS_QUOTA);
		
		paymentService.cardBillingLink(searchPaymentVO);
		
		String cardUrlSend  = propertiesService.getString("card.url.send")+"?no="+searchPaymentVO.getNo(); 
		logger.debug("cardUrlSend=="+cardUrlSend);
		logger.debug("getUserphone()=="+searchPaymentVO.getUserphone());
		
		smsSendService.sendAuthSmsLink(searchPaymentVO.getUserphone(), cardUrlSend);
		
        return result;
	}	
	
	@RequestMapping(value = "/app/payment/pay.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String appPayment(PaymentDefaultVO searchPaymentVO, Model model) throws IOException, SQLException {
		
		PaymentVO paymentVo = paymentService.selectCardBillingLink(searchPaymentVO);
		model.addAttribute("paymentVo", paymentVo);
		return "app/payment/pay";
	}
	
	@RequestMapping(value = "/app/pay/cardSugido.do", produces="application/json;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Map appCardSugido(HttpServletRequest request, HttpServletResponse response, PaymentDefaultVO searchPaymentVO, Model model) throws IOException, SQLException, Exception {
		
		Map result = new HashMap<String, Object>();
		
		String PubS_DIRECTCARD_IP  	 = propertiesService.getString("card.dev"); 
//		String CPID				   	 = propertiesService.getString("card.cpid"); 
		int PubI_DIRECTCARD_PORT	 = propertiesService.getInt("card.port"); 
		String PubS_LOGDIR 			 = propertiesService.getString("card.log");
		String PubS_KEY 			 = propertiesService.getString("card.key");
		
		PayStruct struct = new PayStruct();
		PayStruct struct2 = new PayStruct();
		PayStruct struct3 = new PayStruct();
		DaouDirectCardAPI payDirect = new DaouDirectCardAPI(PubS_DIRECTCARD_IP,PubI_DIRECTCARD_PORT);
		
		String NO				= CommonUtil.checkNull(request.getParameter("NO")); 
		String USERID			= CommonUtil.checkNull(request.getParameter("USERID"));
		String CPID				= CommonUtil.checkNull(request.getParameter("CPID"));
		String ORDERNO			= CommonUtil.checkNull(request.getParameter("ORDERNO")); 
		String PRODUCTTYPE		= CommonUtil.checkNull(request.getParameter("PRODUCTTYPE"));
		String BILLTYPE			= CommonUtil.checkNull(request.getParameter("BILLTYPE"));	//13번(카드번호+비밀번호+유효기간+생년월일), 18번(카드번호+유효기간)
		String TAXFREECD		= CommonUtil.checkNull(request.getParameter("TAXFREECD")); 	
		String AMOUNT			= CommonUtil.checkNull(request.getParameter("AMOUNT")).replaceAll(",","");
		String CARDNO			= CommonUtil.checkNull(request.getParameter("CARDNO"));		//카드번호
		String EXPIRATIONDATE	= CommonUtil.checkNull(request.getParameter("EXPIRATIONDATE"));//카드유효기간
		String QUOTA			= CommonUtil.checkNull(request.getParameter("QUOTA")); 
		String CARDPASSWORD		= CommonUtil.checkNull(request.getParameter("CARDPASSWORD")); //인증유형 14번일때 사용(비밀번호 앞 2자리)
		String CARDAUTH			= CommonUtil.checkNull(request.getParameter("CARDAUTH"));		//인증유형 14번일때 사용(개인:생년월일, 법인:사업자번호10자리)
		String PRODUCTNAME		= CommonUtil.checkNull(request.getParameter("PRODUCTNAME")); 
		String EMAIL			= CommonUtil.checkNull(request.getParameter("EMAIL"));
		
		String ipAddress=request.getRemoteAddr();
		if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
		    InetAddress inetAddress=InetAddress.getLocalHost();
		    ipAddress=inetAddress.getHostAddress();
		}
		
		String IPADDRESS		= ipAddress;
		String USERNAME			= CommonUtil.checkNull(request.getParameter("USERNAME")); 
		String USERPHONE		= CommonUtil.checkNull(request.getParameter("USERPHONE")); 
		String PRODUCTCODE		= CommonUtil.checkNull(request.getParameter("PRODUCTCODE"));
		String RESERVEDINDEX1	= CommonUtil.checkNull(request.getParameter("RESERVEDINDEX1"));
		String RESERVEDINDEX2	= CommonUtil.checkNull(request.getParameter("RESERVEDINDEX2"));
		String RESERVEDSTRING	= CommonUtil.checkNull(request.getParameter("RESERVEDSTRING"));
		String CARDCD			= "";
		String CARDBINNO		= "";
		
		logger.debug("IPADDRESS=="+IPADDRESS);
		
		searchPaymentVO.setNo(NO);
		searchPaymentVO.setCpid(CPID);
		searchPaymentVO.setOrderno(ORDERNO);
		searchPaymentVO.setProducttype(PRODUCTTYPE);
		searchPaymentVO.setBilltype(BILLTYPE);
		searchPaymentVO.setTaxfreecd(TAXFREECD);
		searchPaymentVO.setAmount(AMOUNT);
		searchPaymentVO.setCardno(CARDNO);
		searchPaymentVO.setExpirationdate(EXPIRATIONDATE);
		searchPaymentVO.setQuota(QUOTA);
		searchPaymentVO.setCardpassword(CARDPASSWORD);
		searchPaymentVO.setCardauth(CARDAUTH);
		searchPaymentVO.setProductname(PRODUCTNAME);
		searchPaymentVO.setEmail(EMAIL);
		searchPaymentVO.setIpaddress(IPADDRESS);
		searchPaymentVO.setUserid(USERID);
		searchPaymentVO.setUsername(USERNAME);
		searchPaymentVO.setUserphone(USERPHONE);
		searchPaymentVO.setProductcode(PRODUCTCODE);
		searchPaymentVO.setReservedindex1(RESERVEDINDEX1);
		searchPaymentVO.setReservedindex2(RESERVEDINDEX2);
		searchPaymentVO.setReservedstring(RESERVEDSTRING);
		
		if(!CARDNO.equals("") && CARDNO.length()>6){
			CARDBINNO=CARDNO.substring(0,6);
		}
		                                                   
		String RESULTCODE		= "";				
		String ERRORMESSAGE		= "";
		
		//2. AUTH 
		String USERMOBILENO			= CommonUtil.checkNull(request.getParameter("usermobileno"));
		String AUTHRESERVED			= CommonUtil.checkNull(request.getParameter("authreserved"));
		String NOINTFLAG			= "N";
		String ENC_DATA1			= "";
		String ENC_DATA2			= "";
		String ENC_DATA3			= "";
		String ENC_DATA4			= "";

	/** 결제정보 구조체 Value 설정 **/
		struct.PubSet_Function			= "DCHKBIN_01"; 
		struct.PubSet_Key				= PubS_KEY;
		struct.PubSet_CPID				= CPID;
		struct.PubSet_CardBinNum		= CARDBINNO;
		
		struct = payDirect.directCardSugiChkBin(struct, PubS_LOGDIR+CPID);
		CARDCD = struct.PubGet_CardCd;
		
		logger.debug("struct=="+struct.PubGet_ResultCode);
		searchPaymentVO.setCardcode(CARDCD);
		
		if(struct.PubGet_ResultCode.equals("0000")){
			
			/** 결제정보 구조체 Value 설정 **/
			struct2.PubSet_Function			= "DORDER__01";		
			struct2.PubSet_Key				= PubS_KEY;		
			struct2.PubSet_CPID				= CPID;
			struct2.PubSet_OrderNo			= ORDERNO;
			struct2.PubSet_ProductType		= PRODUCTTYPE;
			struct2.PubSet_BillType			= BILLTYPE;
			struct2.PubSet_CardCode			= CARDCD;
			struct2.PubSet_TaxFreeCD  		= TAXFREECD;
			struct2.PubSet_AllotMon			= QUOTA;
			struct2.PubSet_Amount			= AMOUNT;
			struct2.PubSet_IPAddress		= IPADDRESS;
			
			struct2.PubSet_Email			= EMAIL;	
			struct2.PubSet_UserID			= USERID;
			struct2.PubSet_UserName			= USERNAME;
			struct2.PubSet_ProductCode		= PRODUCTCODE;
			struct2.PubSet_ProductName      = PRODUCTNAME;
			struct2.PubSet_telno1       	= "";
			struct2.PubSet_telno2       	= "";
			struct2.PubSet_OrderReserved	= "";
			struct2.PubSet_ReservedIndex1   = RESERVEDINDEX1;
			struct2.PubSet_ReservedIndex2   = RESERVEDINDEX2;
			struct2.PubSet_ReservedString   = RESERVEDSTRING;
			struct2 = payDirect.directCardOrder(struct2, PubS_LOGDIR+CPID);
			
			logger.debug("struct2=="+struct2.PubGet_ResultCode);
			if(struct2.PubGet_ResultCode.equals("0000")) {
				
				/** 결제정보 구조체 Value 설정 **/
				struct3.PubSet_Function				= "DAUTH___01";		//승인요청
				struct3.PubSet_Key					= PubS_KEY;		//가맹점Key
				struct3.PubSet_CPID					= CPID;
				struct3.PubSet_DaouTrx				= struct2.PubGet_DaouTrx;
				struct3.PubSet_CertType				= struct2.PubGet_CertType;
				struct3.PubSet_CertResultCode		= struct2.PubGet_ResultCode;
				struct3.PubSet_CertResultMsg		= struct2.PubGet_ErrorMessage;
				struct3.PubSet_UserEmail			= EMAIL;
				struct3.PubSet_UserMobileNo			= USERMOBILENO;
				struct3.PubSet_Amount				= AMOUNT;
				struct3.PubSet_Quota				= QUOTA;
				struct3.PubSet_NoIntFlag			= NOINTFLAG;
				struct3.PubSet_EncData1				= Crypto.Encrypt(PubS_KEY, CARDNO);
				struct3.PubSet_EncData2				= Crypto.Encrypt(PubS_KEY, EXPIRATIONDATE);
				struct3.PubSet_EncData3				= Crypto.Encrypt(PubS_KEY, CARDPASSWORD);
				struct3.PubSet_EncData4				= Crypto.Encrypt(PubS_KEY, CARDAUTH);
				struct3.PubSet_AuthReserved			= "";
				
				struct3 = payDirect.directCardAuth(struct3, PubS_LOGDIR+CPID);
				logger.debug("struct3=="+struct3.PubGet_ResultCode);
				
				if(struct3.PubGet_ResultCode.equals("0000")){
					
					RESULTCODE		=	struct3.PubGet_ResultCode;
					ERRORMESSAGE	=	struct3.PubGet_ErrorMessage;
					ORDERNO	= struct3.PubGet_OrderNo;
					AMOUNT	= struct3.PubGet_Amount;
					String DAOUTRX	= struct3.PubGet_DaouTrx;
					String AUTHNO 	= struct3.PubGet_AuthNO;
					String AUTHDATE	= struct3.PubGet_AuthDate;
					NOINTFLAG= struct3.PubGet_NoIntFlag;
					QUOTA	= struct3.PubGet_Quota;
					String DAOURESERVED1	= struct3.PubGet_DaouReserved1;
					String DAOURESERVED2	= struct3.PubGet_DaouReserved2;
					
					logger.debug("DAOUTRX=="+DAOUTRX);
					logger.debug("CPID=="+CPID);
					logger.debug("AMOUNT=="+AMOUNT);
					logger.debug("RESULTCODE=="+RESULTCODE);
					logger.debug("ERRORMESSAGE=="+ERRORMESSAGE);
					
					
					searchPaymentVO.setDaoutrx(DAOUTRX);
					searchPaymentVO.setAuthno(AUTHNO);
					searchPaymentVO.setAuthdate(AUTHDATE);
					searchPaymentVO.setResultcode(RESULTCODE);
					searchPaymentVO.setErrormessage(ERRORMESSAGE);
					paymentService.cardBillingLinkMod(searchPaymentVO);
					
		            result.put("SUCCESS", DAOUTRX);
		            
				} else {
					RESULTCODE		=	struct3.PubGet_ResultCode;
					ERRORMESSAGE	=	struct3.PubGet_ErrorMessage;
					
					searchPaymentVO.setDaoutrx(struct3.PubGet_DaouTrx);
					searchPaymentVO.setAuthno(struct3.PubGet_AuthNO);
					searchPaymentVO.setAuthdate(struct3.PubGet_AuthDate);
		            searchPaymentVO.setResultcode(RESULTCODE);
		            searchPaymentVO.setErrormessage(ERRORMESSAGE);
		            paymentService.cardBillingLinkMod(searchPaymentVO);
		            
		            result.put("FAILED", "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE);
		            
				}
				
			} else {
				RESULTCODE		=	struct2.PubGet_ResultCode;
				ERRORMESSAGE	=	struct2.PubGet_ErrorMessage;
				
	            if("9103".equals(RESULTCODE)) {
	            	result.put("9103", "관리자에게 과금 유형을 확인해 주세요.");
	            }else {
	            	searchPaymentVO.setDaoutrx(struct3.PubGet_DaouTrx);
	            	searchPaymentVO.setAuthno(struct3.PubGet_AuthNO);
	            	searchPaymentVO.setAuthdate(struct3.PubGet_AuthDate);
	            	searchPaymentVO.setResultcode(RESULTCODE);
	            	searchPaymentVO.setErrormessage(ERRORMESSAGE);
	            	paymentService.cardBilling(searchPaymentVO);
	            	
	            	result.put("FAILED", "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE);
	            }
	            
	            
			}
			
		} else {
			RESULTCODE		=	struct.PubGet_ResultCode;
			ERRORMESSAGE	=	struct.PubGet_ErrorMessage;
			
			searchPaymentVO.setDaoutrx(struct3.PubGet_DaouTrx);
			searchPaymentVO.setAuthno(struct3.PubGet_AuthNO);
			searchPaymentVO.setAuthdate(struct3.PubGet_AuthDate);
            searchPaymentVO.setResultcode(RESULTCODE);
            searchPaymentVO.setErrormessage(ERRORMESSAGE);
            paymentService.cardBillingLinkMod(searchPaymentVO);
            
            result.put("FAILED", "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE);
//            result = "[결제 실패] 에러코드 : "+RESULTCODE+" 에러메세지 : "+ERRORMESSAGE;
		}
		
		return result;
	}

	@RequestMapping(value = "/app/payment/cardCancel.do", produces="application/json;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Map appCardCancel(HttpServletRequest request, HttpServletResponse response, PaymentDefaultVO searchPaymentVO, Model model) throws IOException, SQLException {
		
		Map result = new HashMap<String, Object>();
		
		String PubS_DIRECTCARD_IP  = propertiesService.getString("card.dev"); 
		int PubI_DIRECTCARD_PORT = propertiesService.getInt("card.port"); 
		String PubS_LOGDIR = propertiesService.getString("card.log");
		String PubS_KEY = propertiesService.getString("card.key");
		
		PayStruct struct = new PayStruct();
		DaouDirectCardAPI payDirect = new DaouDirectCardAPI(PubS_DIRECTCARD_IP,PubI_DIRECTCARD_PORT);

	    String CPID     = CommonUtil.checkNull(request.getParameter("CPID"));        
	    String DAOUTRX  = CommonUtil.checkNull(request.getParameter("DAOUTRX"));                                           
		String AMOUNT   = CommonUtil.checkNull(request.getParameter("AMOUNT")); 
		String CANCELMEMO   = CommonUtil.checkNull(request.getParameter("CANCELMEMO")); 
		String CREATED_ID   = CommonUtil.checkNull(request.getParameter("CREATED_ID")); 
		String CANCELTYPE   = CommonUtil.checkNull(request.getParameter("CANCELTYPE")); 
		
		struct.PubSet_Key			 = PubS_KEY; 
		struct.PubSet_CPID			 = CPID;
		struct.PubSet_DaouTrx	 	 = DAOUTRX;
		struct.PubSet_Amount		 = AMOUNT;	
		struct.PubSet_CancelMemo	 = CANCELMEMO;
		struct = payDirect.directCardCancel(struct, PubS_LOGDIR+CPID);
		
		searchPaymentVO.setCpid(CPID);
		searchPaymentVO.setDaoutrx(DAOUTRX);
		searchPaymentVO.setAmount(AMOUNT);
		searchPaymentVO.setCancelmemo(CANCELMEMO);
		searchPaymentVO.setCreated_id(CREATED_ID);
		searchPaymentVO.setCanceltype(CANCELTYPE);
		paymentService.cardCancel(searchPaymentVO);
		
		if (struct.PubGet_ResultCode.equals("0000")){
			result.put("SUCCESS", DAOUTRX);
		}else {
			result.put("FAILED", "취소가 실패되었습니다.");
		}
		
		return result;
	}
}
