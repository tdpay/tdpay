package egovframework.example.sales.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.sales.service.SalesDefaultVO;
import egovframework.example.sales.service.SalesService;
import egovframework.example.sales.service.SalesVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

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
@Service("salesService")
public class SalesServiceImpl extends EgovAbstractServiceImpl implements SalesService {
	private static final Logger LOGGER = LoggerFactory.getLogger(SalesServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
    @Resource(name="salesMapper")
	private SalesMapper salesDAO;

	@Override
	public SalesVO selectCreditcardK(SalesDefaultVO searchSalesVO) throws IOException, SQLException {
		// TODO Auto-generated method stub
		return salesDAO.selectCreditcardK(searchSalesVO);
	}
	
	@Override
	public SalesVO selectTerminal(SalesDefaultVO searchSalesVO) throws IOException, SQLException {
		// TODO Auto-generated method stub
		return salesDAO.selectTerminal(searchSalesVO);
	}
}
