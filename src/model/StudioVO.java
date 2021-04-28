package model;

public class StudioVO {
	private int studio_no;
	private int host_no;
	private String host_id;
	private String studio_desc;
	private String studio_name;
	private String studio_picture;
	private String studio_days;
	private String studio_notice;
	private String studio_subway;
	private String studio_address;
	private String studio_check;
	private String studio_have_mic;
	private String studio_have_park;
	private String studio_have_shower;
	private String studio_have_water;
	private String studio_have_aircon;
	private String studio_have_heater;
	private String studio_have_toilet;
	private int room_count;

	public StudioVO() {
		super();
	}
	public StudioVO(int studio_no, int host_no, String host_id, String studio_desc, String studio_name,
			String studio_picture, String studio_days, String studio_notice, String studio_subway,
			String studio_address, String studio_check, String studio_have_mic, String studio_have_park,
			String studio_have_shower, String studio_have_water, String studio_have_aircon, String studio_have_heater,
			String studio_have_toilet, int room_count) {
		super();
		this.studio_no = studio_no;
		this.host_no = host_no;
		this.host_id = host_id;
		this.studio_desc = studio_desc;
		this.studio_name = studio_name;
		this.studio_picture = studio_picture;
		this.studio_days = studio_days;
		this.studio_notice = studio_notice;
		this.studio_subway = studio_subway;
		this.studio_address = studio_address;
		this.studio_check = studio_check;
		this.studio_have_mic = studio_have_mic;
		this.studio_have_park = studio_have_park;
		this.studio_have_shower = studio_have_shower;
		this.studio_have_water = studio_have_water;
		this.studio_have_aircon = studio_have_aircon;
		this.studio_have_heater = studio_have_heater;
		this.studio_have_toilet = studio_have_toilet;
		this.room_count = room_count;
	}
	
	public int getStudio_no() {
		return studio_no;
	}
	public void setStudio_no(int studio_no) {
		this.studio_no = studio_no;
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
	public String getStudio_desc() {
		return studio_desc;
	}
	public void setStudio_desc(String studio_desc) {
		this.studio_desc = studio_desc;
	}
	public String getStudio_name() {
		return studio_name;
	}
	public void setStudio_name(String studio_name) {
		this.studio_name = studio_name;
	}
	public String getStudio_picture() {
		return studio_picture;
	}
	public void setStudio_picture(String studio_picture) {
		this.studio_picture = studio_picture;
	}
	public String getStudio_days() {
		return studio_days;
	}
	public void setStudio_days(String studio_days) {
		this.studio_days = studio_days;
	}
	public String getStudio_notice() {
		return studio_notice;
	}
	public void setStudio_notice(String studio_notice) {
		this.studio_notice = studio_notice;
	}
	public String getStudio_subway() {
		return studio_subway;
	}
	public void setStudio_subway(String studio_subway) {
		this.studio_subway = studio_subway;
	}
	public String getStudio_address() {
		return studio_address;
	}
	public void setStudio_address(String studio_address) {
		this.studio_address = studio_address;
	}
	public String getStudio_check() {
		return studio_check;
	}
	public void setStudio_check(String studio_check) {
		this.studio_check = studio_check;
	}
	public String getStudio_have_mic() {
		return studio_have_mic;
	}
	public void setStudio_have_mic(String studio_have_mic) {
		this.studio_have_mic = studio_have_mic;
	}
	public String getStudio_have_park() {
		return studio_have_park;
	}
	public void setStudio_have_park(String studio_have_park) {
		this.studio_have_park = studio_have_park;
	}
	public String getStudio_have_shower() {
		return studio_have_shower;
	}
	public void setStudio_have_shower(String studio_have_shower) {
		this.studio_have_shower = studio_have_shower;
	}
	public String getStudio_have_water() {
		return studio_have_water;
	}
	public void setStudio_have_water(String studio_have_water) {
		this.studio_have_water = studio_have_water;
	}
	public String getStudio_have_aircon() {
		return studio_have_aircon;
	}
	public void setStudio_have_aircon(String studio_have_aircon) {
		this.studio_have_aircon = studio_have_aircon;
	}
	public String getStudio_have_heater() {
		return studio_have_heater;
	}
	public void setStudio_have_heater(String studio_have_heater) {
		this.studio_have_heater = studio_have_heater;
	}
	public String getStudio_have_toilet() {
		return studio_have_toilet;
	}
	public void setStudio_have_toilet(String studio_have_toilet) {
		this.studio_have_toilet = studio_have_toilet;
	}
	public int getRoom_count() {
		return room_count;
	}
	public void setRoom_count(int room_count) {
		this.room_count = room_count;
	}
	
	@Override
	public String toString() {
		return "StudioVO [studio_no=" + studio_no + ", host_no=" + host_no + ", host_id=" + host_id + ", studio_desc="
				+ studio_desc + ", studio_name=" + studio_name + ", studio_picture=" + studio_picture + ", studio_days="
				+ studio_days + ", studio_notice=" + studio_notice + ", studio_subway=" + studio_subway
				+ ", studio_address=" + studio_address + ", studio_check=" + studio_check + ", studio_have_mic="
				+ studio_have_mic + ", studio_have_park=" + studio_have_park + ", studio_have_shower="
				+ studio_have_shower + ", studio_have_water=" + studio_have_water + ", studio_have_aircon="
				+ studio_have_aircon + ", studio_have_heater=" + studio_have_heater + ", studio_have_toilet="
				+ studio_have_toilet + ", room_count=" + room_count + "]";
	}
	
}
