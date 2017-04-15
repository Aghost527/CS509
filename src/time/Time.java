package time;

public class Time {
	 
	private int year;
	private String month;
	private int day;
	private String clock;
	private String timeZone;
	
	private String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	
	public Time(int year, int month, int day, String clock, String timeZone){
		this.year = year;
		this.month = months[month - 1];
		this.day = day;
		this.clock = clock;
		this.timeZone = timeZone;
	}
	
	public Time( int year, String month,int day, String clock,String timeZone){
//		if (!isValidYear(year)) 
//			throw new IllegalArgumentException(year);
//		if (!isValidMonth(month)) 
//			throw new IllegalArgumentException(month);
//		if (!isValidDay(day)) 
//			throw new IllegalArgumentException(day);
//		if (!isValidClock(clock)) 
//			throw new IllegalArgumentException(clock);
//		if (!isValidZone(timeZone)) 
//			throw new IllegalArgumentException(timeZone);
		this.year=year;
		this.month=month;
		this.day=day;
		this.clock=clock;
		this.timeZone=timeZone;
	}
	
	public Time( String year, String month,String day, String clock,String timeZone){
//		if (!isValidYear(year)) 
//			throw new IllegalArgumentException(year);
//		if (!isValidMonth(month)) 
//			throw new IllegalArgumentException(month);
//		if (!isValidDay(day)) 
//			throw new IllegalArgumentException(day);
//		if (!isValidClock(clock)) 
//			throw new IllegalArgumentException(clock);
//		if (!isValidZone(timeZone)) 
//			throw new IllegalArgumentException(timeZone);
		this.year=Integer.parseInt(year);
		this.month=month;
		this.day=Integer.parseInt(day);
		this.clock=clock;
		this.timeZone=timeZone;
	}
	
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Time [year=" + year + ", month=" + month + ", day=" + day + ", clock=" + clock + ", timeZone="
				+ timeZone + "]";
	}

	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getClock() {
		return clock;
	}
	public void setClock(String clock) {
		this.clock = clock;
	}
	public String getTimeZone() {
		return timeZone;
	}
	public void setTimeZone(String timeZone) {
		this.timeZone = timeZone;
	} 
	
	/**
	 * Check if time is valid
	 * 
	 * @param time
	 * @return true if format is right
	 */
	public boolean isValidLongitude (String time) {
		try {
			String[] t=time.split(":");
			if (t.length!=2)return false;
			int hour=Integer.parseInt(t[0]);
			int minute=Integer.parseInt(t[1]);
			if (hour<0|hour>24)return false;
			if (minute<0|minute>60)return false;
		} catch (NullPointerException | NumberFormatException ex) {
			return false;
		}
		return true;
	}
	
}
