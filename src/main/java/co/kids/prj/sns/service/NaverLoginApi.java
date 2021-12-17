package co.kids.prj.sns.service;

import org.springframework.stereotype.Component;

import com.github.scribejava.core.builder.api.DefaultApi20;

@Component
public class NaverLoginApi extends DefaultApi20 {
	
	protected NaverLoginApi() {}
	
	private static class instanceHolder{
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	
	public static NaverLoginApi instance() {
		return instanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
	
}
