package model;

public class HostVO {
	private int host_no;
	private String host_id;
	private String host_pw;
	private String host_name;
	private String host_phone;
	private String host_email;
	public HostVO() {
		super();
	}
	public HostVO(int host_no, String host_id, String host_pw, String host_name, String host_phone, String host_email) {
		super();
		this.host_no = host_no;
		this.host_id = host_id;
		this.host_pw = host_pw;
		this.host_name = host_name;
		this.host_phone = host_phone;
		this.host_email = host_email;
	}
	public int getHost_no() {
		return host_no;
	}
	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getHost_pw() {
		return host_pw;
	}
	public void setHost_pw(String host_pw) {
		this.host_pw = host_pw;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getHost_phone() {
		return host_phone;
	}
	public void setHost_phone(String host_phone) {
		this.host_phone = host_phone;
	}
	public String getHost_email() {
		return host_email;
	}
	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HostVO [host_no=").append(host_no).append(", host_id=").append(host_id).append(", host_pw=")
				.append(host_pw).append(", host_name=").append(host_name).append(", host_phone=").append(host_phone)
				.append(", host_email=").append(host_email).append("]");
		return builder.toString();
	}
	
}
