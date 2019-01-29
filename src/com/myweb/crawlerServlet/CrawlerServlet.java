package com.myweb.crawlerServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * crawler servlet
 */
@WebServlet("*.cr")
public class CrawlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrawlerServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String URL = "";
		String keyWord = "";
		String urlResult = "";
		
		String page = request.getRequestURI();
		page = page.substring(1, page.lastIndexOf("."));
		System.out.println("page: " + page);
		
		switch (page) {
		case "jobkorea":
			URL = "http://www.jobkorea.co.kr/Search/?";
			keyWord = "spring";
			urlResult = URL + getJobkoreaParameter(keyWord, 4); // 최종 조립된 URL
			System.out.println(urlResult);
			
			try {
				// 조립된 URL 에 해당하는 페이지 소스 (HTML) 를 가져온다
				Document document = Jsoup.connect(urlResult).get();
	
				// document 에서 필요한 요소만 가져온다 (배열)
				Elements elements = document.select(".list .detailList li");
				
				// 요소 (배열) 의 크기가 0 이면 검색결과가 없음
				if (elements.size() == 0) {
					System.out.println("검색된 정보가 없습니다");
				}
				
				// 가져온 요소 (배열) 확인
				int idx = 0;
				for (Element element : elements) {
					System.out.println(++idx + " : " + element.text());
					System.out.println(" >> corpName : " + element.select(".corpName").text());
					System.out.println(" >> jobInfo : " + element.select(".jobInfo").text());
					System.out.println("=============================================================");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			break;
		case "paranGersang":
			URL = "https://cafe.naver.com/ArticleList.nhn?";
			urlResult = URL + getParanParameter(3); // 최종 조립된 URL
			
			try {
				// 조립된 URL 에 해당하는 페이지 소스 (HTML) 를 가져온다
				Document document = Jsoup.connect(urlResult).get();
	
				// document 에서 필요한 요소만 가져온다 (배열)
				Elements elements = document.select(".board-box .board-list");
				
				// 요소 (배열) 의 크기가 0 이면 검색결과가 없음
				if (elements.size() == 0) {
					System.out.println("검색된 정보가 없습니다");
				}
				
				// 가져온 요소 (배열) 확인
				int idx = 0;
				for (Element element : elements) {
					System.out.println(++idx + " : " + element.text());
					System.out.println("=============================================================");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			break;
		}
	} 
	
	public String getJobkoreaParameter (String keyWord, int page) {
		String params = "stext=" + keyWord + ""
							+ "&pageType=GI"
							+ "&pageSize=30"
							+ "&rod=1"
							+ "&IsCoInfoSC=false"
							+ "&IsRecruit=false"
							+ "&Page=" + page + ""
							+ "&Order=1";
		
		return params;
	}
	
	public String getParanParameter (int page) {
		String params = "search.clubid=10152049"
							+ "&search.menuid=307"
							+ "&search.boardtype=Q"
							+ "&search.questionTab=A"
							+ "&search.totalCount=151"
							+ "&search.page=" + page + "";
		
		return params;
	}

}
