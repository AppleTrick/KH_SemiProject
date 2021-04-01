package com.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Iterator;

import javax.imageio.ImageIO;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	
	public static void main(String[] args) throws IOException {
		
		String url = "https://www.daejeon.go.kr/ani/AniStrayAnimalList.do?flag=1&menuSeq=3108";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Elements element = doc.select("ul.animal_list01");
		
		System.out.println("=============================================");
		
		Iterator<Element> ie1 = element.select("li > ul > li").iterator();
		
		while (ie1.hasNext()) {
//			String ie = ie1.next().text();
//			
//			int index = ie.indexOf(":");
//			
//			String ie2 = ie.substring(0, index);
//			String ie3 = ie.substring(index+1);
			
//			System.out.println("ie2 :" + ie2);
//			System.out.println("ie3 :" + ie3);
			System.out.println(ie1.next().text()+"\t");
		}
		System.out.println("=============================================");
//		
//		Document doc = Jsoup.connect("https://www.daejeon.go.kr/ani/AniStrayAnimalList.do?flag=1&menuSeq=3108").get();
//		
//		String crawlingImg = "https://www.daejeon.go.kr";
//		
//		Element element = doc.select("ul.animal_list01").get(0);
//		System.out.println(element);
//		Elements img = element.select("img");
//		System.out.println(img);
//		int page = 0;
//		for (Element e : img) {
//			String url = crawlingImg+e.getElementsByAttribute("src").attr("src");
//			System.out.println(url);
//			URL imgUrl = new URL(url);
//			System.out.println(imgUrl);
//			BufferedImage jpg = ImageIO.read(imgUrl);
//			System.out.println(jpg);
//			File file = new File("C:\\Users\\kas78\\Desktop\\크롤링사진"+"\\"+page+".jpg");
//			System.out.println(file);
//			ImageIO.write(jpg, "jpg", file);
//			if (url.contains("FileUpload")) {
//				page+=1;
//			}
//		}
	}
}