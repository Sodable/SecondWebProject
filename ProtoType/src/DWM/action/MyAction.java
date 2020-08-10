package DWM.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class MyAction {
	
	//지역 좌표 구하는 메서드
	//return : String[] { x좌표, y좌표 }
	public String[] getXY(String locale) throws IOException, ParseException {
		String result;
		String areaTop = locale.split(" ")[0]; // 지역
		String areaMdl = locale.split(" ")[1];
		String areaLeaf = locale.split(" ")[2];
		String code = null;

		String x = null;
		String y = null;

		URL url;
		BufferedReader br;
		URLConnection conn;

		JSONParser parser;
		JSONArray jArr;
		JSONObject jobj;

		// 시 검색
		url = new URL("http://www.kma.go.kr/DFSROOT/POINT/DATA/top.json.txt");
		conn = url.openConnection();
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		result = br.readLine().toString();
		br.close();

		parser = new JSONParser();
		jArr = (JSONArray) parser.parse(result);
		for (int i = 0; i < jArr.size(); i++) {
			jobj = (JSONObject) jArr.get(i);
			if (jobj.get("value").equals(areaTop)) {
				code = (String) jobj.get("code");
				break;
			}
		}

		// 구 검색
		url = new URL("http://www.kma.go.kr/DFSROOT/POINT/DATA/mdl." + code.trim() + ".json.txt");
		conn = url.openConnection();
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		result = br.readLine().toString();
		br.close();

		parser = new JSONParser();
		jArr = (JSONArray) parser.parse(result);

		for (int i = 0; i < jArr.size(); i++) {
			jobj = (JSONObject) jArr.get(i);
			if (jobj.get("value").equals(areaMdl)) {
				code = (String) jobj.get("code");
				break;
			}
		}

		// 동 검색
		url = new URL("http://www.kma.go.kr/DFSROOT/POINT/DATA/leaf." + code + ".json.txt");
		conn = url.openConnection();
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		result = br.readLine().toString();
		br.close();

		parser = new JSONParser();
		jArr = (JSONArray) parser.parse(result);

		if (areaMdl.equals("종로구")) {
			for (int i = 0; i < jArr.size(); i++) {
				jobj = (JSONObject) jArr.get(i);

				String leaf1 = areaLeaf.substring(0, areaLeaf.length() - 3);
				String leaf2 = areaLeaf.substring(areaLeaf.length() - 3, areaLeaf.length() - 2);
				String leaf3 = areaLeaf.substring(areaLeaf.length() - 2, areaLeaf.length());

				Pattern pattern = Pattern.compile(leaf1 + "[1-9.]{0,8}" + leaf2 + "[1-9.]{0,8}" + leaf3);
				Matcher matcher = pattern.matcher((String) jobj.get("value"));
				if (matcher.find()) {
					x = (String) jobj.get("x");
					y = (String) jobj.get("y");
					break;
				}
			}
		} else {
			for (int i = 0; i < jArr.size(); i++) {
				jobj = (JSONObject) jArr.get(i);
				String value = (String) jobj.get("value");
				String newvalue = "";
				for (int j = 0; j < value.length(); j++) {
					char c = value.charAt(j);
					if (!Character.isDigit(c)) {
						newvalue += value.charAt(j);
					} else {
					}
				}
				if (newvalue.equals(areaLeaf)) {
					x = (String) jobj.get("x");
					y = (String) jobj.get("y");
					break;
				}
			}
		}

		return new String[] { x, y };
	}

	//초단기실황 구하는 메서드
	//input : String[] {날짜(2020-08-06), x좌표, y좌표}
	//return : List<String[]> {{날짜(2020-08-06), x좌표, y좌표}, {category, value} , ...}
	public List<String[]> getWeatherNow(String[] input) {
		List<String[]> result = new ArrayList<String[]>();
		result.add(input);
		String nx = input[1];
		String ny = input[2];
		String basedate = input[0].split(" ")[0].replace("-", "");
		String basetime = null;
		if (Integer.parseInt(input[0].split(" ")[1].split(":")[1]) > 40) {
			basetime = input[0].split(" ")[1].substring(0, 2) + "00";
		} else {
			basetime = (Integer.parseInt(input[0].split(" ")[1].substring(0, 2)) - 1) + "00";
		}
		if (basetime.length() == 3) {
			basetime = "0" + basetime;
		}

//		System.out.println("basedate = " + basedate);
//		System.out.println("basetime = " + basetime);

		try {
			// parsing할 url 지정(API 키 포함해서)
			String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst"
					+ "?serviceKey=xPnUPygFqSpiU3B43RGYzd2xxChAkcHm3XKup4kwgI%2FuwXwj69qI1CUDhvyYf6nkYdw4foGYKEnJxdQto2uAgQ%3D%3D"
					+ "&numOfRows=8&pageNo=1" + "&base_date=" + basedate + "&base_time=" + basetime + "&nx=" + nx
					+ "&ny=" + ny;
//			System.out.println("url : " + url);

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag
			doc.getDocumentElement().normalize();
//			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
//			System.out.println("파싱할 리스트 수 : " + nList.getLength());

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					// System.out.println(eElement.getTextContent());
					result.add(new String[] { getTagValue("category", eElement), getTagValue("obsrValue", eElement) });
				} // if end
			} // for end

		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end

		return result;
	}
	
	//동네 예보 구하는 메서드
	//input : String[] {날짜(2020-08-06), x좌표, y좌표}
	//return : List<String[]> {{날짜(2020-08-06), x좌표, y좌표}, {예보 일자, 예보 시각, category, value} , ...}
	public List<String[]> getWeatherFuture(String[] input) {
		List<String[]> result = new ArrayList<String[]>();
		result.add(input);
		String nx = input[1];
		String ny = input[2];
		String basedate = input[0].split(" ")[0].replace("-", "");
		String basetime = null;
		
		// -- basetime 제공 시간단위 처리
		int hour = Integer.parseInt(input[0].split(" ")[1].split(":")[0]);
		if(hour%3==0) {
			hour-=1;
		}else if(hour%3==1){
			hour-=2;
		}
		if(hour<0) {
			hour+=24;
			if(basedate.endsWith("0101")) {
				basedate = (Integer.parseInt(basedate)-10000+1100+30)+"";
			}
			if(basedate.endsWith("01")) {
				switch(getDays(Integer.parseInt(basedate.substring(0, 6))-1)) {
				case 28 : basedate = (Integer.parseInt(basedate)+27)+""; break;
				case 29 : basedate = (Integer.parseInt(basedate)+28)+""; break;
				case 30 : basedate = (Integer.parseInt(basedate)+29)+""; break;
				case 31 : basedate = (Integer.parseInt(basedate)+30)+""; break;
				}
			}else {
				basedate = (Integer.parseInt(basedate)-1)+"";
			}
		}// -- basetime 제공 시간단위 처리
		
		// -- basetime 제공 분단위 처리
		int minute = Integer.parseInt(input[0].split(" ")[1].split(":")[1]);
		if (minute > 10) {
			basetime = hour + "00";
		} else {
			hour-=3;
			if(hour<0) {
				hour+=24;
				if(basedate.endsWith("0101")) {
					basedate = (Integer.parseInt(basedate)-10000+1100+30)+"";
				}
				if(basedate.endsWith("01")) {
					switch(getDays(Integer.parseInt(basedate.substring(0, 6))-1)) {
					case 28 : basedate = (Integer.parseInt(basedate)+27)+""; break;
					case 29 : basedate = (Integer.parseInt(basedate)+28)+""; break;
					case 30 : basedate = (Integer.parseInt(basedate)+29)+""; break;
					case 31 : basedate = (Integer.parseInt(basedate)+30)+""; break;
					}
				}else {
					basedate = (Integer.parseInt(basedate)-1)+"";
				}
			}
			basetime = hour + "00";
		}
		if (basetime.length() == 3) {
			basetime = "0" + basetime;
		}
		// -- basetime 제공 분단위 처리
		
//		System.out.println("basedate = " + basedate);
//		System.out.println("basetime = " + basetime);
		
		try {
			// parsing할 url 지정(API 키 포함해서)
			String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"
					+ "?serviceKey=xPnUPygFqSpiU3B43RGYzd2xxChAkcHm3XKup4kwgI%2FuwXwj69qI1CUDhvyYf6nkYdw4foGYKEnJxdQto2uAgQ%3D%3D"
					+ "&numOfRows=300&pageNo=1" + "&base_date=" + basedate + "&base_time=" + basetime + "&nx=" + nx
					+ "&ny=" + ny;
//			System.out.println("url : " + url);
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			// root tag
			doc.getDocumentElement().normalize();
//			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
			
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
//			System.out.println("파싱할 리스트 수 : " + nList.getLength());
			
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					// System.out.println(eElement.getTextContent());
					result.add(new String[] { getTagValue("fcstDate", eElement), getTagValue("fcstTime", eElement), getTagValue("category", eElement), getTagValue("fcstValue", eElement) });
				} // if end
			} // for end
			
		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end
		
		return result;
	}

	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	private static int getDays(int i) {
		int year = i/100;
		int month = i-year*100;
//		System.out.println(year+":"+month);
		int days = 0;
		if((year%4==0)&&(year%100==0)){
			switch(month) {
			case 1:	case 3:	case 5:	case 7:	case 8:	case 10:case 12:days=31; break;
			case 4:	case 6:	case 9:	case 11:days=30; break;
			case 2 : days=28;
			}
		}else if ((year%4==0)||(year%400==0)) {
			switch(month) {
			case 1:	case 3:	case 5:	case 7:	case 8:	case 10:case 12:days=31; break;
			case 4:	case 6:	case 9:	case 11:days=30; break;
			case 2 : days=29;
			}
		}else {
			switch(month) {
			case 1:	case 3:	case 5:	case 7:	case 8:case 10:	case 12:days=31; break;
			case 4:	case 6:	case 9:	case 11:days=30; break;
			case 2 : days=28;
			}
		}
		return days;
	}

	public static void main(String[] args) {
		MyAction ma = new MyAction();
		String[] input = { "2020-08-06 12:20:26", "60", "125" };
		List<String[]> result = ma.getWeatherFuture(input);
		for (int i = 0; i < result.size(); i++) {
			if (i == 0) {
				System.out.println("baseDate  : " + result.get(i)[0]);
				System.out.println("nx : " + result.get(i)[1]);
				System.out.println("ny  : " + result.get(i)[2]);
			} else {
				System.out.println("fcstDate : " + result.get(i)[0]);
				System.out.println("fcstTime : " + result.get(i)[1]);
				System.out.println("category : " + result.get(i)[2]);
				System.out.println("fcstValue  : " + result.get(i)[3]);
			}
		}
	}

}
