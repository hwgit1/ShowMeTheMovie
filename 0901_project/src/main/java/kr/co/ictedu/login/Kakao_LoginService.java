package kr.co.ictedu.login;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.ictedu.util.dto.Kakao_MemberDTO;
import kr.co.ictedu.util.dto.MemberDTO;


@Service
public class Kakao_LoginService {
	
	@Autowired
	Kakao_LoginDAO dao;

	public String getAccessToken (String authorize_code) throws IOException{
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		//try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=945e73f5f777795905223c979bc7a02f"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8081/ictedu/login_form/kakao_login"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		/*} catch (IOException e) {
			e.printStackTrace();
		}*/
		return access_Token;
	}
    
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("age_range", age_range);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
    
	
	public MemberDTO login( Kakao_MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = dao.login( dto );
		return dtoFromDB;
	}//login
	

	
	
	
	
}//class