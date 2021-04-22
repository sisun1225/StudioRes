package yoon.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ConvertUtil {
	public static int convertInt(String param) {
		return Integer.parseInt(param);
	}
	public static double convertDouble(String param) {
		return Double.parseDouble(param);
	}
	public static Date convertDate(String param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		try {
			date = new Date(sdf.parse(param).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	
	public static Date convertDate2(String param) {
		return Date.valueOf(param);
	}
}
