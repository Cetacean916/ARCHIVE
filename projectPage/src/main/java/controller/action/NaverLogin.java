package controller.action;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NaverLogin implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String clientId = "BXMUqmkrVeQk3qxZzo6Q";
		String clientSecret = "mCJ3Dg0amR"; 
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("Main?command=home","UTF-8");
				
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&");
		apiURL.append("client_id=" + clientId);
		apiURL.append("&client_secret=" + clientSecret);
		apiURL.append("&redirect_uri=" + redirectURI);
		apiURL.append("&code=" + code);
		apiURL.append("&state=" + state);
		String access_token = "";
		String refresh_token = "";
	
				
		try { 
			  URL url = new URL(apiURL.toString());
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    		System.out.println(res.toString());
		    		JSONParser parsing = new JSONParser();
		    		Object obj = parsing.parse(res.toString());
		    		JSONObject jsonObj = (JSONObject)obj;
		    			        
		    		access_token = (String)jsonObj.get("access_token");
		    		refresh_token = (String)jsonObj.get("refresh_token");
		    	}
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		if(access_token != null) {
			try {
				String apiurl = "https://openapi.naver.com/v1/nid/me";
				 URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", "header");
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
				 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				 while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
				}
				br.close();
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
				JSONObject resObj = (JSONObject)jsonObj.get("response");
				 
				String id = (String)resObj.get("id");
				String name = (String)resObj.get("name");
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
		}
	}
}
