package egovframework.example.limitchange.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import egovframework.example.limitchange.service.LimitchangeDefaultVO;
import egovframework.example.limitchange.service.LimitchangeVO;
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

@Mapper("limitchangeMapper")
public interface LimitchangeMapper {

	List<LimitchangeVO> selectLimitchangeList(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	void limitchangeAdd(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	void limitchangeDel(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	LimitchangeVO selectLimitchangeReply(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	void limitchangeMod(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
}
