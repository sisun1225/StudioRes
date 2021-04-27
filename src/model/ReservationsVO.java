package model;

import java.sql.Date;

public class ReservationsVO {

	private int resv_no;
	private int guest_no;
	private int room_no;
	private Date resv_date;
	private int resv_time;
	private String resv_check;
	private String guest_id;
	private String host_id;
	private String studio_name;
	private String room_name;
	private int studio_no;
	
	public ReservationsVO(){}

	public ReservationsVO(int resv_no, int guest_no, int room_no, Date resv_date, int resv_time, String resv_check,
			String guest_id, String host_id, String studio_name, String room_name, int studio_no) {
		super();
		this.resv_no = resv_no;
		this.guest_no = guest_no;
		this.room_no = room_no;
		this.resv_date = resv_date;
		this.resv_time = resv_time;
		this.resv_check = resv_check;
		this.guest_id = guest_id;
		this.host_id = host_id;
		this.studio_name = studio_name;
		this.room_name = room_name;
		this.studio_no = studio_no;
	}

	public int getResv_no() {
		return resv_no;
	}

	public void setResv_no(int resv_no) {
		this.resv_no = resv_no;
	}

	public int getGuest_no() {
		return guest_no;
	}

	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
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

	public String getGuest_id() {
		return guest_id;
	}

	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public String getStudio_name() {
		return studio_name;
	}


	public void setStudio_name(String studio_name) {
		this.studio_name = studio_name;
	}


	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getStudio_no() {
		return studio_no;
	}

	public void setStudio_no(int studio_no) {
		this.studio_no = studio_no;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReservationsVO [resv_no=").append(resv_no).append(", guest_no=").append(guest_no)
				.append(", room_no=").append(room_no).append(", resv_date=").append(resv_date).append(", resv_time=")
				.append(resv_time).append(", resv_check=").append(resv_check).append(", guest_id=").append(guest_id)
				.append(", host_id=").append(host_id).append(", studio_name=").append(studio_name)
				.append(", room_name=").append(room_name).append(", studio_no=").append(studio_no).append("]");
		return builder.toString();
	}

}
