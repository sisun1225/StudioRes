package yoon.team.model;

public class GuestVO {
	private int guest_no;
	private String guest_id;
	private String guest_pw;
	private String guest_name;
	private String guest_phone;
	private String guest_email;

	public GuestVO() {
		super();
	}

	public GuestVO(int guest_no, String guest_id, String guest_pw, String guest_name, String guest_phone, String guest_email) {
		super();
		this.guest_no = guest_no;
		this.guest_id = guest_id;
		this.guest_pw = guest_pw;
		this.guest_name = guest_name;
		this.guest_phone = guest_phone;
		this.guest_email = guest_email;
	}

	public int getGuest_no() {
		return guest_no;
	}

	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}

	public String getGuest_id() {
		return guest_id;
	}

	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}

	public String getGuest_pw() {
		return guest_pw;
	}

	public void setGuest_pw(String guest_pw) {
		this.guest_pw = guest_pw;
	}

	public String getGuest_name() {
		return guest_name;
	}

	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}

	public String getGuest_phone() {
		return guest_phone;
	}

	public void setGuest_phone(String guest_phone) {
		this.guest_phone = guest_phone;
	}

	public String getGuest_email() {
		return guest_email;
	}

	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GuestVO [guest_no=").append(guest_no).append(", guest_id=").append(guest_id)
				.append(", guest_pw=").append(guest_pw).append(", guest_name=").append(guest_name)
				.append(", guest_phone=").append(guest_phone).append(", guest_email=").append(guest_email).append("]");
		return builder.toString();
	}

	

}
