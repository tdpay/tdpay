package egovframework.example.cmmn;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DataUtil {
	
	public static String getPrevDate(String yyyymm) {
	    int year  = Integer.parseInt(yyyymm.substring(0, 4));
	    int month = Integer.parseInt(yyyymm.substring(4, 6));
	    int date  = 1;
	    
	    Calendar cal = Calendar.getInstance();
	    cal.set(year, month - 1, date);
	    
	    cal.add(Calendar.MONTH, -1);    // 한달 전
	    
	    SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	    String r = dateFormatter.format(cal.getTime());
	    
	    return r;
	}
	
	public static String getPrevDate2(String yyyymm) {
		int year  = Integer.parseInt(yyyymm.substring(0, 4));
		int month = Integer.parseInt(yyyymm.substring(4, 6));
		int date  = 1;
		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, date);
		
		cal.add(Calendar.MONTH, -1);    // 한달 전
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("MM");
		String r = dateFormatter.format(cal.getTime());
		
		return r;
	}
	
	public static String getNextDate(String yyyymm) {
		int year  = Integer.parseInt(yyyymm.substring(0, 4));
		int month = Integer.parseInt(yyyymm.substring(5, 7));
		int date  = 1;
		 
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, date);
		
		cal.add(Calendar.MONTH, +1);    // 한달 후
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		String r = dateFormatter.format(cal.getTime());
		
		return r;
	}
	
	public static String getNextDate2(String yyyymm) {
		int year  = Integer.parseInt(yyyymm.substring(0, 4));
		int month = Integer.parseInt(yyyymm.substring(4, 6));
		
		int date  = 1;
		 
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, date);
		
		cal.add(Calendar.MONTH, +1);    // 한달 후
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("MM");
		String r = dateFormatter.format(cal.getTime());
		
		return r;
	}
	
	public static String getMaxDate(String yyyymm) {
		
		Calendar cal = Calendar.getInstance();

	    int year  = Integer.parseInt(yyyymm.substring(0, 4));
	    int month = Integer.parseInt(yyyymm.substring(4, 6));
	    int date  = 1;

	    cal.set(year, month - 1, date);

		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM");
		
		String lastDay = dateFormatter.format(cal.getTime()) + "-" + String.valueOf(cal.getActualMaximum(Calendar.DATE));
		
		return lastDay;
	}
	
	public static String getMaxDate2(String yyyymm) {
		
		Calendar cal = Calendar.getInstance();

	    int year  = Integer.parseInt(yyyymm.substring(0, 4));
	    int month = Integer.parseInt(yyyymm.substring(4, 6));
	    int date  = 1;

	    cal.set(year, month - 1, date);

		SimpleDateFormat dateFormatter = new SimpleDateFormat("MM");
		
		String lastDay = dateFormatter.format(cal.getTime());
		
		return lastDay;
	}
	
	public static String getDayComparison(String yyyy, String mmm, String dd){
		
		String result = "0";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		 
		Calendar aDate = Calendar.getInstance(); // 비교하고자 하는 임의의 날짜
		aDate.set(Integer.parseInt(yyyy), Integer.parseInt(mmm)-1, Integer.parseInt(dd));
		 
		Calendar bDate = Calendar.getInstance(); // 이것이 시스템의 날짜
		 
		// 여기에 시,분,초를 0으로 세팅해야 before, after를 제대로 비교함
		aDate.set( Calendar.HOUR_OF_DAY, 0 );
		aDate.set( Calendar.MINUTE, 0 );
		aDate.set( Calendar.SECOND, 0 );
		aDate.set( Calendar.MILLISECOND, 0 );
		 
		bDate.set( Calendar.HOUR_OF_DAY, 0 );
		bDate.set( Calendar.MINUTE, 0 );
		bDate.set( Calendar.SECOND, 0 );
		bDate.set( Calendar.MILLISECOND, 0 );
		 
		if (aDate.after(bDate)){
			result = "2";
//			System.out.println("시스템 날짜보다 뒤일 경우 aDate = " + dateForm.format(aDate.getTime())); 
		}else if (aDate.before(bDate)){ // aDate가 bDate보다 작을 경우 출력
			result = "1";
//			System.out.println("시스템 날짜보다 앞일 경우 aDate = " + dateForm.format(aDate.getTime()));
		}else{ // aDate = bDate인 경우
			result = "0";
//			System.out.println("같은 날이구만");
		}
		return result;

	}
	public static void main(String[] args){
		
//		System.out.println(getDayComparison("2021","03","04"));
//		String RequestDate   = new SimpleDateFormat("yyyyMMddhh").format(new java.util.Date());
//		System.out.println(RequestDate.substring(8));  
		//System.out.println(getMaxDate("2016-04-01"));
		//System.out.println(getPrevDate("2016-03-01"));
//		System.out.println(getPrevDate("202104"));
//		System.out.println(getMaxDate("202103"));
//		System.out.println(getNextDate2("202103"));
		
//		System.out.println(getMaxDate("2016-01"));
//		System.out.println(getMaxDate("201614"));
	}
	
}
