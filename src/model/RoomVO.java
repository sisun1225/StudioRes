package model;

public class RoomVO {
	
	private int room_no;
	private String host_id;
	private String studio_name;
	private int studio_no;
	private String room_name;
	private int  room_capacity;
	private String  room_intro;
	private int  room_price;
	private String  room_picture;
	
	public RoomVO(){}

	public RoomVO(int room_no, String host_id, String studio_name, int studio_no, String room_name, int room_capacity,
			String room_intro, int room_price, String room_picture) {
		super();
		this.room_no = room_no;
		this.host_id = host_id;
		this.studio_name = studio_name;
		this.studio_no = studio_no;
		this.room_name = room_name;
		this.room_capacity = room_capacity;
		this.room_intro = room_intro;
		this.room_price = room_price;
		this.room_picture = room_picture;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
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

	public int getStudio_no() {
		return studio_no;
	}

	public void setStudio_no(int studio_no) {
		this.studio_no = studio_no;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getRoom_capacity() {
		return room_capacity;
	}

	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}

	public String getRoom_intro() {
		return room_intro;
	}

	public void setRoom_intro(String room_intro) {
		this.room_intro = room_intro;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getRoom_picture() {
		return room_picture;
	}

	public void setRoom_picture(String room_picture) {
		this.room_picture = room_picture;
	}

	@Override
	public String toString() {
		return "RoomVO [room_no=" + room_no + ", host_id=" + host_id + ", studio_name=" + studio_name + ", studio_no="
				+ studio_no + ", room_name=" + room_name + ", room_capacity=" + room_capacity + ", room_intro="
				+ room_intro + ", room_price=" + room_price + ", room_picture=" + room_picture + "]";
	}
	
}
