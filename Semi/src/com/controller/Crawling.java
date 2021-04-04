package com.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {

	public List<String> CatCrawling(String savePath) throws IOException {

		List<String> successList = new ArrayList<String>();

		// 크롤링할 웹 주소
		String contentUrl = "https://www.daejeon.go.kr/ani/AniStrayAnimalList.do?flag=2&menuSeq=3090";
		Document contentDoc = null;

		try {
			// 웹과 연결
			contentDoc = Jsoup.connect(contentUrl).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 필요한 정보의 위치
		Elements content = contentDoc.select("ul.animal_list01");

		System.out.println("=============================================");
		// 지정한 위치를 저장
		Iterator<Element> ie1 = content.select("li > ul > li").iterator();

		List<String> contentList = new ArrayList<String>();
		String val = "";
		int count = 1;
		// 5개 1세트를 만듬
		while (ie1.hasNext()) {
			val += ie1.next().text() + "\n";
			if (count % 5 == 0) {
				contentList.add(val);
				val = "";
			}
			count++;
		}
		System.out.println("=============================================");
		// 출력
		for (int i = 0; i < contentList.size(); i++) {
			System.out.println(contentList.get(i));
			System.out.println("=============================================");
		}
		// 이미지 크롤링 하기위해 해당 웹과 연결
		Document doc = Jsoup.connect("https://www.daejeon.go.kr/ani/AniStrayAnimalList.do?flag=2&menuSeq=3090").get();
		// 이미지경로
		String crawlingImg = "https://www.daejeon.go.kr";
		// 해당 이미지가 담겨져 있는 상위 태그 클레스
		Element element = doc.select("ul.animal_list01").get(0);
		// 이미지가 있는 태그
		Elements img = element.select("img");
		List<String> listImg = new ArrayList<String>();
		for (Element e : img) {
			// 크롤링할 이미지 경로
			String url = crawlingImg+e.getElementsByAttribute("src").attr("src");
			URL imgUrl = new URL(url);
			BufferedImage jpg = ImageIO.read(imgUrl);
			// db에 저장된 값과 중복되지 않게 특정 문자 치환
			String name = url.replaceAll("/", "-").replaceAll("https:", "%");
			System.out.println(name);
			// 파일 저장 경로
			File file = new File(savePath+"cat\\"+name);
			ImageIO.write(jpg, "jpg", file);
			if (name.contains("jpg")) {
				listImg.add(name);
			}
		}
		for (int i = 0; i < listImg.size(); i++) {
			String all = listImg.get(i) + "@" + contentList.get(i);
			successList.add(all);
		}
		for (int i = 0; i < successList.size(); i++) {
			System.out.println(successList.get(i));
			System.out.println();
		}
		return successList;
	}


	public List<String> DokCrawling(String savePath) throws IOException {

		List<String> successList = new ArrayList<String>();

		// 크롤링할 웹 주소
		String contentUrl = "https://www.daejeon.go.kr/ani/AniStrayAnimalList.do?flag=1&menuSeq=3090";
		Document contentDoc = null;

		try {
			// 웹과 연결
			contentDoc = Jsoup.connect(contentUrl).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 필요한 정보의 위치
		Elements content = contentDoc.select("ul.animal_list01");

		System.out.println("=============================================");
		// 지정한 위치를 저장
		Iterator<Element> ie1 = content.select("li > ul > li").iterator();

		List<String> contentList = new ArrayList<String>();
		String val = "";
		int count = 1;
		// 5개 1세트를 만듬
		while (ie1.hasNext()) {
			val += ie1.next().text() + "\n";
			if (count % 5 == 0) {
				contentList.add(val);
				val = "";
			}
			count++;
		}
		System.out.println("=============================================");
		// 출력
		for (int i = 0; i < contentList.size(); i++) {
			System.out.println(contentList.get(i));
			System.out.println("=============================================");
		}
		// 이미지 크롤링 하기위해 해당 웹과 연결
		Document doc = Jsoup.connect("https://www.daejeon.go.kr/ani/AniStrayAnimalList.do?flag=1&menuSeq=3090").get();
		// 이미지경로
		String crawlingImg = "https://www.daejeon.go.kr";
		// 해당 이미지가 담겨져 있는 상위 태그 클레스
		Element element = doc.select("ul.animal_list01").get(0);
		// 이미지가 있는 태그
		Elements img = element.select("img");
		List<String> listImg = new ArrayList<String>();
		for (Element e : img) {
			// 크롤링할 이미지 경로
			String url = crawlingImg+e.getElementsByAttribute("src").attr("src");
			URL imgUrl = new URL(url);
			BufferedImage jpg = ImageIO.read(imgUrl);
			// db에 저장된 값과 중복되지 않게 특정 문자 치환
			String name = url.replaceAll("/", "-").replaceAll("https:", "%");
			System.out.println(name);
			// 파일 저장 경로
			File file = new File(savePath+"dok\\"+name);
			ImageIO.write(jpg, "jpg", file);
			if (name.contains("jpg")) {
				listImg.add(name);
			}
		}
		for (int i = 0; i < listImg.size(); i++) {
			String all = listImg.get(i) + "@" + contentList.get(i);
			successList.add(all);
		}

		for (int i = 0; i < successList.size(); i++) {
			System.out.println(successList.get(i));
			System.out.println();
		}

		return successList;
	}
}