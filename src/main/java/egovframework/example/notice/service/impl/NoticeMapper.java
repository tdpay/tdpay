/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import egovframework.example.notice.service.NoticeDefaultVO;
import egovframework.example.notice.service.NoticeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("noticeMapper")
public interface NoticeMapper {

	List<NoticeVO> selectNotice01List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectNotice01List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectFileListInfo(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice01ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice01ListToCnt2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice01Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice01Add(NoticeVO vo) throws IOException, SQLException;
	void notice01Mod(NoticeVO vo) throws IOException, SQLException;
	void notice01CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice01Del(NoticeVO vo) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice02List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectNotice02List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice02ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice02ListToCnt2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice02Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice02Add(NoticeVO vo) throws IOException, SQLException;
	void notice02Mod(NoticeVO vo) throws IOException, SQLException;
	void notice02CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice02Del(NoticeVO vo) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice03List2(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	List<NoticeVO> selectNotice03List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice03ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice03Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice03Add(NoticeVO vo) throws IOException, SQLException;
	void notice03Mod(NoticeVO vo) throws IOException, SQLException;
	void notice03CntMod(NoticeVO vo) throws IOException, SQLException;
	int notice03Del(NoticeVO vo) throws IOException, SQLException;
	
	void fileAdd(Map<String, Object> hmap) throws IOException, SQLException;
	void fileAddMulti(Map<String, Object> hmap) throws IOException, SQLException;
	List<Map<String, String>> selectFileList(Map<String, Object> hmap) throws IOException, SQLException;
	List<Map<String, String>> selectFileList2(Map<String, Object> hmap) throws IOException, SQLException;
	void fileDel(Map<String, Object> hmap) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice04List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice04ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice04Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice04Mod(NoticeVO vo) throws IOException, SQLException;
	void notice04Mod2(NoticeVO vo) throws IOException, SQLException;
	void notice04CntMod(NoticeVO vo) throws IOException, SQLException;
	void notice04Del(NoticeVO vo) throws IOException, SQLException;	
	void notice04Add(NoticeVO vo) throws IOException, SQLException;
	
	List<NoticeVO> selectNotice07List(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	int selectNotice07ListToCnt(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	NoticeVO selectNotice07Info(NoticeDefaultVO searchNoticeVO) throws IOException, SQLException;
	void notice07Mod(NoticeVO vo) throws IOException, SQLException;
	void notice07Mod2(NoticeVO vo) throws IOException, SQLException;
	void notice07CntMod(NoticeVO vo) throws IOException, SQLException;
	void notice07RoleCkMod(NoticeVO vo) throws IOException, SQLException;
	void notice07Del(NoticeVO vo) throws IOException, SQLException;	
	void notice07Add(NoticeVO vo) throws IOException, SQLException;
	
	int selectNotice07RoleCnt() throws IOException, SQLException;
}
