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
package egovframework.example.setup.service.impl;

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

import egovframework.example.cmmn.FileUtil;
import egovframework.example.setup.service.SetupDefaultVO;
import egovframework.example.setup.service.SetupService;
import egovframework.example.setup.service.SetupVO;
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

@Service("setupService")
public class SetupServiceImpl extends EgovAbstractServiceImpl implements SetupService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SetupServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="setupMapper")
	private SetupMapper setupDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Resource(name = "fileUtil")
	protected FileUtil fileUtil;
	
	@Override
	public List<SetupVO> setupBankList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupBankList(searchSetupVO);
	}
	
	@Override
	public int setupBankAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		
		int cnt = setupDAO.setupBankCnt(searchSetupVO);
		
		if(cnt == 0) {
			setupDAO.setupBankAdd(searchSetupVO);
		}
		
		return cnt;
	}
	
	@Override
	public void setupBankDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		setupDAO.setupBankDel(searchSetupVO);
	}
	
	@Override
	public List<SetupVO> setupAuthList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupAuthList(searchSetupVO);
	}
	
	@Override
	public void setupPhoneEmailDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		
		if(searchSetupVO.getAuth_type() != null && searchSetupVO.getAuth_type().equals("phone_num")) {
			setupDAO.setupPhoneNumDel(searchSetupVO);
		}else if(searchSetupVO.getAuth_type() != null && searchSetupVO.getAuth_type().equals("email")) {
			setupDAO.setupEmailDel(searchSetupVO);
		}
	}
	
	@Override
	public void setupPhoneNumAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		setupDAO.setupPhoneNumAdd(searchSetupVO);
	}
	@Override
	public void setupEmailAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		setupDAO.setupEmailAdd(searchSetupVO);
	}
	
	@Override
	public void setupAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		setupDAO.setupStoreAdd(searchSetupVO);
		setupDAO.setupRoleAdd(searchSetupVO);
		
	    List<String> menuList = new ArrayList<String>();
	    
	    String[] arrMenuId = searchSetupVO.getArr_check_id().split(",");
	    for(int i=0; i<arrMenuId.length; i++) {
	    	menuList.add(arrMenuId[i]); //in 조건에 넣을 정보
	    }
	    
	    Map<String, Object> param = new HashMap<String, Object>();
	    param.put("menu_list", menuList); //map에 list를 넣는다.
	    param.put("store_id", searchSetupVO.getStore_id());
		setupDAO.setupMenuAdd(param);
	}
	
	
	@Override
	public void setupMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		setupDAO.setupStoreMod(searchSetupVO);
		setupDAO.setupMenuDel(searchSetupVO);

	    List<String> menuList = new ArrayList<String>();
	    
	    String[] arrMenuId = searchSetupVO.getArr_check_id().split(",");
	    for(int i=0; i<arrMenuId.length; i++) {
	    	menuList.add(arrMenuId[i]); //in 조건에 넣을 정보
	    }
	    
	    Map<String, Object> param = new HashMap<String, Object>();
	    param.put("menu_list", menuList); //map에 list를 넣는다.
	    param.put("store_id", searchSetupVO.getStore_id());
		setupDAO.setupMenuAdd(param);
	}
	
	@Override
	public void setupDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		setupDAO.setupPhoneNumDel2(searchSetupVO);
		setupDAO.setupEmailDel2(searchSetupVO);
		setupDAO.setupRoleDel(searchSetupVO);
		setupDAO.setupStoreDel(searchSetupVO);
		setupDAO.setupMenuDel(searchSetupVO);
	}
	
	
	@Override
	public List<SetupVO> setupMenuList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupMenuList(searchSetupVO);
	}
	@Override
	public List<SetupVO> setupMenuList2(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupMenuList2(searchSetupVO);
	}
	@Override
	public List<SetupVO> setupMenuListCheck(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupMenuListCheck(searchSetupVO);
	}
	
	@Override
	public SetupVO setupStoreInfo(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupStoreInfo(searchSetupVO);
	}
	
	@Override
	public SetupVO setupMenuInfo(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupMenuInfo(searchSetupVO);
	}
	
	@Override
	public List<SetupVO> selectSetupList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupList(searchSetupVO);
	}
	@Override
	public int selectSetupListCnt(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupListCnt(searchSetupVO);
	}
	
	@Override
	public List<SetupVO> selectSetupIpList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupIpList(searchSetupVO);
	}
	@Override
	public int selectSetupIpListCnt(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupIpListCnt(searchSetupVO);
	}
	@Override
	public int setupIpAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupIpAdd(searchSetupVO);
	}
	@Override
	public int setupIpMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupIpMod(searchSetupVO);
	}
	@Override
	public int setupIpDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupIpDel(searchSetupVO);
	}
	
	@Override
	public List<SetupVO> selectSetupCardFeeList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupCardFeeList(searchSetupVO);
	}
	@Override
	public int setupCardFeeAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupCardFeeAdd(searchSetupVO);
	}	
	@Override
	public int setupCardFeeMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupCardFeeMod(searchSetupVO);
	}
	@Override
	public int setupCardFeeDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupCardFeeDel(searchSetupVO);
	}	
	
	@Override
	public List<SetupVO> selectSetupPgFeeList(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupPgFeeList(searchSetupVO);
	}	
	@Override
	public int setupPgFeeAdd(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupPgFeeAdd(searchSetupVO);
	}
	@Override
	public int setupPgFeeMod(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupPgFeeMod(searchSetupVO);
	}	
	@Override
	public int setupPgFeeDel(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.setupPgFeeDel(searchSetupVO);
	}	
	@Override
	public SetupVO selectSetupPgFeeListDetail(SetupDefaultVO searchSetupVO) throws IOException, SQLException{
		return setupDAO.selectSetupPgFeeListDetail(searchSetupVO);
	}		
	
	@Override
	public List<Map<String, String>> selectMenu() throws IOException, SQLException {
		return setupDAO.selectMenu();
	}
	@Override
	public List<Map<String, String>> selectSubMenu() throws IOException, SQLException {
		return setupDAO.selectSubMenu();
	}
	@Override
	public List<Map<String, String>> selectMenuMapping() throws IOException, SQLException {
		return setupDAO.selectMenuMapping();
	}
	
}
