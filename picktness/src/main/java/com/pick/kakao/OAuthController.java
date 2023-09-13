package com.pick.kakao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.pick.member.service.MemberService;
import com.pick.member.vo.MemberVO;

@RestController
@RequestMapping("/kakao")
public class OAuthController {
	@Autowired
	OAuthService oauthService;
	@Autowired
	MemberService memberService;
    @ResponseBody
    @GetMapping("/callback")
    public ModelAndView kakaoCallback(@RequestParam String code, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println(code);
        String token = oauthService.getKakaoAccessToken(code);
        Map<String, String> kakaoMap = createKakaouser(token);
        MemberVO member = memberService.mailCheck(kakaoMap.get("email"));
        HttpSession session =request.getSession();
        if(member != null) {
        	session.setAttribute("isLogOn", true);
        	session.setAttribute("member", member);
        } else {
        	String email = kakaoMap.get("email");
        	int target = email.indexOf("@");
        	String email1 = email.substring(0, target);
        	String email2 = email.substring(target+1, email.length());
        	kakaoMap.put("email1", email1);
        	kakaoMap.put("email2", email2);
        	member = memberService.addKakaoMember(kakaoMap);
        	session.setAttribute("isLogOn", true);
        	session.setAttribute("member", member);
        }
        ModelAndView mav= new ModelAndView();
        mav.setViewName("redirect:/main.do");
        return mav;
        
        
    }
	
    public Map<String, String> createKakaouser(String token) throws Exception {
    	String reqURL = "https://kapi.kakao.com/v2/user/me";
    	Map<String, String> kakaoMap = new HashMap<String, String>();
        //access_token을 이용하여 사용자 정보 조회
        try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();

           conn.setRequestMethod("POST");
           conn.setDoOutput(true);
           conn.setRequestProperty("Authorization", "Bearer " + token); //전송할 header 작성, access_token전송

           //결과 코드가 200이라면 성공
           int responseCode = conn.getResponseCode();
           System.out.println("responseCode : " + responseCode);

           //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
           String line = "";
           String result = "";

           while ((line = br.readLine()) != null) {
               result += line;
           }
           System.out.println("response body : " + result);

           //Gson 라이브러리로 JSON파싱
           JsonParser parser = new JsonParser();
           JsonElement element = parser.parse(result);

           int id = element.getAsJsonObject().get("id").getAsInt();
           String stringId = Integer.toString(id);
           boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
           String email = "";
           if(hasEmail){
               email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
           }

           System.out.println("id : " + id);
           System.out.println("email : " + email);
           
           br.close();
           
           kakaoMap.put("id", stringId);
           kakaoMap.put("email", email);
           
           } catch (IOException e) {
                e.printStackTrace();
           }
        return kakaoMap;
    }
    
}
