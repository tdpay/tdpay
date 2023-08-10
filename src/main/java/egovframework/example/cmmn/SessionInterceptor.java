package egovframework.example.cmmn;

import java.io.IOException;
import java.net.InetAddress;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.user.service.UserService;


public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	 /**
	  * 세션만료 시 로그인페이지로 이동한다.
	  * @return true(요청한 controller 호출), false(로그인페이지로 이동)
	  * @description 로그인, 로그인처리 페이지를 제외한 나머지 페이지에서 controller 호출 전에 세션유무를 파악하여 페이지 이동시킨다. 
	  * @exception Exception
	  */
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SessionInterceptor.class);
	
	/** EgovSampleService */
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException, SQLException, ModelAndViewDefiningException { 
	  
		String requestURI = request.getRequestURI();
	    LOGGER.info("request.getRequestURI() : "+request.getRequestURI());
	    LOGGER.info("request.getRequestURL() : "+request.getRequestURL().toString());
	    
	    HttpSession session =  request.getSession (true);
	    
		String ipAddress=request.getRemoteAddr();
		if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
			InetAddress inetAddress=InetAddress.getLocalHost();
			ipAddress=inetAddress.getHostAddress();
		}
		
		session.setAttribute("ipAddress",			ipAddress);
		
	    String menu_type = "W";
	    if(requestURI.indexOf("app") > -1){	
	    	menu_type = "M";
	    }
	    
		if(requestURI.indexOf("/user/login.do") > -1){	
			
			Map<String, String> params = new HashMap<String, String>(); 
			String serverName = request.getServerName();
			LOGGER.info("serverName=="+serverName);
			params.put("domain", serverName);
			
			Map<String, String> ipCheck = userService.ipCheck(params);
			
			LOGGER.info("ipCheck=="+ipCheck);
			
			if(ipCheck != null) {

				if(ipCheck.get("ip").indexOf(ipAddress) < -1) {
					ModelAndView modelAndView = new ModelAndView("redirect:/common/ip_check.jsp");
					throw new ModelAndViewDefiningException(modelAndView);
				}
			}
			
			return true;
			
		}else if(requestURI.indexOf("/loginAction.do") > -1 || requestURI.indexOf("/loginActionNo.do") > -1 || requestURI.indexOf("/idSearch.do") > -1 || requestURI.indexOf("/auth_send.do") > -1 || requestURI.indexOf("/auth_check.do") > -1 || requestURI.indexOf("/pwSearch.do") > -1 
				|| requestURI.indexOf("/pwSearch2.do") > -1 || requestURI.indexOf("/pwSearch3.do") > -1 || requestURI.indexOf("/sesionRemove.do") > -1 || requestURI.indexOf("/logout.do") > -1 || requestURI.indexOf("forward.do") > -1 || requestURI.indexOf("/payment_api_result.do") > -1
				|| requestURI.indexOf("/pay.do") > -1 || requestURI.indexOf("/cardSugido.do") > -1 || requestURI.indexOf("/kspay_wh_rcv.do") > -1 || requestURI.indexOf("/kspay_wh_result.do") > -1 || requestURI.indexOf("/result.do") > -1 || requestURI.indexOf("/ip_check.do") > -1 
				|| requestURI.indexOf("/payment_api_card.do") > -1 || requestURI.indexOf("/test.do") > -1) {
			return true;
		}else {
			
			String session_loginType = (String) session.getAttribute("login_id");
			
			if (session_loginType == null) {
				if(menu_type.equals("W")) {
					
					ModelAndView modelAndView = new ModelAndView("redirect:/user/login.do");
					throw new ModelAndViewDefiningException(modelAndView);
					
				}else {
					
					ModelAndView modelAndView = new ModelAndView("redirect:/app/user/login.do");
					throw new ModelAndViewDefiningException(modelAndView);
				}
			}else {
				
				
				Map<String, String> params = new HashMap<String, String>(); 
				params.put("login_id", (String)session.getAttribute("login_id"));
				params.put("ip", ipAddress);
				params.put("url", request.getRequestURL().toString());
				params.put("loginTime", (String)session.getAttribute("loginTime"));
				
				userService.logAdd(params);
				
				int cnt = noticeService.selectNotice07RoleCnt();
				session.setAttribute("CANCEL_NUM",			cnt);
				
			}
		}
		
		return true;
	}		 
		 
	  /**
     * 세션에 메뉴권한(SessionVO)이 있는지 여부로 메뉴권한 여부를 체크한다. 계정정보(SessionVO)가 없다면, 로그인 페이지로 이동한다.
     */
//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//    	
//        String requestURI = request.getRequestURI();
//        LOGGER.info("request.getRequestURI2() : "+request.getRequestURI());
//        HttpSession session =  request.getSession (true);
//        
//        try {
//        	
//        	if(requestURI.indexOf("/user/login.do") > -1 || requestURI.indexOf("/loginAction.do") > -1 || requestURI.indexOf("/logout.do") > -1 || requestURI.indexOf("forward.do") > -1){
//        	}else {
//        		
//    			List<Map<String, String>> role = (List<Map<String, String>>) session.getAttribute("ROLE");
//    			
//    			if(role != null) {
//    				boolean authCheck = false;
//    				
//            		for(int i=0; i<=role.size(); i++) {
//            			
//            			if(role.get(i).get("menu_url").indexOf(requestURI) > -1) {
//            				authCheck = true;
//            				break;
//            			}
//            		}
//            		if(!authCheck) {
//            			ModelAndView mav = new ModelAndView("redirect:/forward.do");
//            			mav.addObject("msgCode", "권한이 없습니다.");
//            			mav.addObject("returnUrl", "/user/login.do");
//            			throw new ModelAndViewDefiningException(mav);
//            		}
//    			}
//    		}
//            
//        } catch (Exception e) { // 그 외 예외사항은 index로 이동
//        	
//            ModelAndView mav = new ModelAndView("redirect:/forward.do");
//            mav.addObject("msgCode", "권한이 없습니다.");
//            mav.addObject("returnUrl", "/user/login.do");
//            throw new ModelAndViewDefiningException(mav);
//        }
//        
//    }

}