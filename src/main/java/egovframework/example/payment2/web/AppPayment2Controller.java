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
package egovframework.example.payment2.web;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.payment2.service.Payment2DefaultVO;
import egovframework.example.payment2.service.Payment2Service;
import egovframework.example.payment2.service.Payment2VO;
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
public class AppPayment2Controller {

	Logger logger = LoggerFactory.getLogger(AppPayment2Controller.class);
	/** EgovSampleService */
	@Resource(name = "payment2Service")
	private Payment2Service payment2Service;

    @Autowired
    private SmsSendService smsSendService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

    private void applog(Object o) {
        logger.debug("[" + LocalDateTime.now().toString() + "] - " + o == null ? "null" : o.toString());
    }
    
	@RequestMapping(value = "/app/payment2/pay.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String appPayment2(Payment2DefaultVO searchPayment2VO, HttpServletRequest request, Model model) throws IOException, SQLException {
		
		Payment2VO payment2Vo = payment2Service.selectCardBillingLink2(searchPayment2VO);
		
		model.addAttribute("payment2Vo", payment2Vo);
		return "app/payment2/pay";
	}
    
	@RequestMapping(value = "/app/payment2/payment.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String payment2(HttpServletRequest request, Model model) throws IOException {
		
		String CPID				   	 = propertiesService.getString("card2.cpid"); 
		model.addAttribute("CPID", CPID);
		
		return "app/payment2/payment";
	}	
	
	@RequestMapping(value = "/app/payment2/cardSugido.do", produces="text/plain;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object app_cardSugido2(HttpServletRequest request, HttpServletResponse response, Payment2DefaultVO searchPayment2VO, Model model) throws IOException, SQLException, ParseException {
		
		Object result=null;
		
		String API_URL 		 = propertiesService.getString("card2.api.pay.url");
		String API_KEY 		 = propertiesService.getString("card2.key2");
		String USERID  		 = request.getParameter("USERID");
		String mid  		 = request.getParameter("mid");
		String orderNumb   	 = request.getParameter("orderNumb");
		String userName    	 = request.getParameter("userName");
		String userEmail 	 = request.getParameter("userEmail");
		String productType   = request.getParameter("productType");
		String productName   = request.getParameter("productName");
		String totalAmount   = request.getParameter("totalAmount");
		String taxFreeAmount = request.getParameter("taxFreeAmount");
		String interestType  = request.getParameter("interestType");
		String cardNumb      = request.getParameter("cardNumb");
		String expiryDate    = request.getParameter("expiryDate");
		String installMonth  = request.getParameter("installMonth");
		String currencyType  = request.getParameter("currencyType");
		String sndMobile  = request.getParameter("sndMobile");
		
  	    JSONObject inner = new JSONObject();
        inner.put("mid",  mid); 
        inner.put("orderNumb", orderNumb); 
        inner.put("userName", userName); 
        inner.put("userEmail", userEmail); 
        inner.put("productType", productType); 
        inner.put("productName", productName); 
        inner.put("totalAmount", totalAmount); 
        inner.put("taxFreeAmount", taxFreeAmount); 
        inner.put("payload", ""); 
        inner.put("interestType", interestType); 
        inner.put("cardNumb", cardNumb); 
        inner.put("expiryDate", expiryDate); 
        inner.put("installMonth", installMonth); 
        inner.put("currencyType", currencyType); 
	      
        try {
            logger.debug("API_URL : "+ API_URL);
            logger.debug("API_KEY : "+ API_KEY);
            logger.debug("inner : "+ inner.toJSONString());
            String responseStr = Payment2Controller.apiRequest(API_URL, API_KEY, inner.toJSONString());
            logger.debug("responseStr : "+ responseStr);
            applog(responseStr);
            
            JSONParser parser = new JSONParser();
            Object obj = parser.parse( responseStr );
            JSONObject jsonObj = (JSONObject) obj;
    		JSONObject Object = (JSONObject) jsonObj.get("data");
            
            String aid = (String) jsonObj.get("aid");
            String code = (String) jsonObj.get("code");
            String message = (String) jsonObj.get("message");
            
            logger.debug("aid : "+ aid + ", code : "+ code + ", message : "+ message);
            
            String tid = (String) Object.get("tid");
            String tradeDateTime = (String) Object.get("tradeDateTime");
            totalAmount = (String) Object.get("totalAmount");
            String respCode = (String) Object.get("respCode");
            String respMessage = (String) Object.get("respMessage");
//            String payload = (String) Object.get("payload");
            String issuerCardType = (String) Object.get("issuerCardType");
//            String issuerCardName = (String) Object.get("issuerCardName");
            String purchaseCardType = (String) Object.get("purchaseCardType");
//            String purchaseCardName = (String) Object.get("purchaseCardName");
            String approvalNumb = (String) Object.get("approvalNumb");
//            cardNumb = (String) Object.get("cardNumb");
            expiryDate = (String) Object.get("expiryDate");
            installMonth = (String) Object.get("installMonth");
//            String cardType = (String) Object.get("cardType");
//            String partCancelYn = (String) Object.get("partCancelYn");
            
            result = message.toUpperCase();
            
            if(!result.equals("SUCCESS")) {
            	result = respMessage;
            }
            
            searchPayment2VO.setCpid(mid);
            searchPayment2VO.setUserid(USERID);
            searchPayment2VO.setCardno(cardNumb);
            searchPayment2VO.setQuota(installMonth);
            searchPayment2VO.setProducttype(productType);
            searchPayment2VO.setProductname(productName);
            searchPayment2VO.setUsername(userName);
            searchPayment2VO.setUserphone(sndMobile);
            searchPayment2VO.setEmail(userEmail);
            searchPayment2VO.setDaoutrx(tid);
            searchPayment2VO.setAuthdate(tradeDateTime);
            searchPayment2VO.setAmount(totalAmount);
            searchPayment2VO.setAuthno(approvalNumb);
            searchPayment2VO.setMessage1(respCode);
            searchPayment2VO.setMessage2(respMessage);
            searchPayment2VO.setOrderno(orderNumb);
            searchPayment2VO.setIsscd(issuerCardType);
            searchPayment2VO.setAqucd(purchaseCardType);
            if(result.equals("SUCCESS")) {
            	searchPayment2VO.setResultcode("0000");
            }else {
            	searchPayment2VO.setResultcode(respCode);
            }
            
            payment2Service.cardBilling2(searchPayment2VO);
			
		} catch (FileNotFoundException e) {
			
			logger.debug("Payment2Controller cardSugido2 Exception : "+e);
		} catch (IOException e) {
			
        	logger.debug("Payment2Controller cardSugido2 Exception : "+e);
        }
        
		
		return result;
	}
	

	@RequestMapping(value = "/app/payment2/payment_link_sms.do", produces="text/plain;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object app_payment2_link_sms(Payment2DefaultVO searchPayment2VO, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, SQLException {
		
		Object result=null;
		
		String CPID				    =  propertiesService.getString("card2.cpid"); 
		String USERID 				=  request.getParameter("USERID"); 
		
		String productType 			=  request.getParameter("productType"); 
		String productName		    =  request.getParameter("productName"); 
		String userName		 	    =  request.getParameter("userName"); 
		String sndMobile 			=  request.getParameter("sndMobile"); 
		String sndEmail 			=  request.getParameter("sndEmail"); 
		String totalAmount 			=  request.getParameter("totalAmount"); 
		String orderNumb 			=  request.getParameter("orderNumb"); 
		String sms_quota	 		=  request.getParameter("sms_quota"); 
		
		searchPayment2VO.setCpid(CPID);
		searchPayment2VO.setUserid(USERID);
		searchPayment2VO.setProducttype(productType);
		searchPayment2VO.setProductname(productName);
		searchPayment2VO.setUsername(userName);
		searchPayment2VO.setUserphone(sndMobile);
		searchPayment2VO.setEmail(sndEmail);
		searchPayment2VO.setAmount(totalAmount);
		searchPayment2VO.setOrderno(orderNumb);
		searchPayment2VO.setSms_quota(sms_quota);
		
		payment2Service.cardBillingLink2(searchPayment2VO);
		
		String cardUrlSend  = propertiesService.getString("card2.url.send")+"?no="+searchPayment2VO.getNo(); 
		logger.debug("cardUrlSend=="+cardUrlSend);
		logger.debug("getUserphone()=="+searchPayment2VO.getUserphone());
		
		result = smsSendService.sendAuthSmsLink(searchPayment2VO.getUserphone(), cardUrlSend);
		
        return result;
	}
	
	@RequestMapping(value = "/app/pay2/cardSugido.do", produces="text/plain;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object appCardSugido2(HttpServletRequest request, HttpServletResponse response, Payment2DefaultVO searchPayment2VO, Model model) throws IOException, SQLException, ParseException {
		
		Object result=null;
		
		String API_URL 		 = propertiesService.getString("card2.api.pay.url");
		String API_KEY 		 = propertiesService.getString("card2.key2");
		String USERID  		 = request.getParameter("USERID");
		String no		  	 = request.getParameter("no"); 
		String mid  		 = request.getParameter("mid");
		String orderNumb   	 = request.getParameter("orderNumb");
		String userName    	 = request.getParameter("userName");
		String userEmail 	 = request.getParameter("userEmail");
		String productType   = request.getParameter("productType");
		String productName   = request.getParameter("productName");
		String totalAmount   = request.getParameter("totalAmount");
		String taxFreeAmount = request.getParameter("taxFreeAmount");
		String interestType  = request.getParameter("interestType");
		String cardNumb      = request.getParameter("cardNumb");
		String expiryDate    = request.getParameter("expiryDate");
		String installMonth  = request.getParameter("installMonth");
		String currencyType  = request.getParameter("currencyType");
		String sndMobile  = request.getParameter("sndMobile");
		
  	    JSONObject inner = new JSONObject();
        inner.put("mid",  mid); 
        inner.put("orderNumb", orderNumb); 
        inner.put("userName", userName); 
        inner.put("userEmail", userEmail); 
        inner.put("productType", productType); 
        inner.put("productName", productName); 
        inner.put("totalAmount", totalAmount); 
        inner.put("taxFreeAmount", taxFreeAmount); 
        inner.put("payload", ""); 
        inner.put("interestType", interestType); 
        inner.put("cardNumb", cardNumb); 
        inner.put("expiryDate", expiryDate); 
        inner.put("installMonth", installMonth); 
        inner.put("currencyType", currencyType); 
	      
        try {
            logger.debug("API_URL : "+ API_URL);
            logger.debug("API_KEY : "+ API_KEY);
            logger.debug("inner : "+ inner.toJSONString());
            String responseStr = Payment2Controller.apiRequest(API_URL, API_KEY, inner.toJSONString());
            logger.debug("responseStr : "+ responseStr);
            applog(responseStr);
            
            JSONParser parser = new JSONParser();
            Object obj = parser.parse( responseStr );
            JSONObject jsonObj = (JSONObject) obj;
    		JSONObject Object = (JSONObject) jsonObj.get("data");
            
            String aid = (String) jsonObj.get("aid");
            String code = (String) jsonObj.get("code");
            String message = (String) jsonObj.get("message");
            
            logger.debug("aid : "+ aid + ", code : "+ code + ", message : "+ message);
            
            String tid = (String) Object.get("tid");
            String tradeDateTime = (String) Object.get("tradeDateTime");
            totalAmount = (String) Object.get("totalAmount");
            String respCode = (String) Object.get("respCode");
            String respMessage = (String) Object.get("respMessage");
//            String payload = (String) Object.get("payload");
            String issuerCardType = (String) Object.get("issuerCardType");
//            String issuerCardName = (String) Object.get("issuerCardName");
            String purchaseCardType = (String) Object.get("purchaseCardType");
//            String purchaseCardName = (String) Object.get("purchaseCardName");
            String approvalNumb = (String) Object.get("approvalNumb");
//            cardNumb = (String) Object.get("cardNumb");
            expiryDate = (String) Object.get("expiryDate");
            installMonth = (String) Object.get("installMonth");
//            String cardType = (String) Object.get("cardType");
//            String partCancelYn = (String) Object.get("partCancelYn");
            
            result = message.toUpperCase();
            
            if(!result.equals("SUCCESS")) {
            	result = respMessage;
            }
            
            searchPayment2VO.setNo(no);
            searchPayment2VO.setCpid(mid);
            searchPayment2VO.setUserid(USERID);
            searchPayment2VO.setCardno(cardNumb);
            searchPayment2VO.setQuota(installMonth);
            searchPayment2VO.setProducttype(productType);
            searchPayment2VO.setProductname(productName);
            searchPayment2VO.setUsername(userName);
            searchPayment2VO.setUserphone(sndMobile);
            searchPayment2VO.setEmail(userEmail);
            searchPayment2VO.setDaoutrx(tid);
            searchPayment2VO.setAuthdate(tradeDateTime);
            searchPayment2VO.setAmount(totalAmount);
            searchPayment2VO.setAuthno(approvalNumb);
            searchPayment2VO.setMessage1(respCode);
            searchPayment2VO.setMessage2(respMessage);
            searchPayment2VO.setOrderno(orderNumb);
            searchPayment2VO.setIsscd(issuerCardType);
            searchPayment2VO.setAqucd(purchaseCardType);
            if(result.equals("SUCCESS")) {
            	searchPayment2VO.setResultcode("0000");
            }else {
            	searchPayment2VO.setResultcode(respCode);
            }
            
            payment2Service.cardBillingLinkMod2(searchPayment2VO);
        
		} catch (FileNotFoundException e) {
			
			logger.debug("AppPayment2Controller appCardSugido2 Exception : "+e);
		} catch (IOException e) {
			
	    	logger.debug("AppPayment2Controller appCardSugido2 Exception : "+e);
	    }		
        
		return result;
	}
	
	@RequestMapping(value = "/app/payment2/cardCancel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public void appCardCancel2(HttpServletRequest request, HttpServletResponse response, Payment2DefaultVO searchPayment2VO, Model model) throws IOException, SQLException, ParseException {
		
		String API_URL 				= propertiesService.getString("card2.api.cancel.url");
		String API_KEY 				= propertiesService.getString("card2.key2");
		String mid				    =  propertiesService.getString("card2.cpid"); 
		String CANCELTYPE			= request.getParameter("CANCELTYPE");
		String AMOUNT				= request.getParameter("AMOUNT");
		
		String cancelType;
		if(CANCELTYPE.equals("1")) {
			cancelType = "FULL";
		}else {
			cancelType = "PARTIAL";
		}
		
		String tradeKeyType			= "TID";
		String orgTradeKey			= request.getParameter("DAOUTRX");
//		String orgTradeDate			= request.getParameter("orgTradeDate");
		String cancelTotalAmount	= request.getParameter("AMOUNT2");
		String cancelSeq			= request.getParameter("cancelSeq");
		String CREATED_ID			= request.getParameter("CREATED_ID");
		
  	    JSONObject inner = new JSONObject();
        inner.put("mid",  mid); 
        inner.put("payload",  ""); 
        inner.put("cancelType", cancelType); 
        inner.put("tradeKeyType", tradeKeyType); 
        inner.put("orgTradeKey", orgTradeKey); 
        if(CANCELTYPE.equals("3")) {
        	inner.put("cancelTotalAmount", cancelTotalAmount); 
        	inner.put("cancelTaxFreeAmount", "0"); 
        	inner.put("cancelSeq", "1"); 
        }
        
        logger.debug("API_URL : "+ API_URL);
        logger.debug("API_KEY : "+ API_KEY);
        logger.debug("inner : "+ inner.toJSONString());
        String responseStr = Payment2Controller.apiRequest(API_URL, API_KEY, inner.toJSONString());
        applog(responseStr);
        logger.debug("responseStr : "+ responseStr);
        
        JSONParser parser = new JSONParser();
        Object obj = parser.parse( responseStr );
        JSONObject jsonObj = (JSONObject) obj;
		JSONObject Object = (JSONObject) jsonObj.get("data");
        
        String aid = (String) jsonObj.get("aid");
        String code = (String) jsonObj.get("code");
        String message = (String) jsonObj.get("message");
        
        logger.debug("aid : "+ aid + ", code : "+ code + ", message : "+ message);
        
        String respMessage = (String) Object.get("respMessage");
		
		searchPayment2VO.setCpid(mid);
		searchPayment2VO.setCanceltype(CANCELTYPE);
		searchPayment2VO.setDaoutrx(orgTradeKey);
		if(CANCELTYPE.equals("1")) {
			searchPayment2VO.setAmount(AMOUNT);
		}else {
			searchPayment2VO.setAmount(cancelTotalAmount);
		}
		searchPayment2VO.setCancelmemo(respMessage);
		searchPayment2VO.setCreated_id(CREATED_ID);
		payment2Service.cardCancel2(searchPayment2VO);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (message.toUpperCase().equals("SUCCESS")){
			out.println("alert('정상적으로 취소되었습니다.');");
		}else {
			out.println("alert('취소가 실패되었습니다.');");
		}
		out.println("location.href='/app/history/history_all.do'");
		out.println("</script>");
        out.flush();
        out.close();			
	}	
}
