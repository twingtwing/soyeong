package co.kids.prj.sns.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component("kakaoLoginService")
public class KakaoLoginService{
	
	//토큰 발급
	public String getAccessToken(String authorize_code) {
		String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=0bc9a42bdb4d7b26534db62b84cc84ed");
			sb.append("&redirect_uri=http://192.168.0.4/prj/kakaoLogin.do");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : " + access_token);
            System.out.println("refresh_token : " + refresh_token);
			
			br.close();
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
 		
		return access_token;
	}
	
	//유저 정보 조회
	public HashMap<String, Object> getUserInfo(String access_token){
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int responseCode = conn.getResponseCode();
			
			System.out.println("responseCode = "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line=br.readLine())!=null) {
				result +=line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            //이메일,이름,성별 가져옴
            String id = kakao_account.getAsJsonObject().get("email").getAsString();
            String name = properties.getAsJsonObject().get("nickname").getAsString();
            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
            
            userInfo.put("access_token", access_token);
            userInfo.put("id", id);
            userInfo.put("name", name);
            userInfo.put("gender", gender);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return userInfo;
	}
	
	public void getLogout(String access_token) {
		String reqURL ="https://kapi.kakao.com/v1/user/logout";
		try {
			URL url =  new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			int responseCode = conn.getResponseCode();
			
			if(responseCode == 400) throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
				
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String br_line = "";
			String result = "";
			while((br_line = br.readLine())!=null) {
				result+=br_line;
			}
			
			System.out.println("결과 : "+result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
