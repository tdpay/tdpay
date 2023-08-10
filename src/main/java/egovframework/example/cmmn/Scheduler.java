package egovframework.example.cmmn;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.baroservice.api.BarobillApiProfile;
import com.baroservice.api.BarobillApiService;
import com.baroservice.ws.ArrayOfTaxInvoiceTradeLineItem;
import com.baroservice.ws.InvoiceParty;
import com.baroservice.ws.NTSSendOption;
import com.baroservice.ws.TaxInvoice;
import com.baroservice.ws.TaxInvoiceTradeLineItem;
import com.ksnet.net.KSPGFtsUpDownLib;

import egovframework.example.cmmn.service.SchedulerService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Component
public class Scheduler {
	
	Logger logger = LoggerFactory.getLogger(Scheduler.class);
	
	@Resource(name = "schedulerService")
	private SchedulerService schedulerService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
    private BarobillApiService barobillApiService;

	
    public Scheduler() throws Exception {
        barobillApiService = new BarobillApiService(BarobillApiProfile.TESTBED);
    }
    
	/** * 
	 * 1. 2차 이하 PG 하위사업자 등록 전문 처리요청
	 * @throws Exception 
	 * */ 
//	@Scheduled(cron = "0 0 1 * * *") 
//	public void cronAuth2PgsbmUpload() throws IOException, SQLException{ 
//		logger.debug("~~~~~~~ 2차 이하 PG 하위사업자 등록 전문  처리요청~~~~~"); 
//		
//		if(propertiesService.getString("scheduler.on").equals("Y")) {
//			Calendar cal = Calendar.getInstance();
//			String toMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());
//			
//			Map<String, String> params = new HashMap<String, String>();
//			
//			StringBuilder sb = new StringBuilder();
//			List<Map<String, String>> list = schedulerService.auth2PgsbmList(params);
//			if(!list.isEmpty() && list.size() > 0) {
//				for(int i=0; i<list.size(); i++) {
//					sb.append(list.get(i).get("datas")+"\n");
//				}
//				
//				String path = propertiesService.getString("Globals.fileStorePath")+ File.separator + "pgsbm" + File.separator + "upload" + File.separator;
//				String fPath = path + toMonth + ".csv";
//				
//				CreateFile.createCsvFile(fPath, sb.toString());
//				
//				int rtn = KSPGFtsUpDownLib.fileUpload(propertiesService.getString("card2.file.server"), propertiesService.getInt("card2.file.server.port"), fPath, "PGSBM", propertiesService.getString("card2.cpid"), propertiesService.getString("card2.key"), toMonth);
//				// 리턴 값이 음수면 오류 그 외에는 정상
//				
//				params.put("recode_type", "D");
//				params.put("server_file", fPath);
//				params.put("file_type", "PGSBM");
//				params.put("result", String.valueOf(rtn));
//				schedulerService.auth2TgAdd(params);
//				
//				if (rtn < 0) {
//					logger.debug("FILE UPLOAD FAIL!!");
//				} else {
//					logger.debug("FILE UPLOAD SUCCESS!!");
//				}    		
//			}
//		}
//	}
	
	/** * 
	 * 2. 2차 이하 PG 하위사업자 등록 전문 결과 요청
	 * @throws Exception 
	 * */ 
//	@Scheduled(cron = "0 0 2 * * *") 
//	public void cronAuth2PgsbmDownload() throws IOException, SQLException{ 
//		logger.debug("~~~~~~~ 2차 이하 PG 하위사업자 등록 전문  결과 요청~~~~~"); 
//
//		if(propertiesService.getString("scheduler.on").equals("Y")) {
//			Calendar cal = Calendar.getInstance();
//			String toMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());
//			Map<String, String> params = new HashMap<String, String>();
//			params.put("file_type", "PGSBM");
//			params.put("ymd", toMonth);
//			int cnt = schedulerService.auth2TypeDList(params);
//			
//	    	if(cnt > 0) {
//		        
//		        String path = propertiesService.getString("Globals.fileStorePath")+ File.separator + "pgsbm" + File.separator + "download" + File.separator;
//		        String fPath = path + toMonth + ".csv";
//		        
//				int rtn = KSPGFtsUpDownLib.fileDownload(propertiesService.getString("card2.file.server"), propertiesService.getInt("card2.file.server.port"), fPath, "PGSBM", "1", propertiesService.getString("card2.cpid"), propertiesService.getString("card2.key"), toMonth);
//		
//				params.put("recode_type", "R");
//				params.put("server_file", fPath);
//				params.put("result", String.valueOf(rtn));
//				schedulerService.auth2TgAdd(params);
//				
//				// 리턴 값이 음수면 오류 그 외에는 정상
//				if (rtn < 0) {
//					logger.debug("FILE DOWNLOAD FAIL!!");
//				} else {
//					logger.debug("FILE DOWNLOAD SUCCESS!!");
//				}
//	    	}
//		}
//	}
	
	/** * 
	 * 3. 2차PG 차액정산 전문 처리요청
	 * @throws Exception 
	 * */ 
//	@Scheduled(cron = "0 0 3 * * *") 
//	public void cronAuth2PgtmsUpload() throws IOException, SQLException{ 
//		logger.debug("~~~~~~~ 2차PG 차액정산 전문 처리요청~~~~~"); 
//		
//		if(propertiesService.getString("scheduler.on").equals("Y")) {
//	        Calendar cal = Calendar.getInstance();
//	        String toMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());
//	
//	    	Map<String, String> params = new HashMap<String, String>();
//			
//			StringBuilder sb = new StringBuilder();
//			List<Map<String, String>> list = schedulerService.auth2PgtmsList(params);
//	    	if(!list.isEmpty() && list.size() > 0) {
//	    		for(int i=0; i<list.size(); i++) {
//	    			sb.append(list.get(i).get("datas")+"\n");
//	    		}
//	    		
//	    		String path = propertiesService.getString("Globals.fileStorePath")+ File.separator + "pgtms" + File.separator + "upload" + File.separator;
//	    		String fPath = path + toMonth + ".csv";
//	    		
//	    		CreateFile.createCsvFile(fPath, sb.toString());
//	    		
//	    		int rtn = KSPGFtsUpDownLib.fileUpload(propertiesService.getString("card2.file.server"), propertiesService.getInt("card2.file.server.port"), fPath, "PGTMS", propertiesService.getString("card2.cpid"), propertiesService.getString("card2.key"), toMonth);
//	    		// 리턴 값이 음수면 오류 그 외에는 정상
//	    		
//	    		params.put("recode_type", "D");
//	    		params.put("server_file", fPath);
//	    		params.put("file_type", "PGTMS");
//	    		params.put("result", String.valueOf(rtn));
//	    		schedulerService.auth2TgAdd(params);    		
//	    		
//	    		if (rtn < 0) {
//	    			logger.debug("FILE UPLOAD FAIL!!");
//	    		} else {
//	    			logger.debug("FILE UPLOAD SUCCESS!!");
//	    		}      		
//	    	}
//		}
//	}
	
	/** * 
	 * 4. 2차PG 차액정산 전문 결과 요청
	 * @throws Exception 
	 * */ 
//	@Scheduled(cron = "0 0 4 * * *") 
//	public void cronAuth2PgtmsDownload() throws IOException, SQLException{ 
//		logger.debug("~~~~~~~ 2차PG 차액정산 전문 결과 요청~~~~~"); 
//
//		if(propertiesService.getString("scheduler.on").equals("Y")) {
//			Calendar cal = Calendar.getInstance();
//			String toMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());
//			Map<String, String> params = new HashMap<String, String>();
//			params.put("file_type", "PGTMS");
//			params.put("ymd", toMonth);
//			int cnt = schedulerService.auth2TypeDList(params);
//			
//			if(cnt > 0) {
//		        
//				String path = propertiesService.getString("Globals.fileStorePath")+ File.separator + "pgtms" + File.separator + "download" + File.separator;
//				String fPath = path + toMonth + ".csv";
//				
//				int rtn = KSPGFtsUpDownLib.fileDownload(propertiesService.getString("card2.file.server"), propertiesService.getInt("card2.file.server.port"), fPath, "PGTMS", "1", propertiesService.getString("card2.cpid"), propertiesService.getString("card2.key"), toMonth);
//		
//				params.put("recode_type", "R");
//				params.put("server_file", fPath);
//				params.put("result", String.valueOf(rtn));
//				schedulerService.auth2TgAdd(params);    
//				
//				// 리턴 값이 음수면 오류 그 외에는 정상
//				if (rtn < 0) {
//					logger.debug("FILE DOWNLOAD FAIL!!");
//				} else {
//					logger.debug("FILE DOWNLOAD SUCCESS!!");
//				}
//			}
//		}
//	}
	
	/** * 
	 * 5. 바로빌 매출 호출 
	 * @throws Exception 
	 * */ 
	@Scheduled(cron = "0 0 1 * * *") 
	public void cronTaxStart() throws IOException, SQLException{ 
logger.debug("~~~~~~~ 바로빌 매출 호출  ~~~~~"); 
		
		String certKey = propertiesService.getString("tax.certkey");                                 //인증키
        String contactId = propertiesService.getString("tax.contactid");                             //바로빌 회원 아이디
        String businessNm = propertiesService.getString("tax.business.nm");                          //회사명
        
        String admin_id = propertiesService.getString("admin.id");                   		          //관리자 아이디
        logger.debug("certKey="+certKey); 
        
        Map<String, String> params = new HashMap<String, String>();
        params.put("store_id", admin_id);
        Map<String, String> adminStoreId = schedulerService.adminStoreId(params);
        
        String CorpNum = adminStoreId.get("corp_regist_num");
//        String CorpNum = "1078786839";
//        String CorpName = adminStoreId.get("business_nm");
        String CorpName = businessNm;
        String CEOName = adminStoreId.get("ceo");
        String Addr = adminStoreId.get("addr");
        String BizType = adminStoreId.get("industry_type");
        String BizClass = adminStoreId.get("business_cond");
        String ContactID = contactId;
        String ContactName = adminStoreId.get("ceo");
        String TEL = adminStoreId.get("tel");
        String HP = adminStoreId.get("phone_num");
        String Email = adminStoreId.get("email");
    	
        Calendar cal = Calendar.getInstance();
        String toMonth = new java.text.SimpleDateFormat("yyyy.MM.dd").format(cal.getTime());
//    	int day = cal.get(Calendar.DAY_OF_MONTH);

    	params.put("ymd", toMonth);
//    	params.put("period", String.valueOf(day));
//    	params.put("ymd", "202104");
//    	params.put("period", "6");
    	
        List<Map<String, String>> list = schedulerService.registAndIssueTaxInvoiceList(params);
        
        if(!list.isEmpty()) {
        	int etcSize = list.size();
        	
        	for(int i=0; i<etcSize; i++) {
        		
        		SimpleDateFormat formats = new SimpleDateFormat ("yyyyMMddHHmmssSSS");
            	String format_time = formats.format (System.currentTimeMillis());
            	
            	TaxInvoice taxInvoice = new TaxInvoice();

        		taxInvoice.setIssueDirection(1);                    //1-정발행, 2-역발행(위수탁 세금계산서는 정발행만 허용)
        		taxInvoice.setTaxInvoiceType(1);                    //1-세금계산서, 2-계산서, 4-위수탁세금계산서, 5-위수탁계산서

        		//-------------------------------------------
        		//과세형태
        		//-------------------------------------------
        		//TaxInvoiceType 이 1,4 일 때 : 1-과세, 2-영세
        		//TaxInvoiceType 이 2,5 일 때 : 3-면세
        		//-------------------------------------------
        		taxInvoice.setTaxType(1);
        		
        		taxInvoice.setTaxCalcType(1);                        //세율계산방법 : 1-절상, 2-절사, 3-반올림
        		taxInvoice.setPurposeType(2);                        //1-영수, 2-청구

        		//-------------------------------------------
        		//수정사유코드
        		//-------------------------------------------
        		//공백-일반세금계산서, 1-기재사항의 착오 정정, 2-공급가액의 변동, 3-재화의 환입, 4-계약의 해제, 5-내국신용장 사후개설, 6-착오에 의한 이중발행
        		//-------------------------------------------
        		taxInvoice.setModifyCode("");
        		
        		taxInvoice.setKwon("");                                //별지서식 11호 상의 [권] 항목
        		taxInvoice.setHo("");                                //별지서식 11호 상의 [호] 항목
        		taxInvoice.setSerialNum("");                        //별지서식 11호 상의 [일련번호] 항목

        		//-------------------------------------------
        		//공급가액 총액
        		//-------------------------------------------
        		taxInvoice.setAmountTotal(String.valueOf(list.get(i).get("settlement")));
        		
        		//-------------------------------------------
        		//세액합계
        		//-------------------------------------------
        		//taxInvoice.TaxType 이 2 또는 3 으로 셋팅된 경우 0으로 입력
        		//-------------------------------------------
        		taxInvoice.setTaxTotal(String.valueOf(list.get(i).get("commission")));
        		
        		//-------------------------------------------
        		//합계금액
        		//-------------------------------------------
        		//공급가액 총액 + 세액합계 와 일치해야 합니다.
        		//-------------------------------------------
        		taxInvoice.setTotalAmount(String.valueOf(list.get(i).get("amount")));

        		taxInvoice.setCash("");                                //현금
        		taxInvoice.setChkBill("");                            //수표
        		taxInvoice.setNote("");                                //어음
        		taxInvoice.setCredit("");                            //외상미수금

        		taxInvoice.setRemark1("");
        		taxInvoice.setRemark2("");
        		taxInvoice.setRemark3("");

        		taxInvoice.setWriteDate("");                        //작성일자 (YYYYMMDD), 공백입력 시 Today로 작성됨.

        		//-------------------------------------------
        		//공급자 정보 - 정발행시 세금계산서 작성자
        		//-------------------------------------------
        		taxInvoice.setInvoicerParty(new InvoiceParty());

        		taxInvoice.getInvoicerParty().setMgtNum(format_time);        //필수입력 - 연동사부여 문서키
        		taxInvoice.getInvoicerParty().setCorpNum("1078786839");      //필수입력 - 연계사업자 사업자번호 ('-' 제외, 10자리)
        		taxInvoice.getInvoicerParty().setTaxRegID("");
        		taxInvoice.getInvoicerParty().setCorpName(CorpName);          //필수입력
        		taxInvoice.getInvoicerParty().setCEOName(CEOName);        	  //필수입력
        		taxInvoice.getInvoicerParty().setAddr(Addr);
        		taxInvoice.getInvoicerParty().setBizType(BizType);
        		taxInvoice.getInvoicerParty().setBizClass(BizClass);
        		taxInvoice.getInvoicerParty().setContactID(ContactID);        //필수입력 - 담당자 바로빌 아이디
        		taxInvoice.getInvoicerParty().setContactName(ContactName);    //필수입력
        		taxInvoice.getInvoicerParty().setTEL(TEL);
        		taxInvoice.getInvoicerParty().setHP(HP);
        		taxInvoice.getInvoicerParty().setEmail(Email);           	  //필수입력

        		//-------------------------------------------
        		//공급받는자 정보 - 역발행시 세금계산서 작성자
        		//-------------------------------------------
        		taxInvoice.setInvoiceeParty(new InvoiceParty());

        		taxInvoice.getInvoiceeParty().setCorpNum(String.valueOf(list.get(i).get("corp_regist_num")));        //필수입력
        		taxInvoice.getInvoiceeParty().setTaxRegID("");
        		taxInvoice.getInvoiceeParty().setCorpName(String.valueOf(list.get(i).get("business_nm")));    	     //필수입력
        		taxInvoice.getInvoiceeParty().setCEOName(String.valueOf(list.get(i).get("ceo")));       	 //필수입력
        		taxInvoice.getInvoiceeParty().setAddr(String.valueOf(list.get(i).get("addr")));
        		taxInvoice.getInvoiceeParty().setBizType(String.valueOf(list.get(i).get("industry_type")));
        		taxInvoice.getInvoiceeParty().setBizClass(String.valueOf(list.get(i).get("business_cond")));
        		taxInvoice.getInvoiceeParty().setContactID("");
        		taxInvoice.getInvoiceeParty().setContactName(String.valueOf(list.get(i).get("person_nm2")));  		 //필수입력
        		taxInvoice.getInvoiceeParty().setTEL(String.valueOf(list.get(i).get("tel")));
        		taxInvoice.getInvoiceeParty().setHP(String.valueOf(list.get(i).get("person_phone2")));
        		taxInvoice.getInvoiceeParty().setEmail(String.valueOf(list.get(i).get("person_email2")));

        		//-------------------------------------------
        		//수탁자 정보 - 입력하지 않음
        		//-------------------------------------------
        		taxInvoice.setBrokerParty(new InvoiceParty());

        		taxInvoice.getBrokerParty().setCorpNum("");
        		taxInvoice.getBrokerParty().setTaxRegID("");
        		taxInvoice.getBrokerParty().setCorpName("");
        		taxInvoice.getBrokerParty().setCEOName("");
        		taxInvoice.getBrokerParty().setAddr("");
        		taxInvoice.getBrokerParty().setBizType("");
        		taxInvoice.getBrokerParty().setBizClass("");
        		taxInvoice.getBrokerParty().setContactID("");
        		taxInvoice.getBrokerParty().setContactName("");
        		taxInvoice.getBrokerParty().setTEL("");
        		taxInvoice.getBrokerParty().setHP("");
        		taxInvoice.getBrokerParty().setEmail("");

        		//-------------------------------------------
        		//품목
        		//-------------------------------------------
        		ArrayOfTaxInvoiceTradeLineItem arrayOfTaxInvoiceTradeLineItem = new ArrayOfTaxInvoiceTradeLineItem();

        		for (int j = 0; j < 4; j++) {
        			TaxInvoiceTradeLineItem taxInvoiceTradeLineItem = new TaxInvoiceTradeLineItem();
        			taxInvoiceTradeLineItem.setPurchaseExpiry(String.valueOf(list.get(i).get("to_date")));        //YYYYMMDD
        			taxInvoiceTradeLineItem.setName("수수료");				// 품목
        			taxInvoiceTradeLineItem.setInformation("");				// 규격 
        			taxInvoiceTradeLineItem.setChargeableUnit(String.valueOf(list.get(i).get("cnt")));			// 수량 
        			taxInvoiceTradeLineItem.setUnitPrice(String.valueOf(list.get(i).get("amount")));				// 단가
        			taxInvoiceTradeLineItem.setAmount(String.valueOf(list.get(i).get("settlement")));					// 공급가액
        			taxInvoiceTradeLineItem.setTax(String.valueOf(list.get(i).get("commission")));						// 세액 
        			taxInvoiceTradeLineItem.setDescription(String.valueOf(list.get(i).get("period_date")));			// 비고

        			arrayOfTaxInvoiceTradeLineItem.getTaxInvoiceTradeLineItem().add(taxInvoiceTradeLineItem);
        		}

        		taxInvoice.setTaxInvoiceTradeLineItems(arrayOfTaxInvoiceTradeLineItem);
        		
        		//-------------------------------------------

        		boolean sendSms = false;                        //문자 발송여부 (공급받는자 정보의 HP 항목이 입력된 경우에만 발송됨)

        		boolean forceIssue = false;                        //가산세가 예상되는 세금계산서 발행 여부

        		String mailTitle = "";                            //전송되는 이메일의 제목 설정 (공백 시 바로빌 기본 제목으로 전송됨)

        		//-------------------------------------------
        		
        		logger.info("Scheduler certKey : "+certKey);
        		logger.info("Scheduler result : "+taxInvoice.getInvoicerParty().getCorpNum());

        		int result = barobillApiService.taxInvoice.registAndIssueTaxInvoice(certKey, taxInvoice.getInvoicerParty().getCorpNum(), taxInvoice, sendSms, forceIssue, mailTitle);

        		System.out.println(result);
        		
        		if(result > 0) {
					schedulerService.taxStateCancelMod(params);
					//ReSendEmail(certKey, taxInvoice.getInvoicerParty().getCorpNum(), format_time, String.valueOf(list.get(i).get("person_email2")));
					//ChangeNTSSendOption(certKey, taxInvoice.getInvoicerParty().getCorpNum(), taxInvoice.getInvoicerParty().getContactID());
				}
        	}
        }
	}
	
	/** * 
	 * 6. 바로빌 매입 호출 
	 * @throws Exception 
	 * */ 
	@Scheduled(cron = "0 0 2 * * *") 
	public void cronTaxStart2() throws IOException, SQLException{ 
		logger.debug("~~~~~~~ 바로빌 매입 호출  ~~~~~"); 
		
		if(propertiesService.getString("scheduler.on").equals("Y")) {
			String certKey = propertiesService.getString("tax.certkey");                                 //인증키
			String contactId = propertiesService.getString("tax.contactid");                             //바로빌 회원 아이디
			String businessNm = propertiesService.getString("tax.business.nm");                          //회사명
			
			String admin_id = propertiesService.getString("admin.id");                   		          //관리자 아이디
			logger.debug("certKey="+certKey); 
			
			Map<String, String> params = new HashMap<String, String>();
			params.put("store_id", admin_id);
			Map<String, String> adminStoreId = schedulerService.adminStoreId(params);
			
			String CorpNum = adminStoreId.get("corp_regist_num");
			//        String CorpNum = "1078786839";
			//        String CorpName = adminStoreId.get("business_nm");
			String CorpName = businessNm;
			String CEOName = adminStoreId.get("ceo");
			String Addr = adminStoreId.get("addr");
			String BizType = adminStoreId.get("industry_type");
			String BizClass = adminStoreId.get("business_cond");
			String ContactID = contactId;
			String ContactName = adminStoreId.get("ceo");
			String TEL = adminStoreId.get("tel");
			String HP = adminStoreId.get("phone_num");
			String Email = adminStoreId.get("email");
			
			Calendar cal = Calendar.getInstance();
			String toMonth = new java.text.SimpleDateFormat("yyyy.MM.dd").format(cal.getTime());
//	    	int day = cal.get(Calendar.DAY_OF_MONTH);
			
			params.put("ymd", toMonth);
//	    	params.put("period", String.valueOf(day));
			//    	params.put("ymd", "202104");
			//    	params.put("period", "6");
			
			List<Map<String, String>> list = schedulerService.registAndReverseIssueTaxInvoiceList(params);
			
			if(!list.isEmpty()) {
				int etcSize = list.size();
				
				for(int i=0; i<etcSize; i++) {
					
					SimpleDateFormat formats = new SimpleDateFormat ("yyyyMMddHHmmssSSS");
					String format_time = formats.format (System.currentTimeMillis());
					
					TaxInvoice taxInvoice = new TaxInvoice();
					
					taxInvoice.setIssueDirection(2);                    //1-정발행, 2-역발행(위수탁 세금계산서는 정발행만 허용)
					taxInvoice.setTaxInvoiceType(1);                    //1-세금계산서, 2-계산서, 4-위수탁세금계산서, 5-위수탁계산서
					
					//-------------------------------------------
					//과세형태
					//-------------------------------------------
					//TaxInvoiceType 이 1,4 일 때 : 1-과세, 2-영세
					//TaxInvoiceType 이 2,5 일 때 : 3-면세
					//-------------------------------------------
					taxInvoice.setTaxType(1);
					
					taxInvoice.setTaxCalcType(1);                        //세율계산방법 : 1-절상, 2-절사, 3-반올림
					taxInvoice.setPurposeType(2);                        //1-영수, 2-청구
					
					//-------------------------------------------
					//수정사유코드
					//-------------------------------------------
					//공백-일반세금계산서, 1-기재사항의 착오 정정, 2-공급가액의 변동, 3-재화의 환입, 4-계약의 해제, 5-내국신용장 사후개설, 6-착오에 의한 이중발행
					//-------------------------------------------
					taxInvoice.setModifyCode("");
					
					taxInvoice.setKwon("");                                //별지서식 11호 상의 [권] 항목
					taxInvoice.setHo("");                                //별지서식 11호 상의 [호] 항목
					taxInvoice.setSerialNum("");                        //별지서식 11호 상의 [일련번호] 항목
					
					//-------------------------------------------
					//공급가액 총액
					//-------------------------------------------
					taxInvoice.setAmountTotal(String.valueOf(list.get(i).get("settlement")));
					
					//-------------------------------------------
					//세액합계
					//-------------------------------------------
					//taxInvoice.TaxType 이 2 또는 3 으로 셋팅된 경우 0으로 입력
					//-------------------------------------------
					taxInvoice.setTaxTotal(String.valueOf(list.get(i).get("commission")));
					
					//-------------------------------------------
					//합계금액
					//-------------------------------------------
					//공급가액 총액 + 세액합계 와 일치해야 합니다.
					//-------------------------------------------
					taxInvoice.setTotalAmount(String.valueOf(list.get(i).get("amount")));
					
					taxInvoice.setCash("");                                //현금
					taxInvoice.setChkBill("");                            //수표
					taxInvoice.setNote("");                                //어음
					taxInvoice.setCredit("");                            //외상미수금
					
					taxInvoice.setRemark1("");
					taxInvoice.setRemark2("");
					taxInvoice.setRemark3("");
					
					taxInvoice.setWriteDate("");                        //작성일자 (YYYYMMDD), 공백입력 시 Today로 작성됨.
					
					//-------------------------------------------
					//공급자 정보 - 정발행시 세금계산서 작성자
					//-------------------------------------------
					taxInvoice.setInvoicerParty(new InvoiceParty());
					
					taxInvoice.getInvoicerParty().setMgtNum(format_time);        //필수입력 - 연동사부여 문서키
					taxInvoice.getInvoicerParty().setCorpNum(CorpNum);        	  //필수입력 - 연계사업자 사업자번호 ('-' 제외, 10자리)
					taxInvoice.getInvoicerParty().setTaxRegID("");
					taxInvoice.getInvoicerParty().setCorpName(CorpName);          //필수입력
					taxInvoice.getInvoicerParty().setCEOName(CEOName);        	  //필수입력
					taxInvoice.getInvoicerParty().setAddr(Addr);
					taxInvoice.getInvoicerParty().setBizType(BizType);
					taxInvoice.getInvoicerParty().setBizClass(BizClass);
					taxInvoice.getInvoicerParty().setContactID(ContactID);        //필수입력 - 담당자 바로빌 아이디
					taxInvoice.getInvoicerParty().setContactName(ContactName);    //필수입력
					taxInvoice.getInvoicerParty().setTEL(TEL);
					taxInvoice.getInvoicerParty().setHP(HP);
					taxInvoice.getInvoicerParty().setEmail(Email);           	  //필수입력
					
					//-------------------------------------------
					//공급받는자 정보 - 역발행시 세금계산서 작성자
					//-------------------------------------------
					taxInvoice.setInvoiceeParty(new InvoiceParty());
					
					taxInvoice.getInvoiceeParty().setCorpNum(String.valueOf(list.get(i).get("corp_regist_num")));        //필수입력
					taxInvoice.getInvoiceeParty().setTaxRegID("");
					taxInvoice.getInvoiceeParty().setCorpName(String.valueOf(list.get(i).get("business_nm")));    	     //필수입력
					taxInvoice.getInvoiceeParty().setCEOName(String.valueOf(list.get(i).get("ceo")));       	 //필수입력
					taxInvoice.getInvoiceeParty().setAddr(String.valueOf(list.get(i).get("addr")));
					taxInvoice.getInvoiceeParty().setBizType(String.valueOf(list.get(i).get("industry_type")));
					taxInvoice.getInvoiceeParty().setBizClass(String.valueOf(list.get(i).get("business_cond")));
					taxInvoice.getInvoiceeParty().setContactID("");
					taxInvoice.getInvoiceeParty().setContactName(String.valueOf(list.get(i).get("person_nm2")));  		 //필수입력
					taxInvoice.getInvoiceeParty().setTEL(String.valueOf(list.get(i).get("tel")));
					taxInvoice.getInvoiceeParty().setHP(String.valueOf(list.get(i).get("person_phone2")));
					taxInvoice.getInvoiceeParty().setEmail(String.valueOf(list.get(i).get("person_email2")));
					
					//-------------------------------------------
					//수탁자 정보 - 입력하지 않음
					//-------------------------------------------
					taxInvoice.setBrokerParty(new InvoiceParty());
					
					taxInvoice.getBrokerParty().setCorpNum("");
					taxInvoice.getBrokerParty().setTaxRegID("");
					taxInvoice.getBrokerParty().setCorpName("");
					taxInvoice.getBrokerParty().setCEOName("");
					taxInvoice.getBrokerParty().setAddr("");
					taxInvoice.getBrokerParty().setBizType("");
					taxInvoice.getBrokerParty().setBizClass("");
					taxInvoice.getBrokerParty().setContactID("");
					taxInvoice.getBrokerParty().setContactName("");
					taxInvoice.getBrokerParty().setTEL("");
					taxInvoice.getBrokerParty().setHP("");
					taxInvoice.getBrokerParty().setEmail("");
					
					//-------------------------------------------
					//품목
					//-------------------------------------------
					TaxInvoiceTradeLineItem[] taxInvoiceTradeLineItems = new TaxInvoiceTradeLineItem[etcSize];
					
					for (int j = 0; j < etcSize; j++) {
						TaxInvoiceTradeLineItem taxInvoiceTradeLineItem = new TaxInvoiceTradeLineItem();
						taxInvoiceTradeLineItem.setPurchaseExpiry(String.valueOf(list.get(i).get("to_date")));        //YYYYMMDD
						taxInvoiceTradeLineItem.setName("수수료");				// 품목
						taxInvoiceTradeLineItem.setInformation("");				// 규격 
						taxInvoiceTradeLineItem.setChargeableUnit(String.valueOf(list.get(i).get("cnt")));			// 수량 
						taxInvoiceTradeLineItem.setUnitPrice(String.valueOf(list.get(i).get("amount")));				// 단가
						taxInvoiceTradeLineItem.setAmount(String.valueOf(list.get(i).get("settlement")));					// 공급가액
						taxInvoiceTradeLineItem.setTax(String.valueOf(list.get(i).get("commission")));						// 세액 
						taxInvoiceTradeLineItem.setDescription(String.valueOf(list.get(i).get("period_date")));			// 비고 
						
						taxInvoiceTradeLineItems[j] = taxInvoiceTradeLineItem;
					}
					
					//taxInvoice.setTaxInvoiceTradeLineItems(taxInvoiceTradeLineItems);
					
					//-------------------------------------------
					
					boolean sendSms = false;                        //문자 발송여부 (공급받는자 정보의 HP 항목이 입력된 경우에만 발송됨)
					boolean forceIssue = false;                        //가산세가 예상되는 세금계산서 발행 여부
					String mailTitle = "";                            //전송되는 이메일의 제목 설정 (공백 시 바로빌 기본 제목으로 전송됨)
					
					//-------------------------------------------
					
					int result = barobillApiService.taxInvoice.registAndReverseIssueTaxInvoice(certKey, taxInvoice.getInvoicerParty().getCorpNum(), taxInvoice, sendSms, forceIssue, mailTitle);
					logger.info("Scheduler result : "+result);
					
//					params.put("mgtnum", format_time);
//					params.put("corp_regist_num", String.valueOf(list.get(i).get("corp_regist_num")));
////	        		params.put("start_datetime", String.valueOf(list.get(i).get("start_date")));
////	        		params.put("end_datetime", String.valueOf(list.get(i).get("end_date")));
//					params.put("tax_type", "2");
//					params.put("result", String.valueOf(result));
//					schedulerService.taxResultAdd(params);
					
					if(result > 0) {
						schedulerService.taxStateCancelMod(params);
					}
					
				}
			}
		}
	}
	
	
	/**
	 * ReSendEmail - 이메일 전송
	 */
	@Test
	public void ReSendEmail(String certKeyVal, String corpNumVal, String mgtKeyVal, String emailVal) throws RemoteException {

		String certKey = certKeyVal;            //인증키
		String corpNum = corpNumVal;            //연계사업자 사업자번호 ('-' 제외, 10자리)
		String mgtKey = mgtKeyVal;                //연동사부여 문서키
		String toEmailAddress = emailVal;        //수신자 메일 주소

		/*int result = barobillApiService.taxInvoice.reSendEmail(certKey, corpNum, mgtKey, toEmailAddress);

		System.out.println(result);*/
	}
	
	/**
	 * ChangeNTSSendOption - 국세청 전송설정 변경
	 */
	@Test
	public void ChangeNTSSendOption(String certKeyVal, String corpNumVal, String contactId) throws RemoteException {

		String certKey = certKeyVal;            //인증키
		String corpNum = corpNumVal;            //연계사업자 사업자번호 ('-' 제외, 10자리)
		String id = contactId;                    //연계사업자 아이디

		NTSSendOption ntsSendOption = new NTSSendOption();

		//-------------------------------------------
		//과세, 영세 국세청 전송설정
		//-------------------------------------------
		//1-발행 익일 자동전송, 2-발행 즉시 전송
		//-------------------------------------------
		ntsSendOption.setTaxationOption(1);

		//-------------------------------------------
		//과세, 영세 가산세 허용여부
		//-------------------------------------------
		//1-허용, 0-차단
		//-------------------------------------------
		ntsSendOption.setTaxationAddTaxAllowYN(1);

		//-------------------------------------------
		//면세 국세청 전송설정
		//-------------------------------------------
		//1-발행 익일 자동전송, 2-발행 즉시 전송, 3-수동 전송
		//-------------------------------------------
		ntsSendOption.setTaxExemptionOption(1);

		//-------------------------------------------
		//면세 가산세 허용여부
		//-------------------------------------------
		//1-허용, 0-차단
		//-------------------------------------------
		ntsSendOption.setTaxExemptionAddTaxAllowYN(1);

		/*int result = barobillApiService.taxInvoice.changeNTSSendOption(certKey, corpNum, id, ntsSendOption);

		System.out.println(result);*/
	}

}
