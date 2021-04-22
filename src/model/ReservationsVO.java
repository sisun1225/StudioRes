package model;

import java.sql.Date;

public class ReservationsVO {

	private int resv_no;
	private int guset_no;
	private int room_no;
	private Date resv_date;
	private int resv_time;
	private String resv_check;
	
	public ReservationsVO(){}
	
	public ReservationsVO(int resv_no, int guset_no, int room_no, Date resv_date, int resv_time, String resv_check) {
		super();
		this.resv_no = resv_no;
		this.guset_no = guset_no;
		this.room_no = room_no;
		this.resv_date = resv_date;
		this.resv_time = resv_time;
		this.resv_check = resv_check;
	}

	public int getResv_no() {
		return resv_no;
	}

	public void setResv_no(int resv_no) {
		this.resv_no = resv_no;
	}

	public int getGuset_no() {
		return guset_no;
	}

	public void setGuset_no(int guset_no) {
		this.guset_no = guset_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public Date getResv_date() {
		return resv_date;
	}

	public void setResv_date(Date resv_date) {
		this.resv_date = resv_date;
	}

	public int getResv_time() {
		return resv_time;
	}

	public void setResv_time(int resv_time) {
		this.resv_time = resv_time;
	}

	public String getResv_check() {
		return resv_check;
	}

	public void setResv_check(String resv_check) {
		this.resv_check = resv_check;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReservationsVO [resv_no=").append(resv_no).append(", guset_no=").append(guset_no)
				.append(", room_no=").append(room_no).append(", resv_date=").append(resv_date).append(", resv_time=")
				.append(resv_time).append(", resv_check=").append(resv_check).append("]");
		return builder.toString();
	}
	
	
	
	
	
}
