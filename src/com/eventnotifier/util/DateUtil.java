package com.eventnotifier.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class DateUtil {

	private static final Logger LOGGER = Logger.getLogger(DateUtil.class);

	public static Date convertToSQLDate(String str) {
		Date date = null;
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date dt;
		try {
			dt = formatter.parse(str);
			date = new java.sql.Date(dt.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static String getFormattedDate(Date date) {
		try {

			SimpleDateFormat sd = new SimpleDateFormat(
					"EEE, d MMM yyyy HH:mm:ss zzz");
			return sd.format(date);
		} catch (Exception e) {
			LOGGER.error(e);
			return "N.A.";
		}
	}

	public static String getOnlyDate(Date date) {
		try {
			SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
			return sd.format(date);
		} catch (Exception e) {
			LOGGER.error(e);
			return "N.A.";
		}
	}
}
