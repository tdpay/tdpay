package egovframework.example.user.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.MailUtils;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("mss")
public class MailSendService {
	
	Logger logger = LoggerFactory.getLogger(MailSendService.class);
	
    @Autowired
    private JavaMailSenderImpl mailSender;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
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

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(5);
        StringBuffer sb = new StringBuffer();

		sb.append("	<!DOCTYPE html>		");
		sb.append("	<html lang='ko'> 	");
		sb.append("	<head>				");
		sb.append("	    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>	");
		sb.append("	    <meta name='viewport' content='width=device-width,initial-scale=1.0' />	");
		sb.append("	    <meta http-equiv='X-UA-Compatible' content='IE=edge'>	");
		sb.append("	    <meta name='format-detection' content='telephone=no, address=no, email=no' />	");
		sb.append("	    <title>Starup∂</title>	");
		sb.append("	</head>	");
		sb.append("	<body style='margin:0;padding:0;'>	");
		sb.append("		<div id='mailing_wrap' style='width:770px; margin:0px auto; border:solid 20px #f2f2f2; background-color:#f2f2f2; box-sizing:border-box;'> ");
		sb.append("			<header style='height:80px; background-color: #fff; overflow:hidden; border-bottom: 1px solid #3a3a3c;'>	");
		sb.append("				<h1 style='margin:0; padding:0;'><a href='#!' style='margin:0; padding:0;'><img src='mailing_logo.png' alt='' style='float:left; vertical-align:middle; line-height:80px; margin:28px 30px;'></a></h1> ");
		sb.append("				<h2 style='float:right; padding:0; margin:0; margin-right:30px; line-height:80px; color: #3a3a3c; font-size:24px; font-weight:400;'>인증번호 안내메일</h2> ");
		sb.append("			</header>	");
		sb.append("			<section class='mailing_container' style=' box-sizing:border-box; padding:45px 40px 70px 40px; text-align:left; background-color:#fff; '>	");
		sb.append("				<p style='line-height:24px; margin:0;padding:0;font-size:14px;'>안녕하세요. </p>	");
		sb.append("				<p style='line-height:24px; margin:0;padding:0;font-size:14px;'>인증번호를 알려드리겠습니다.</p>	");
		sb.append("				<div style='margin-top:20px;'>	");
		sb.append("					<table cellspacing=0; cellpadding=0; style='width:100%;'>	");
		sb.append("					<tbody style='display:grid; border-top:solid 2px #888888;'>	");
		sb.append("						<tr style='display:block; width:100%; height:50px; line-height:50px; border-bottom:solid 1px #dcdcdc; font-size:14px;'>	");
		sb.append("							<th style='width:160px;padding:0 0 0 20px; box-sizing:border-box;'>인증번호</th>	");
		sb.append("							<td>"+authKey+"</td>	");
		sb.append("						</tr>	");
		sb.append("					</tbody>	");
		sb.append("				</table>		");
		sb.append("				</div>			");
		sb.append("			</section>			");
		sb.append("			<section class='mailing_container2' style='padding:30px 0 30px 43px; margin:30px 0 0 0; background-color:#fff;'>	");
		sb.append("				<p style='text-align:left; line-height:22px; font-family:'돋움','dotum';  color:#959595; font-size:13px; font-weight:300;  letter-spacing:-1px;'>	");
		sb.append("					본 메일은 발신전용 메일이며 문의에 대한 회신 처리되지 않습니다. 문의사항은 고객센터를 이용해주세요.<br> ");	
		sb.append("					회원이 아니신 경우나 메일 수신거부 회원이신데도 메일을 받으신다면 <a href='mailto:starup@starmon.co.kr' style='text-decoration:none; color:#333; '>starup@starmon.co.kr</a> 으로 연락해 주세요. ");
		sb.append("				</p>	");
		sb.append("			</section>	");
		sb.append("		</div>	");
		sb.append("			 ");	
		sb.append("	</body>	 ");	
		sb.append("	</html>  ");
		
		logger.debug("authKey=="+authKey);
		
        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("스타업 이메일 인증");
            sendMail.setText(sb.toString());
            sendMail.setFrom(propertiesService.getString("email.address"), "스타업");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
        	logger.debug("MailSendService sendAuthMail Exception : "+e);
        } catch (UnsupportedEncodingException e) {
        	logger.debug("MailSendService sendAuthMail Exception : "+e);
        }

        return authKey;
    }
    
    //인증비림번호메일 보내기
    public String sendAuthMailPW(String email, String pw) {
    	//6자리 난수 인증번호 생성
    	StringBuffer sb = new StringBuffer();
    	
    	sb.append("	<!DOCTYPE html>		");
    	sb.append("	<html lang='ko'> 	");
    	sb.append("	<head>				");
    	sb.append("	    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>	");
    	sb.append("	    <meta name='viewport' content='width=device-width,initial-scale=1.0' />	");
    	sb.append("	    <meta http-equiv='X-UA-Compatible' content='IE=edge'>	");
    	sb.append("	    <meta name='format-detection' content='telephone=no, address=no, email=no' />	");
    	sb.append("	    <title>Starup</title>	");
    	sb.append("	</head>	");
    	sb.append("	<body style='margin:0;padding:0;'>	");
    	sb.append("		<div id='mailing_wrap' style='width:770px; margin:0px auto; border:solid 20px #f2f2f2; background-color:#f2f2f2; box-sizing:border-box;'> ");
    	sb.append("			<header style='height:80px; background-color: #fff; overflow:hidden; border-bottom: 1px solid #3a3a3c;'>	");
    	sb.append("				<h1 style='margin:0; padding:0;'><a href='#!' style='margin:0; padding:0;'><img src='mailing_logo.png' alt='' style='float:left; vertical-align:middle; line-height:80px; margin:28px 30px;'></a></h1> ");
    	sb.append("				<h2 style='float:right; padding:0; margin:0; margin-right:30px; line-height:80px; color: #3a3a3c; font-size:24px; font-weight:400;'>임시비밀번호 안내메일</h2> ");
    	sb.append("			</header>	");
    	sb.append("			<section class='mailing_container' style=' box-sizing:border-box; padding:45px 40px 70px 40px; text-align:left; background-color:#fff; '>	");
    	sb.append("				<p style='line-height:24px; margin:0;padding:0;font-size:14px;'>안녕하세요. </p>	");
    	sb.append("				<p style='line-height:24px; margin:0;padding:0;font-size:14px;'>임시비밀번호를 알려드리겠습니다.</p>	");
    	sb.append("				<div style='margin-top:20px;'>	");
    	sb.append("					<table cellspacing=0; cellpadding=0; style='width:100%;'>	");
    	sb.append("					<tbody style='display:grid; border-top:solid 2px #888888;'>	");
    	sb.append("						<tr style='display:block; width:100%; height:50px; line-height:50px; border-bottom:solid 1px #dcdcdc; font-size:14px;'>	");
    	sb.append("							<th style='width:160px;padding:0 0 0 20px; box-sizing:border-box;'>임시비밀번호</th>	");
    	sb.append("							<td>"+pw+"</td>	");
    	sb.append("						</tr>	");
    	sb.append("					</tbody>	");
    	sb.append("				</table>		");
    	sb.append("				</div>			");
    	sb.append("			</section>			");
    	sb.append("			<section class='mailing_container2' style='padding:30px 0 30px 43px; margin:30px 0 0 0; background-color:#fff;'>	");
    	sb.append("				<p style='text-align:left; line-height:22px; font-family:'돋움','dotum';  color:#959595; font-size:13px; font-weight:300;  letter-spacing:-1px;'>	");
    	sb.append("					본 메일은 발신전용 메일이며 문의에 대한 회신 처리되지 않습니다. 문의사항은 고객센터를 이용해주세요.<br> ");	
    	sb.append("					회원이 아니신 경우나 메일 수신거부 회원이신데도 메일을 받으신다면 <a href='mailto:crazy830727@naver.com' style='text-decoration:none; color:#333; '>crazy830727@naver.com</a> 으로 연락해 주세요. ");
    	sb.append("				</p>	");
    	sb.append("			</section>	");
    	sb.append("		</div>	");
    	sb.append("			 ");	
    	sb.append("	</body>	 ");	
    	sb.append("	</html>  ");
    	
    	logger.debug("pw=="+pw);
    	
    	//인증메일 보내기
    	try {
    		MailUtils sendMail = new MailUtils(mailSender);
    		sendMail.setSubject("지엠지파트너스 임시비밀번호");
    		sendMail.setText(sb.toString());
    		sendMail.setFrom(propertiesService.getString("email.address"), "관리자");
    		sendMail.setTo(email);
    		sendMail.send();
    	} catch (MessagingException e) {
    		logger.debug("MailSendService sendAuthMailPW Exception : "+e);
    	} catch (UnsupportedEncodingException e) {
    		logger.debug("MailSendService sendAuthMailPW Exception : "+e);
    	}
    	
    	return pw;
    }
    
}