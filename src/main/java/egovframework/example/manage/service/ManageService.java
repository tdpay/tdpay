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
package egovframework.example.manage.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface ManageService {

	List<ManageVO> selectManageList(ManageDefaultVO searchManageVO) throws IOException, SQLException;
	int selectManageListToCnt(ManageDefaultVO searchManageVO) throws IOException, SQLException;
	List<ManageVO> selectManageListExcel(ManageDefaultVO searchManageVO) throws IOException, SQLException;
	
	List<ManageVO> selectManageList2(ManageDefaultVO searchManageVO) throws IOException, SQLException;
	int selectManageListToCnt2(ManageDefaultVO searchManageVO) throws IOException, SQLException;
	List<ManageVO> selectManageList2Excel(ManageDefaultVO searchManageVO) throws IOException, SQLException;
	
	ManageVO selectManageInfo(ManageVO vo) throws IOException, SQLException;
	
	void manageAdd(ManageVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	
	void manageMod(ManageVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	
	int manageDel(ManageVO vo) throws IOException, SQLException;
	
	void manageFileDel(String fileChks) throws IOException, SQLException;
	

	
}
