package egovframework.example.limitchange.service.impl;

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
import egovframework.example.limitchange.service.LimitchangeDefaultVO;
import egovframework.example.limitchange.service.LimitchangeService;
import egovframework.example.limitchange.service.LimitchangeVO;
import egovframework.example.notice.service.impl.NoticeMapper;
import egovframework.example.notice.service.impl.NoticeServiceImpl;
import egovframework.example.setup.service.SetupDefaultVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("limitchangeService")
public class LimitchangeServiceImpl implements LimitchangeService {

	
	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="limitchangeMapper")
	private LimitchangeMapper limitchangeDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Resource(name = "fileUtil")
	protected FileUtil fileUtil;
	
	
	@Override
	public List<LimitchangeVO> selectLimitchangeList(LimitchangeDefaultVO searchLimitchangeVO)
			throws IOException, SQLException {
		return limitchangeDAO.selectLimitchangeList(searchLimitchangeVO);
	}
	@Override
	public void limitchangeAdd(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException{
		limitchangeDAO.limitchangeAdd(searchLimitchangeVO);
	}
	@Override
	public void limitchangeDel(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException{
		limitchangeDAO.limitchangeDel(searchLimitchangeVO);
	}
	@Override
	public LimitchangeVO limitchangeReply(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException{
		return limitchangeDAO.selectLimitchangeReply(searchLimitchangeVO);
	}
	@Override
	public void limitchangeMod(LimitchangeDefaultVO searchLimitchangeVO) throws IOException, SQLException {
		limitchangeDAO.limitchangeMod(searchLimitchangeVO);
	}
}
