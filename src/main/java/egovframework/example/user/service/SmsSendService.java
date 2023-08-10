package egovframework.example.user.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("smsSendService")
public class SmsSendService {

	Logger logger = LoggerFactory.getLogger(SmsSendService.class);
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	final String encodingType = "utf-8";
	final String boundary = "____boundary____";
	
	private int size;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }
    
	
	public String sendAuthSms(String receiver) {
		
		String authKey = getKey(5);
		
		InputStreamReader isr = null;
		BufferedReader in = null;
		
		try{
			
			/**************** 문자전송하기 예제 ******************/
			/* "result_code":결과코드,"message":결과문구, */
			/* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
			/* 동일내용 > 전송용 입니다.  
			/******************** 인증정보 ********************/
			
			String sms_url = propertiesService.getString("sms.url"); // 전송요청 URL
			Map<String, String> sms = new HashMap<String, String>();
			
			sms.put("key", propertiesService.getString("sms.key")); //인증키
			sms.put("user_id", propertiesService.getString("sms.id")); // SMS 아이디
			
			/******************** 인증정보 ********************/
			
			/******************** 전송정보 ********************/
			sms.put("sender", propertiesService.getString("sms.sender")); // 발신번호
			sms.put("receiver", receiver); // 수신번호
			sms.put("msg", "인증번호 안내메일 ["+authKey+"]"); // 메세지 내용
	//		sms.put("destination", "01111111111|담당자,01111111112|홍길동"); // 수신인 %고객명% 치환
	//		sms.put("rdate", ""); // 예약일자 - 20161004 : 2016-10-04일기준
	//		sms.put("rtime", ""); // 예약시간 - 1930 : 오후 7시30분
			sms.put("testmode_yn", propertiesService.getString("sms.testmode_yn")); // Y 인경우 실제문자 전송X , 자동취소(환불) 처리
	//		sms.put("title", "제목입력"); //  LMS, MMS 제목 (미입력시 본문중 44Byte 또는 엔터 구분자 첫라인)
			
	//		String image = null;
			//image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치
			
			/******************** 전송정보 ********************/
			
			logger.debug("authKey=="+authKey);
			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
			builder.setBoundary(boundary);
			builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
			builder.setCharset(Charset.forName(encodingType));
			
			for(Iterator<String> i = sms.keySet().iterator(); i.hasNext();){
				String key = i.next();
				builder.addTextBody(key, sms.get(key) , ContentType.create("Multipart/related", encodingType));
			}
			
			
	//		File imageFile = new File(image);
	//		if(image!=null && image.length()>0 && imageFile.exists()){
	//	
	//			builder.addPart("image", new FileBody(imageFile, ContentType.create("application/octet-stream"), URLEncoder.encode(imageFile.getName(), encodingType)));
	//		}
			
			HttpEntity entity = builder.build();
			HttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(sms_url);
			post.setEntity(entity);
			
			HttpResponse res = client.execute(post);
			String result = "";
			
			if(res != null){
				isr = new InputStreamReader(res.getEntity().getContent(), encodingType);
				in = new BufferedReader(isr);
				String buffer = null;
				while((buffer = in.readLine())!=null){
					result += buffer;
				}
			}
			
			logger.debug("result=="+result);

		} catch (FileNotFoundException e) {
			logger.debug("SmsSendService sendAuthSms Exception : "+e);
		} catch (IOException e) {
			logger.debug("SmsSendService sendAuthSms Exception : "+e);
		} finally {
            try {
                if (in != null)
                	in.close();
                
                if (isr != null)
                	isr.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
		
		return authKey;	
	}
	
	public String sendAuthSmsPw(String receiver, String pw) {
		
		InputStreamReader isr = null;
		BufferedReader in = null;
		
		try{
			
			/**************** 문자전송하기 예제 ******************/
			/* "result_code":결과코드,"message":결과문구, */
			/* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
			/* 동일내용 > 전송용 입니다.  
			/******************** 인증정보 ********************/
			
			String sms_url = propertiesService.getString("sms.url"); // 전송요청 URL
			Map<String, String> sms = new HashMap<String, String>();
			
			sms.put("key", propertiesService.getString("sms.key")); //인증키
			sms.put("user_id", propertiesService.getString("sms.id")); // SMS 아이디
			
			/******************** 인증정보 ********************/
			
			/******************** 전송정보 ********************/
			sms.put("sender", propertiesService.getString("sms.sender")); // 발신번호
			sms.put("receiver", receiver); // 수신번호
			sms.put("msg", "임시비밀번호 안내메일 ["+pw+"]"); // 메세지 내용
			//		sms.put("destination", "01111111111|담당자,01111111112|홍길동"); // 수신인 %고객명% 치환
			//		sms.put("rdate", ""); // 예약일자 - 20161004 : 2016-10-04일기준
			//		sms.put("rtime", ""); // 예약시간 - 1930 : 오후 7시30분
			sms.put("testmode_yn", propertiesService.getString("sms.testmode_yn")); // Y 인경우 실제문자 전송X , 자동취소(환불) 처리
			//		sms.put("title", "제목입력"); //  LMS, MMS 제목 (미입력시 본문중 44Byte 또는 엔터 구분자 첫라인)
			
			//		String image = null;
			//image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치
			
			/******************** 전송정보 ********************/
			
			logger.debug("pw=="+pw);
			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
			builder.setBoundary(boundary);
			builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
			builder.setCharset(Charset.forName(encodingType));
			
			for(Iterator<String> i = sms.keySet().iterator(); i.hasNext();){
				String key = i.next();
				builder.addTextBody(key, sms.get(key) , ContentType.create("Multipart/related", encodingType));
			}
			
			
			//		File imageFile = new File(image);
			//		if(image!=null && image.length()>0 && imageFile.exists()){
			//	
			//			builder.addPart("image", new FileBody(imageFile, ContentType.create("application/octet-stream"), URLEncoder.encode(imageFile.getName(), encodingType)));
			//		}
			
			HttpEntity entity = builder.build();
			HttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(sms_url);
			post.setEntity(entity);
			
			HttpResponse res = client.execute(post);
			String result = "";
			
			if(res != null){
				isr = new InputStreamReader(res.getEntity().getContent(), encodingType);
				in = new BufferedReader(isr);				
				String buffer = null;
				while((buffer = in.readLine())!=null){
					result += buffer;
				}
			}
			
			logger.debug("result=="+result);
		} catch (FileNotFoundException e) {
			logger.debug("SmsSendService sendAuthSmsPw Exception : "+e);
		} catch (IOException e) {
			logger.debug("SmsSendService sendAuthSmsPw Exception : "+e);
		} finally {
            try {
                if (in != null)
                	in.close();
                
                if (isr != null)
                	isr.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
		
		return pw;	
	}
	
	public String sendAuthSmsLink(String receiver, String link) {
		
		InputStreamReader isr = null;
		BufferedReader in = null;
		
		try{
			
			/**************** 문자전송하기 예제 ******************/
			/* "result_code":결과코드,"message":결과문구, */
			/* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
			/* 동일내용 > 전송용 입니다.  
			/******************** 인증정보 ********************/
			
			String sms_url = propertiesService.getString("sms.url"); // 전송요청 URL
			Map<String, String> sms = new HashMap<String, String>();
			
			sms.put("key", propertiesService.getString("sms.key")); //인증키
			sms.put("user_id", propertiesService.getString("sms.id")); // SMS 아이디
			
			/******************** 인증정보 ********************/
			
			/******************** 전송정보 ********************/
			sms.put("sender", propertiesService.getString("sms.sender")); // 발신번호
			sms.put("receiver", receiver); // 수신번호
			sms.put("msg", "결제서비스입니다.\n"+link); // 메세지 내용
	//		sms.put("destination", "01111111111|담당자,01111111112|홍길동"); // 수신인 %고객명% 치환
	//		sms.put("rdate", ""); // 예약일자 - 20161004 : 2016-10-04일기준
	//		sms.put("rtime", ""); // 예약시간 - 1930 : 오후 7시30분
			sms.put("testmode_yn", propertiesService.getString("sms.testmode_yn")); // Y 인경우 실제문자 전송X , 자동취소(환불) 처리
	//		sms.put("title", "제목입력"); //  LMS, MMS 제목 (미입력시 본문중 44Byte 또는 엔터 구분자 첫라인)
			
	//		String image = null;
			//image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치
			
			/******************** 전송정보 ********************/
			
			logger.debug("link=="+link);
			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
			builder.setBoundary(boundary);
			builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
			builder.setCharset(Charset.forName(encodingType));
			
			for(Iterator<String> i = sms.keySet().iterator(); i.hasNext();){
				String key = i.next();
				builder.addTextBody(key, sms.get(key) , ContentType.create("Multipart/related", encodingType));
			}
			
			
	//		File imageFile = new File(image);
	//		if(image!=null && image.length()>0 && imageFile.exists()){
	//	
	//			builder.addPart("image", new FileBody(imageFile, ContentType.create("application/octet-stream"), URLEncoder.encode(imageFile.getName(), encodingType)));
	//		}
			
			HttpEntity entity = builder.build();
			HttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(sms_url);
			post.setEntity(entity);
			
			HttpResponse res = client.execute(post);
			String result = "";
			
			if(res != null){
				isr = new InputStreamReader(res.getEntity().getContent(), encodingType);
				in = new BufferedReader(isr);
				String buffer = null;
				while((buffer = in.readLine())!=null){
					result += buffer;
				}
			}
			
			logger.debug("result=="+result);
		} catch (FileNotFoundException e) {
			logger.debug("SmsSendService sendAuthSmsLink Exception : "+e);
		} catch (IOException e) {
			logger.debug("SmsSendService sendAuthSmsLink Exception : "+e);
		} finally {
            try {
                if (in != null)
                	in.close();
                
                if (isr != null)
                	isr.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
		
		return link;	
	}
}
