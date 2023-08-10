package egovframework.example.cmmn;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class CreateFile {

	static Logger logger = LoggerFactory.getLogger(CreateFile.class);
	/**
	 * * csv 파일을 생성하는 메서드 * @param filePath 파일 경로 * @param title 파일 제목 * @param
	 * content 내용 * @return
	 */
	public static void createCsvFile(String filePath, String content) {
		BufferedWriter bw = null;
		FileWriter fw = null;
		try {
			fw = new FileWriter(filePath, false);
			bw = new BufferedWriter(fw);

			bw.write(content);
			bw.newLine();
			bw.flush();
		} catch (IOException ie) {
			logger.debug("CreateFile IOException:"+ie);
		} finally {
            try {
                if (bw != null)
                    bw.close();
                
                if (fw != null)
                    fw.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
	}
	

}
