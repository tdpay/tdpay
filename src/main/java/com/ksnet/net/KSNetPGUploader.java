package com.ksnet.net;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

import com.ksnet.net.KSPGFtsUpDownLib;

public class KSNetPGUploader {

	/**
	 * @param args
	 * @throws FileNotFoundException
	 */
	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub

		String host = "210.181.28.137"; /* KSNET 서버 IP */
		int port = 9800; /* KSNET Port */
		//String fpath = "C:\\dev\\eGovFrameDev-3.9.0-64bit\\workspace\\GmgPayMent\\src\\main\\resources\\upload\\pgsbm\\upload\\20210505.csv"; /* 업로드할 파일 경로 */
		String fpath = "/home/apache-tomcat-9.0.40/webapps/GmgPayMent/WEB-INF/classes/upload/pgsbm/upload";/* 업로드할 파일 경로 */
		String busDf = "PGSBM"; /* 파일구분(업무구분) */
		String shopId = "2001106695"; /* 상점아이디 */
		String date = "20210506"; /* 업로드 일자 - 항상 오늘!! */
		String enc_shop_pass = "d6IvblpH5tw+GLIlaMIA1A=="; /* 인증key값 */
		
		//String fpath2 = "C:\\dev\\eGovFrameDev-3.9.0-64bit\\workspace\\GmgPayMent\\src\\main\\resources\\upload\\pgtms\\upload\\20210505.csv"; /* 업로드할 파일 경로 */
		String fpath2 = "/home/apache-tomcat-9.0.40/webapps/GmgPayMent/WEB-INF/classes/upload/pgsbm/upload";/* 업로드할 파일 경로 */
		String busDf2 = "PGTMS"; /* 파일구분(업무구분) */
		
//		String host = args[0]; /* KSNET 서버 IP */
//		int port = Integer.parseInt(args[1]); /* KSNET Port */
//		String fpath = args[2]; /* 업로드할 파일 경로 */
//		String busDf = args[3]; /* 파일구분(업무구분) */
//		String shopId = args[4]; /* 상점아이디 */
//		String date = args[5]; /* 업로드 일자 - 항상 오늘!! */
//		String enc_shop_pass = args[6]; /* 인증key값 */

		/* 로그 레벨 설정 */
		/* 로그 레빌 값 범위는 1~4 이며 숫자가 클수록 더 많은 로그를 보여줍니다. */
		// KSPGFtsUpDownLib.setLogLevel(1);

		/* 로그 파일 설정 */
		/* 설정하지 않으면 표준출력으로 로그를 보여주며 null로 설정하면 로그를 남기지 않습니다. */
		// PrintStream out = new PrintStream(new FileOutputStream(new File("log.txt")));
		// KSPGFtsUpDownLib.setLogPrintStream(out);

		int rtn = KSPGFtsUpDownLib.fileUpload(host, port, fpath, busDf, shopId, enc_shop_pass, date);
//		int rtn = KSPGFtsUpDownLib.fileUpload(host, port, fpath2, busDf2, shopId, enc_shop_pass, date);

		/* 로그 파일은 가능한 명시적으로 닫아주시기 바랍니다. */
		// out.close();

		// 리턴 값이 음수면 오류 그 외에는 정상
		if (rtn < 0) {
			System.out.println("FILE UPLOAD FAIL!!");
			System.exit(-1);
		} else {
			System.out.println("FILE UPLOAD SUCCESS!!");
			System.exit(0);

		}

	}

}
