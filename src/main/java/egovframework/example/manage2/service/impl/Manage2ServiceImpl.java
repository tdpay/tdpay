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
package egovframework.example.manage2.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.FileUtil;
import egovframework.example.manage2.service.Manage2DefaultVO;
import egovframework.example.manage2.service.Manage2Service;
import egovframework.example.manage2.service.Manage2VO;
import egovframework.example.notice.service.impl.NoticeMapper;
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

@Service("manage2Service")
public class Manage2ServiceImpl extends EgovAbstractServiceImpl implements Manage2Service {

	private static final Logger LOGGER = LoggerFactory.getLogger(Manage2ServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="manage2Mapper") 
	private Manage2Mapper manage2DAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Resource(name="noticeMapper")
	private NoticeMapper noticeDAO;
	
	@Resource(name = "fileUtil")
	protected FileUtil fileUtil;

	@Override
	public List<Manage2VO> selectManage2List(Manage2DefaultVO searchManage2VO) throws IOException, SQLException {
		return manage2DAO.selectManage2List(searchManage2VO);
	}

	@Override
	public int selectManage2ListToCnt(Manage2DefaultVO searchManage2VO) throws IOException, SQLException {
		return manage2DAO.selectManage2ListToCnt(searchManage2VO);
	}
	
	@Override
	public Manage2VO selectManage2Info(Manage2VO vo) throws IOException, SQLException {
		return manage2DAO.selectManage2Info(vo);
	}
	
	@Override
	public void manage2Add(Manage2VO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		// 대리점정보 등록
		manage2DAO.manage2Add(vo);
		manage2DAO.manage2RoleAdd(vo);
		
		// 대리점 수수료 등록
		manage2DAO.manageCommissionActiveMod(vo);
		manage2DAO.manageCommissionAdd(vo);
		
		String fileDir = vo.getRole_id();
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMultis(multiRequest, fileDir, file_no, file_check);
		
		LOGGER.debug("CollectionUtils.isEmpty(dbList)=="+CollectionUtils.isEmpty(dbList));
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAddMulti(hmap);
		}
	}

	@Override
	public void manage2Mod(Manage2VO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException {
		// 대리점정보 수정
		manage2DAO.manage2Mod(vo);
		
		// 대리점 수수료 등록
		manage2DAO.manageCommissionActiveMod(vo);
		manage2DAO.manageCommissionAdd(vo);
		
		String fileDir = vo.getRole_id();
		String file_no = vo.getNo();
		String file_check = "F";
		ArrayList<Map> dbList = fileUtil.parseFileMultis(multiRequest, fileDir, file_no, file_check);
		
		LOGGER.debug("CollectionUtils.isEmpty(dbList)=="+CollectionUtils.isEmpty(dbList));
		if(CollectionUtils.isEmpty(dbList) == false) {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("dbList", dbList);	
			
			noticeDAO.fileAddMulti(hmap);
		}
	}

	@Override
	public int manage2Del(Manage2VO vo) throws IOException, SQLException {
		int i = 0;
		i = manage2DAO.manage2PhoneDel(vo);
		i = manage2DAO.manage2EmailDel(vo);
		i = manage2DAO.manage2InquiryDel(vo);
		i = manage2DAO.manage2RoleDel(vo);
		i = manage2DAO.manage2Del(vo);
		return i;
	}
	
	@Override
	public List<Manage2VO> selectManage2ListExcel(Manage2DefaultVO searchManage2VO) throws IOException, SQLException {
		return manage2DAO.selectManage2ListExcel(searchManage2VO);
	}
}
