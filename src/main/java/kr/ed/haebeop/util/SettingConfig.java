package kr.ed.haebeop.util;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SettingConfig {
    private static String path = "D:\\sangmin0816\\luigi\\project4\\src\\main\\resources\\settings.properties";
    private static String[] weeks = new String[]{"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday", "holiday"};
    public static void main(String[] args) {
        try {
            System.out.println("YES");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Properties loadProperty() throws IOException {
        // 프로퍼티 파일을 로드
        Properties prop = new Properties();
        InputStream input = new FileInputStream(path);
        prop.load(input);
        return prop;
    }

    public static void saveProperty(Properties prop) throws IOException {
        // 변경 내용을 파일에 저장
        OutputStream output = new FileOutputStream(path);
        prop.store(output, "Updated settings");
    }

    public static String getProperty(String key) throws IOException {
        Properties prop = loadProperty();
        return prop.getProperty(key);
    }

    public static void editProperty(String key, String value) throws IOException {
        Properties prop = loadProperty();

        // 프로퍼티 값 추가 또는 수정
        prop.setProperty(key, value);

        saveProperty(prop);
    }

    public static void deleteProperty(String key) throws IOException {
        Properties prop = loadProperty();

        // 프로퍼티 삭제
        prop.remove(key);

        saveProperty(prop);
    }

    public static Map<String, String> weekdays(String pre) throws IOException {
        Map<String, String> business = new HashMap<>();

        for(String day: weeks){
            System.out.println(getProperty(pre+"."+day));
            business.put(day, getProperty(day));
        }

        return business;
    }

    public static List<String> businessClosed() throws IOException {
        List<String> closed = new ArrayList<>();
        for(int i=0; i<8; i++){
            boolean isOpen = Boolean.parseBoolean(getProperty("businessday."+weeks[i]));
            if(!isOpen){
                closed.add(weeks[i]);
            }
        }
        return closed;
    }

    public static Map<String, Integer> businesshour(String dayofweek) throws IOException, ParseException {
        Map<String, Integer> businesshours = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

        Date open = sdf.parse(getProperty("openhour."+dayofweek));
        Date close = sdf.parse(getProperty("closehour."+dayofweek));
        int capacity = Integer.parseInt(getProperty("reservation.capacity"));
        int interval = Integer.parseInt(getProperty("reservation.interval"));

        long intervalms = interval * 60 * 1000;

        Date current = open;
        while(current.before(close)){
            String start = sdf.format(current);
            current.setTime(current.getTime()+intervalms);
            String end = sdf.format(current);
            businesshours.put((start+" ~ "+end), capacity);
        }

        return businesshours;
    }
}
