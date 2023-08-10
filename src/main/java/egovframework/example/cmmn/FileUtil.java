package egovframework.example.cmmn;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import egovframework.example.notice.service.impl.NoticeServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;

@Component
public class FileUtil {
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
//	public static String getUuid() { 
//		return UUID.randomUUID().toString().replaceAll("-", ""); 
//	}
	
	public ArrayList<Map> parseFileMultis(MultipartHttpServletRequest multiRequest, String fileDir, String file_no, String file_check) throws IOException{
		
		ArrayList<Map> dbList = new ArrayList<Map>();
		Iterator<String> iterator = multiRequest.getFileNames();
		
		while(iterator.hasNext()){
			List<MultipartFile> list = multiRequest.getFiles(iterator.next());
			for (MultipartFile mf : list){
					
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				LOGGER.debug("originFileName=="+originFileName);
				if(!"".equals(originFileName)) {
					
					long fileSize = mf.getSize(); // 파일 사이즈
					
					String ext = originFileName.substring(originFileName.lastIndexOf('.')); // 확장자 String saveFileName = getUuid() + ext;
					
					String saveFileName = Long.toString(System.nanoTime()) + ext;
					
					String path = propertiesService.getString("Globals.fileStorePath") + File.separator + fileDir + File.separator + saveFileName;
					String server_path = propertiesService.getString("Globals.fileStorePath2") + "/" + fileDir + "/" + saveFileName;
					
					File f = new File(path);
					mf.transferTo(f);
					
					Map<String, Object> hmap = new HashMap<String, Object>();
					hmap.put("file_no", file_no);
					hmap.put("file_type", fileDir);
					hmap.put("file_check", file_check);
					hmap.put("file_nm", originFileName);
					hmap.put("server_file_nm", saveFileName);
					hmap.put("size", String.valueOf(fileSize));
					hmap.put("path", path);
					hmap.put("server_url", server_path);
					dbList.add(hmap);
				}
					
			}
		}
		
		return dbList;
	}
	
	public ArrayList<Map> parseFileMulti(MultipartHttpServletRequest multiRequest, String fileDir, String file_no, String file_check) throws IOException{
		
		ArrayList<Map> dbList = new ArrayList<Map>();
		
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		CommonsMultipartFile mf = (CommonsMultipartFile) files.get("file");
				
		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		LOGGER.debug("originFileName=="+originFileName);
		
		if(!"".equals(originFileName)) {
			
			long fileSize = mf.getSize(); // 파일 사이즈
			
			String ext = originFileName.substring(originFileName.lastIndexOf('.')); // 확장자 String saveFileName = getUuid() + ext;
			
			String saveFileName = Long.toString(System.nanoTime()) + ext;
			
			String path = propertiesService.getString("Globals.fileStorePath") + File.separator + fileDir + File.separator + saveFileName;
			String server_path = propertiesService.getString("Globals.fileStorePath2") + "/" + fileDir + "/" + saveFileName;
			
			File f = new File(path);
			mf.transferTo(f);
			
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("file_no", file_no);
			hmap.put("file_type", fileDir);
			hmap.put("file_check", file_check);
			hmap.put("file_nm", originFileName);
			hmap.put("server_file_nm", saveFileName);
			hmap.put("size", String.valueOf(fileSize));
			hmap.put("path", path);
			hmap.put("server_url", server_path);
			dbList.add(hmap);
		}
				
		
		return dbList;
	}
	
	public Map<String, String> parseFileInfoEdit(Map<String, String> params, MultipartHttpServletRequest multiRequest) throws IOException{
		
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("file2");
		
		String ext = cmf.getOriginalFilename().substring(cmf.getOriginalFilename().lastIndexOf('.')); // 확장자 String saveFileName = getUuid() + ext;
		String saveFileName = Long.toString(System.nanoTime()) + ext;
		
		String path = propertiesService.getString("Globals.fileStorePath") + File.separator + params.get("uploadFile") + File.separator +"img"+ File.separator + saveFileName;
		String server_path = propertiesService.getString("Globals.fileStorePath2") + "/" + params.get("uploadFile") + "/img/" + saveFileName;
		
		File f = new File(path);
		
		cmf.transferTo(f);
		
		//첨부파일 end
		params.put("server_path", server_path);
		
		return params;
	}
	
	
}
