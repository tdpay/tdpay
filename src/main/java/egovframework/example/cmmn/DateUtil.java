package egovframework.example.cmmn;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.text.ParseException;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;

import com.ibm.icu.util.ChineseCalendar;

public class DateUtil {
	
	/*
	 * ksc추가
	 * 오늘날짜 원하는포멧으로 가져오기
	 * ex)
	 * yyyyMMdd
	 * yyyy-MM-dd
	 * yy년 MM월 dd일 E요일
	 * yyyy-MM-dd HH:mm:ss.SSS
	 * yyyy-MM-dd hh:mm:ss a
	 * 
	 */
	public static String getToday(String _format) {
		SimpleDateFormat f = null;
		if(_format == null){
			f = new SimpleDateFormat("yyyy-MM-dd");
		}else{
			f = new SimpleDateFormat(_format);
		}
		Date today = new Date();
		
	    return f.format(today);
	}	
	/*
	 * ksc추가
	 * 월계산후 원하는포멧으로 가져오기
	 */	
	public static String getCalcMonthly(String yyyymmdd,int plusMinusMonth,String _format) {
		int year  = Integer.parseInt(yyyymmdd.substring(0, 4));
		int month = Integer.parseInt(yyyymmdd.substring(5, 7));
		int day = Integer.parseInt(yyyymmdd.substring(8, 10));
		 
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day);
		
		cal.add(Calendar.MONTH, plusMinusMonth); 
		
		SimpleDateFormat f = null;
		if(_format == null){
			f = new SimpleDateFormat("yyyy-MM-dd");
		}else{
			f = new SimpleDateFormat(_format);
		}
		
		return f.format(cal.getTime());
	}
	
	public static String getDate()
    {
    	Calendar calendar = Calendar.getInstance();
    	
    	StringBuffer times = new StringBuffer();
        times.append(Integer.toString(calendar.get(Calendar.YEAR)));
		if((calendar.get(Calendar.MONTH)+1)<10)
        { 
            times.append("0"); 
        }
		times.append(Integer.toString(calendar.get(Calendar.MONTH)+1));
		if((calendar.get(Calendar.DATE))<10) 
        {
            times.append("0");	
        } 
		times.append(Integer.toString(calendar.get(Calendar.DATE)));
    	
    	return times.toString();
    }
	
	public static String getDate2()
	{
		Calendar calendar = Calendar.getInstance();
		
		StringBuffer times = new StringBuffer();
		times.append(Integer.toString(calendar.get(Calendar.YEAR))+"-");
		if((calendar.get(Calendar.MONTH)+1)<10)
		{ 
			times.append("0"); 
		}
		times.append(Integer.toString(calendar.get(Calendar.MONTH)+1)+"-");
		if((calendar.get(Calendar.DATE))<10) 
		{
	//		times.append("0");	
		} 
		times.append("01");
		
		return times.toString();
	}
    
	public static String getTime()
    {
    	Calendar calendar = Calendar.getInstance();
    	
    	StringBuffer times = new StringBuffer();

    	times.append("[");
    	if((calendar.get(Calendar.HOUR_OF_DAY))<10) 
        { 
            times.append("0"); 
        } 
 		times.append(Integer.toString(calendar.get(Calendar.HOUR_OF_DAY)));
 		times.append(":");
 		if((calendar.get(Calendar.MINUTE))<10) 
        { 
            times.append("0"); 
        }
 		times.append(Integer.toString(calendar.get(Calendar.MINUTE)));
 		times.append(":");
 		if((calendar.get(Calendar.SECOND))<10) 
        { 
            times.append("0"); 
        }
 		times.append(Integer.toString(calendar.get(Calendar.SECOND)));
 		times.append("]");
 		
 		return times.toString();
    }
	
	 /**
     * 년월일시분초
     * @param date
     */
	public static String getcurrentTimeMillis(){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		String strDT = dayTime.format(new Date(time)); 
		return strDT;
	}
	
	
	 /**
     * 공휴일 여부
     * @param date
	 * @throws ParseException 
     */
    public static boolean isHoliday(long date) throws ParseException {
        return isLegalHoliday(date) || isWeekend(date) || isAlternative(date);
    }
    
    /**
     * 음력날짜 구하기
     * @param date
     * @return
     */
    public static String getLunarDate(long date) {
        ChineseCalendar cc = new ChineseCalendar(new java.util.Date(date));
        String m = String.valueOf(cc.get(ChineseCalendar.MONTH) + 1);
        m = StringUtils.leftPad(m, 2, "0");
        String d = String.valueOf(cc.get(ChineseCalendar.DAY_OF_MONTH));
        d = StringUtils.leftPad(d, 2, "0");
        
        return m + d;
    }
    
    /**
     * 법정휴일
     * @param date
     * @return
     */
    public static boolean isLegalHoliday(long date) {
        boolean result = false;
        
        String[] solar = {"0101", "0301", "0505", "0606", "0815", "1225"};
        String[] lunar = {"0101", "0102", "0408", "0814", "0815", "0816", "1231"};
        
        List<String> solarList = Arrays.asList(solar);
        List<String> lunarList = Arrays.asList(lunar);
        
        String solarDate = DateFormatUtils.format(date, "MMdd");
        ChineseCalendar cc = new ChineseCalendar(new java.util.Date(date));
        
//        String y = String.valueOf(cc.get(ChineseCalendar.EXTENDED_YEAR) - 2637);
        String m = String.valueOf(cc.get(ChineseCalendar.MONTH) + 1);
        m = StringUtils.leftPad(m, 2, "0");
        String d = String.valueOf(cc.get(ChineseCalendar.DAY_OF_MONTH));
        d = StringUtils.leftPad(d, 2, "0");
        
        String lunarDate = m + d;
        
        if (solarList.indexOf(solarDate) >= 0) {
            return true;
        }
        if (lunarList.indexOf(lunarDate) >= 0) {
            return true;
        }
        
        return result;
    }
    
    /**
     * 주말 (토,일)
     * @param date
     * @return
     */
    public static boolean isWeekend(long date) {
        boolean result = false;
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(date);
        
        //SUNDAY:1 SATURDAY:7
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY) {
            result = true;
        }
        
        return result;
    }
    
    /**
     * 대체공휴일
     * @param date
     * @return
     * @throws ParseException 
     */
    public static boolean isAlternative(long date) throws ParseException {
        boolean result = false;
        
        //설날 연휴와 추석 연휴가 다른 공휴일과 겹치는 경우 그 날 다음의 첫 번째 비공휴일을 공휴일로 하고, 어린이날이 토요일 또는 다른 공휴일과 겹치는 경우 그 날 다음의 첫 번째 비공휴일을 공휴일로 함
        //1. 어린이날
        String year = DateFormatUtils.format(date, "yyyy");
        java.util.Date d = null;
        d = DateUtils.parseDate(year+"0505", "yyyyMMdd");
        if (isWeekend(d.getTime()) == true) {
            d = DateUtils.addDays(d, 1);
        }
        if (isWeekend(d.getTime()) == true) {
            d = DateUtils.addDays(d, 1);
        }
        if (DateUtils.isSameDay(new java.util.Date(date), d) == true) {
            result = true;
        }
        
        //2. 설 
        String lunarDate = getLunarDate(date);
        Calendar calendar = Calendar.getInstance();
        d = new java.util.Date(date);
        if (StringUtils.equals(lunarDate, "0103")) {
            
            d = DateUtils.addDays(d, -1);
            calendar.setTime(d);
            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                return true;
            }
            
            d = DateUtils.addDays(d, -1);
            calendar.setTime(d);
            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                return true;
            }
            
            d = DateUtils.addDays(d, -1);
            calendar.setTime(d);
            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                return true;
            }
        }
        
        //3. 추석
        d = new java.util.Date(date);
        if (StringUtils.equals(lunarDate, "0817")) {
            d = DateUtils.addDays(d, -1);
            calendar.setTime(d);
            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                return true;
            }
            
            d = DateUtils.addDays(d, -1);
            calendar.setTime(d);
            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                return true;
            }
            
            d = DateUtils.addDays(d, -1);
            calendar.setTime(d);
            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                return true;
            }
        }
        
        return result;
    }	
//	public static void main(String args[]) throws Exception{
		
//		//System.out.println(getDate2());
		//System.out.println(getcurrentTimeMillis());
		
//        long date = DateUtils.parseDate("20180507", "yyyyMMdd").getTime();
//        long date = DateUtils.parseDate("20171006", "yyyyMMdd").getTime();
//        long date = DateUtils.parseDate("20160210", "yyyyMMdd").getTime();
//        boolean isLegalHoliday = isLegalHoliday(date);	//법정휴일
//        boolean isWeekend = isWeekend(date);			//주말 (토,일)
//        boolean isAlternative = isAlternative(date);	//대체공휴일
//        boolean isHoliday = isHoliday(date);			//공휴일 여부
//        
//        System.out.println(isLegalHoliday);
//        System.out.println(isWeekend);
//        System.out.println(isAlternative);
//        System.out.println(isHoliday);
		
//		int cnt = 2/7;
//		int cnt2 = 13/7;
//		int cnt3 = 14/7;
//		
//		int cnt_ = 2%7;
//		int cnt2_ = 13%7;
//		int cnt3_ = 14%7;
		
//		System.out.println("cnt="+cnt);
//		System.out.println("cnt2="+cnt2);
//		System.out.println("cnt3="+cnt3);
//		
//		System.out.println("cnt_="+cnt_);
//		System.out.println("cnt2_="+cnt2_);
//		System.out.println("cnt3_="+cnt3_);
//		
//		System.out.println(DateUtil.getToday(null));
		
//	}
}
