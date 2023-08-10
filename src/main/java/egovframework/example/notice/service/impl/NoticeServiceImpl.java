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
package egovframework.example.notice.service.impl;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.FileUtil;
import egovframework.example.notice.service.NoticeDefaultVO;
import egovframework.example.notice.service.NoticeService;
import egovframework.example.notice.service.NoticeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="noticeMapper")
	private NoticeMapper noticeDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Resource(name = "fileUtil")
	protected FileUtil fileUtil;
	
	@Override
	public List<NoticeVO> selectNotice01List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice01List2(searchNoticeVO);
	}
	@Override
	public List<NoticeVO> selectNotice01List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice01List(searchNoticeVO);
	}
	@Override
	public List<NoticeVO> selectFileListInfo(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectFileListInfo(searchNoticeVO);
	}
	@Override
	public int selectNotice01ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice01ListToCnt(searchNoticeVO);
	}
	@Override
	public int selectNotice01ListToCnt2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice01ListToCnt2(searchNoticeVO);
	}
	@Override
	public NoticeVO selectNotice01Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice01Info(searchNoticeVO);
	}
	@Override
	public void notice01Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice01Add(vo);
		
		String fileDir = "no1";
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		LOGGER.debug("CollectionUtils.isEmpty(dbList)=="+CollectionUtils.isEmpty(dbList));
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap);
		}
		
	}
	@Override
	public void notice01Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice01Mod(vo);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		String[] arrChks = vo.getArrChk().split(",");
		
		if(arrChks.length > 0 && !arrChks[0].equals("")) {
			
			ArrayList<String> dbList = new ArrayList<String>();
			
			for(String arrChk : arrChks){
				dbList.add(arrChk);
			}
			
			hmap.put("dbList", dbList);	
			List<Map<String, String>> listFile = noticeDAO.selectFileList(hmap);
			if(!listFile.isEmpty()){
				for(Map<String, String> listFiles : listFile){
					File f = new File(String.valueOf(listFiles.get("path")));
					if(f.exists()) f.delete();
				}
				noticeDAO.fileDel(hmap);
			}	
		}
		
		String fileDir = "no1";
		String file_no = vo.getNo();
		String file_check = "F";
		
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		LOGGER.debug("CollectionUtils.isEmpty(dbList)=="+CollectionUtils.isEmpty(dbList));
		if(CollectionUtils.isEmpty(dbList) == false) {
			
			Map<String, Object> hmap2 = new HashMap<String, Object>();
			hmap2.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap2);
			
		}
	}
	@Override
	public void notice01CntMod(NoticeVO vo) throws IOException, SQLException {
		noticeDAO.notice01CntMod(vo);
	}
	@Override
	public int notice01Del(NoticeVO vo) throws IOException, SQLException {
		
		int i = 0;
		i = noticeDAO.notice01Del(vo);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> dbList = new ArrayList<String>();
		
		hmap.put("file_no", vo.getNo());	
		hmap.put("file_type", "no1");	
		
		List<Map<String, String>> listFile = noticeDAO.selectFileList2(hmap);
		if(!listFile.isEmpty()){
			String no = "";
			for(Map<String, String> listFiles : listFile){
				File f = new File(String.valueOf(listFiles.get("path")));
				if(f.exists()) f.delete();
				
				no = String.valueOf(listFiles.get("no"));
			}
			dbList.add(no);
			hmap.put("dbList", dbList);	
			noticeDAO.fileDel(hmap);
		}		
		
		return i;
	}
	
	@Override
	public List<NoticeVO> selectNotice02List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice02List2(searchNoticeVO);
	}
	@Override
	public List<NoticeVO> selectNotice02List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice02List(searchNoticeVO);
	}
	@Override
	public int selectNotice02ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice02ListToCnt(searchNoticeVO);
	}
	@Override
	public int selectNotice02ListToCnt2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice02ListToCnt2(searchNoticeVO);
	}
	@Override
	public NoticeVO selectNotice02Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice02Info(searchNoticeVO);
	}
	
	@Override
	public void notice02Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice02Add(vo);
		
		String fileDir = "no2";
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap);
		}
		
	}
	@Override
	public void notice02Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice02Mod(vo);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		String[] arrChks = vo.getArrChk().split(",");
		
		if(arrChks.length > 0) {
			
			ArrayList<String> dbList = new ArrayList<String>();
			
			for(String arrChk : arrChks){
				dbList.add(arrChk);
			}
			
			hmap.put("dbList", dbList);	
			List<Map<String, String>> listFile = noticeDAO.selectFileList(hmap);
			if(!listFile.isEmpty()){
				for(Map<String, String> listFiles : listFile){
					File f = new File(String.valueOf(listFiles.get("path")));
					if(f.exists()) f.delete();
				}
				noticeDAO.fileDel(hmap);
			}	
		}
		
		String fileDir = "no2";
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		if(CollectionUtils.isEmpty(dbList) == false) {
			
			Map<String, Object> hmap2 = new HashMap<String, Object>();
			hmap2.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap2);
			
		}		
	}
	@Override
	public void notice02CntMod(NoticeVO vo) throws IOException, SQLException {
		noticeDAO.notice02CntMod(vo);
	}
	@Override
	public int notice02Del(NoticeVO vo) throws IOException, SQLException {
		
		int i = 0;
		i = noticeDAO.notice02Del(vo);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> dbList = new ArrayList<String>();
		
		hmap.put("file_no", vo.getNo());	
		hmap.put("file_type", "no2");	
		
		List<Map<String, String>> listFile = noticeDAO.selectFileList2(hmap);
		if(!listFile.isEmpty()){
			String no = "";
			for(Map<String, String> listFiles : listFile){
				File f = new File(String.valueOf(listFiles.get("path")));
				if(f.exists()) f.delete();
				
				no = String.valueOf(listFiles.get("no"));
			}
			dbList.add(no);
			hmap.put("dbList", dbList);	
			noticeDAO.fileDel(hmap);
		}		
		
		return i;
	}
	
	@Override
	public List<NoticeVO> selectNotice03List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice03List(searchNoticeVO);
	}
	@Override
	public int selectNotice03ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice03ListToCnt(searchNoticeVO);
	}
	@Override
	public NoticeVO selectNotice03Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice03Info(searchNoticeVO);
	}
	
	@Override
	public void notice03Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice03Add(vo);
		
		String fileDir = "no3";
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap);
		}		
	}
	@Override
	public void notice03Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice03Mod(vo);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		String[] arrChks = vo.getArrChk().split(",");
		
		if(arrChks.length > 0) {
			
			ArrayList<String> dbList = new ArrayList<String>();
			
			for(String arrChk : arrChks){
				dbList.add(arrChk);
			}
			
			hmap.put("dbList", dbList);	
			List<Map<String, String>> listFile = noticeDAO.selectFileList(hmap);
			if(!listFile.isEmpty()){
				for(Map<String, String> listFiles : listFile){
					File f = new File(String.valueOf(listFiles.get("path")));
					if(f.exists()) f.delete();
				}
				noticeDAO.fileDel(hmap);
			}	
		}
		
		String fileDir = "no3";
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		if(CollectionUtils.isEmpty(dbList) == false) {
			
			Map<String, Object> hmap2 = new HashMap<String, Object>();
			hmap2.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap2);
			
		}		
	}
	@Override
	public void notice03CntMod(NoticeVO vo) throws IOException, SQLException {
		noticeDAO.notice03CntMod(vo);
	}
	@Override
	public int notice03Del(NoticeVO vo) throws IOException, SQLException {
		
		int i = 0;
		i = noticeDAO.notice03Del(vo);
		Map<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> dbList = new ArrayList<String>();
		
		hmap.put("file_no", vo.getNo());	
		hmap.put("file_type", "no3");	
		
		List<Map<String, String>> listFile = noticeDAO.selectFileList2(hmap);
		if(!listFile.isEmpty()){
			String no = "";
			for(Map<String, String> listFiles : listFile){
				File f = new File(String.valueOf(listFiles.get("path")));
				if(f.exists()) f.delete();
				
				no = String.valueOf(listFiles.get("no"));
			}
			dbList.add(no);
			hmap.put("dbList", dbList);	
			noticeDAO.fileDel(hmap);
		}	
		
		return i;
	}
	
	@Override
	public List<NoticeVO> selectNotice04List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice04List(searchNoticeVO);
	}
	@Override
	public int selectNotice04ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice04ListToCnt(searchNoticeVO);
	}
	@Override
	public NoticeVO selectNotice04Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice04Info(searchNoticeVO);
	}
	@Override
	public void notice04Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		
		if(vo.getRole_id().equals("1001")){
			noticeDAO.notice04Mod(vo);
		}else {
			noticeDAO.notice04Mod2(vo);
			Map<String, Object> hmap = new HashMap<String, Object>();
			
			String[] arrChks = vo.getArrChk().split(",");
			
			if(arrChks.length > 0) {
				
				ArrayList<String> dbList = new ArrayList<String>();
				
				for(String arrChk : arrChks){
					dbList.add(arrChk);
				}
				
				hmap.put("dbList", dbList);	
				List<Map<String, String>> listFile = noticeDAO.selectFileList(hmap);
				if(!listFile.isEmpty()){
					for(Map<String, String> listFiles : listFile){
						File f = new File(String.valueOf(listFiles.get("path")));
						if(f.exists()) f.delete();
					}
					noticeDAO.fileDel(hmap);
				}	
			}
			
			String fileDir = vo.getFile_type();
			String file_no = vo.getNo();
			String file_check = "F";
			ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
			
			if(CollectionUtils.isEmpty(dbList) == false) {
				
				Map<String, Object> hmap2 = new HashMap<String, Object>();
				hmap2.put("dbList", dbList);	
				
				noticeDAO.fileAdd(hmap2);
				
			}		
		}
	}
	@Override
	public void notice04CntMod(NoticeVO vo) throws IOException, SQLException {
		noticeDAO.notice04CntMod(vo);
	}
	@Override
	public int notice04Del(NoticeVO vo) throws IOException, SQLException {
		
		int i = 0;
		noticeDAO.notice04Del(vo);
		Map<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> dbList = new ArrayList<String>();
		
		hmap.put("file_no", vo.getNo());	
		hmap.put("file_type", vo.getFile_type());	
		
		
		List<Map<String, String>> listFile = noticeDAO.selectFileList2(hmap);
		if(!listFile.isEmpty()){
			String no = "";
			for(Map<String, String> listFiles : listFile){
				File f = new File(String.valueOf(listFiles.get("path")));
				if(f.exists()) f.delete();
				
				no = String.valueOf(listFiles.get("no"));
			}
			dbList.add(no);
			hmap.put("dbList", dbList);	
			noticeDAO.fileDel(hmap);
		}	
		
		return i;
	}	
	
	@Override
	public void notice04Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice04Add(vo);
		
		String fileDir = vo.getFile_type();
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap);
		}		
	}
	
	@Override
	public List<NoticeVO> selectNotice07List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice07List(searchNoticeVO);
	}
	@Override
	public int selectNotice07ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice07ListToCnt(searchNoticeVO);
	}
	@Override
	public NoticeVO selectNotice07Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException {
		return noticeDAO.selectNotice07Info(searchNoticeVO);
	}
	@Override
	public void notice07Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		
		if(vo.getRole_id().equals("1001")){
			noticeDAO.notice07Mod(vo);
		}else {
			noticeDAO.notice07Mod2(vo);
			Map<String, Object> hmap = new HashMap<String, Object>();
			
			String[] arrChks = vo.getArrChk().split(",");
			
			if(arrChks.length > 0) {
				
				ArrayList<String> dbList = new ArrayList<String>();
				
				for(String arrChk : arrChks){
					dbList.add(arrChk);
				}
				
				hmap.put("dbList", dbList);	
				List<Map<String, String>> listFile = noticeDAO.selectFileList(hmap);
				if(!listFile.isEmpty()){
					for(Map<String, String> listFiles : listFile){
						File f = new File(String.valueOf(listFiles.get("path")));
						if(f.exists()) f.delete();
					}
					noticeDAO.fileDel(hmap);
				}	
			}
			
			String fileDir = vo.getFile_type();
			String file_no = vo.getNo();
			String file_check = "F";
			ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
			
			if(CollectionUtils.isEmpty(dbList) == false) {
				
				Map<String, Object> hmap2 = new HashMap<String, Object>();
				hmap2.put("dbList", dbList);	
				
				noticeDAO.fileAdd(hmap2);
				
			}		
		}
	}
	@Override
	public void notice07CntMod(NoticeVO vo) throws IOException, SQLException {
		noticeDAO.notice07CntMod(vo);
	}
	@Override
	public void notice07RoleCkMod(NoticeVO vo) throws IOException, SQLException {
		noticeDAO.notice07RoleCkMod(vo);
	}
	@Override
	public int notice07Del(NoticeVO vo) throws IOException, SQLException {
		
		int i = 0;
		noticeDAO.notice07Del(vo);
		Map<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> dbList = new ArrayList<String>();
		
		hmap.put("file_no", vo.getNo());	
		hmap.put("file_type", vo.getFile_type());	
		
		
		List<Map<String, String>> listFile = noticeDAO.selectFileList2(hmap);
		if(!listFile.isEmpty()){
			String no = "";
			for(Map<String, String> listFiles : listFile){
				File f = new File(String.valueOf(listFiles.get("path")));
				if(f.exists()) f.delete();
				
				no = String.valueOf(listFiles.get("no"));
			}
			dbList.add(no);
			hmap.put("dbList", dbList);	
			noticeDAO.fileDel(hmap);
		}	
		
		return i;
	}	
	
	@Override
	public void notice07Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		noticeDAO.notice07Add(vo);
		
		String fileDir = vo.getFile_type();
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMulti(multiRequest, fileDir, file_no, file_check);
		
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAdd(hmap);
		}		
	}	
	
	@Override
	public int selectNotice07RoleCnt() throws IOException, SQLException {
		return noticeDAO.selectNotice07RoleCnt();
	}
	
}
