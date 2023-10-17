package kr.ed.haebeop.util;

import kr.ed.haebeop.domain.RestDay;
import org.json.JSONException;
import org.json.XML;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class RestDayUtil {
    //공휴일 정보 로딩 - yyyy-MM-dd 입력
    private static String serviceKey = "=w37d15K%2FRsCOEdiQ2kU5c2cgYeuV5JejFI%2Bvfrf%2F2p%2BmISqhAcuzEPzYKPqD3tWMaJLs30wXKrIHwt5HwG253A%3D%3D";


    public String getRestDay(String yyyymm) throws Exception {
        String yyyy = yyyymm.substring(0, 4);
        String mm = yyyymm.substring(4);

        StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + serviceKey); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("solYear","UTF-8") + "=" + URLEncoder.encode(yyyy, "UTF-8")); /*연*/
        urlBuilder.append("&" + URLEncoder.encode("solMonth","UTF-8") + "=" + URLEncoder.encode(mm, "UTF-8")); /*월*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        return sb.toString();
    }

    // xml 변환
    public List<RestDay> getRestDayList(String yyyymm) throws Exception {
        // XML 문자열을 파싱할 DocumentBuilder 생성
        String xmlString = this.getRestDay(yyyymm);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        // XML 문자열 파싱
        Document document = builder.parse(new InputSource(new StringReader(xmlString)));

        // XML 데이터 구조 순회
        Element root = document.getDocumentElement(); // 루트 요소 가져오기
        NodeList items = root.getElementsByTagName("item"); // "item" 요소 찾기

        List<RestDay> restDayList = new ArrayList<>();
        for (int i = 0; i < items.getLength(); i++) {
            Element item = (Element) items.item(i);
            String dateName = item.getElementsByTagName("dateName").item(0).getTextContent();
            String locdate = item.getElementsByTagName("locdate").item(0).getTextContent();
            String isHoliday = item.getElementsByTagName("isHoliday").item(0).getTextContent();

            restDayList.add(new RestDay(dateName, locdate, isHoliday));
        }

        return restDayList;
    }


}
