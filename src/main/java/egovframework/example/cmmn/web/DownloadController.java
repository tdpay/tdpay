package egovframework.example.cmmn.web;


import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.cmmn.service.CommonService;

@Controller
public class DownloadController implements ApplicationContextAware {

    private WebApplicationContext context;
 
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@RequestMapping("fileDownload.do")
	public ModelAndView download(HttpServletRequest request, @RequestParam Map<String, String> params) throws IOException, SQLException {

		Map<String, String> fileInfo = commonService.fileInfo(params);
		
		File downloadFile = getFile2(fileInfo.get("path"));
//		File downloadFile = getFile(realPath);
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
	}

//    private File getFile(String realPath) {
//        String path = context.getServletContext().getRealPath(realPath);
//        return new File(path);
//    } 
    private File getFile2(String realPath) {
    	String path = realPath;
    	return new File(path);
    } 

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.context = (WebApplicationContext) applicationContext;
    }
}
