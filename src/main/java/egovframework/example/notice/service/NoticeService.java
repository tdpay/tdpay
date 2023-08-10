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
package egovframework.example.notice.service;

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
public interface NoticeService {

	List<NoticeVO> selectNotice01List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectNotice01List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectFileListInfo(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice01ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice01ListToCnt2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice01Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice01Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice01Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice01CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice01Del(NoticeVO vo) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice02List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectNotice02List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice02ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice02ListToCnt2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice02Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice02Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice02Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice02CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice02Del(NoticeVO vo) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice03List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice03ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice03Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice03Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice03Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice03CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice03Del(NoticeVO vo) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice04List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice04ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice04Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice04Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice04CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice04Del(NoticeVO vo) throws IOException, SQLException;
	void notice04Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice07List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice07ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice07Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice07Mod(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	void notice07CntMod(NoticeVO vo) throws IOException, SQLException;
	void notice07RoleCkMod(NoticeVO vo) throws IOException, SQLException;
	int notice07Del(NoticeVO vo) throws IOException, SQLException;
	void notice07Add(NoticeVO vo, MultipartHttpServletRequest multiRequest) throws IOException, SQLException;
	
	int selectNotice07RoleCnt() throws IOException, SQLException;
}
