package egovframework.example.sales.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
public interface SalesService {
	
	SalesVO selectCreditcardK(SalesDefaultVO searchSalesVO) throws IOException, SQLException;
	SalesVO selectTerminal(SalesDefaultVO searchSalesVO) throws IOException, SQLException;
}
