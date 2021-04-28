package test;

import java.util.List;
import model.StudioResDAO;
import model.StudioVO;
import view.TestView;

public class Test_ptw {

	public static void main(String[] args) {
		String subOption="";      //지하철
		String locOption="대";   //지역
		
		//String[] detailOption = {};   
		String[] detailOption = new String[7];
		detailOption[0] = "1"; //마이크
		detailOption[1] = "2"; //주차장
		detailOption[2] = "3"; //샤워장
		detailOption[3] = "4"; //정수기
		detailOption[4] = "5"; //에어컨
		detailOption[5] = "6"; //난방기
		detailOption[6] = "7"; //내부화장실


		method1(subOption, locOption, detailOption);
		
	}

	private static void method1(String subOption, String locOption, String[] detailOption) {
		StudioResDAO dao = new StudioResDAO();
		List<StudioVO> studioList = dao.selectStudioByOption(subOption, locOption, detailOption);
		TestView.view(studioList);
	}
	
}
