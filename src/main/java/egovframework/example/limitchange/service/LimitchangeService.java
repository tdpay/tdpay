package egovframework.example.limitchange.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface LimitchangeService {

	
	List<LimitchangeVO> selectLimitchangeList(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	void limitchangeAdd(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	void limitchangeDel(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	LimitchangeVO limitchangeReply(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;
	void limitchangeMod(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException;	
}
