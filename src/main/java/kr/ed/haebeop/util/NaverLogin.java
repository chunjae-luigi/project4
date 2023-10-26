package kr.ed.haebeop.util;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;

public class NaverLogin {

    private final static String CLIENT_ID = "BTxKtlmIOp4uKqDwgatk";
    private final static String CLIENT_SECRET = "b1zo7nukNb";
    //로그인성공 후 가야할 주소
    //네아로 설정의 콜백 주소와 같아야 한다.
    // (가급적 같은 프로젝트(war파일)상에 지정하자 그래야 헷갈리지 않고 편하다.)
    //최종페이지는 리다이렉트로 해결하면 된다.
    // private final static String REDIRECT_URI = "http://localhost:8081/team44_war/user/naver/login";
    private final static String REDIRECT_URI = "http://10.41.1.198:8080/team44/user/naver/login";

    /* 프로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

    public String generateState() {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }

    /* 네아로 인증  URL 생성  Method */
    public String getAuthorizationUrl(HttpSession session) {

        String state = generateState();
        session.setAttribute("state", state);

        /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state)
                .build(NaverLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* 네아로 Callback 처리 및  AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = (String) session.getAttribute("state");
        if (sessionState.equals(state)) {

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }

    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {

        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());

        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
//        return null;
    }
}