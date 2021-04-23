package view;

import java.util.List;

import model.GuestVO;
import model.HostVO;
import model.ReservationsVO;
import model.RoomVO;
import model.StudioVO;

public class TestView {
	
	public static void view(List<Object> list) {
		System.out.println("list");
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	
	public static void view(HostVO hostVO) {
		System.out.println("hostVO");
		System.out.println(hostVO);
		System.out.println();
	}
	
	public static void view(GuestVO guestVO) {
		System.out.println("guestVO");
		System.out.println(guestVO);
		System.out.println();
	}
	
	public static void view(ReservationsVO resvVo) {
		System.out.println("resvVO");
		System.out.println(resvVo);
		System.out.println();
	}
	
	public static void view(StudioVO studioVO) {
		System.out.println("studioVO");
		System.out.println(studioVO);
		System.out.println();
	}
	
	public static void view(RoomVO roomVO) {
		System.out.println("roomVO");
		System.out.println(roomVO);
		System.out.println();
	}
	
	public static void view(String message) {
		System.out.println("message");
		System.out.println(message);
		System.out.println();
	}

}
