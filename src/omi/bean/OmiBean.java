package omi.bean;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/OMI/")
public class OmiBean {
	
	@Autowired
	private OmiDAOImpl OmiDAO =null;
		
		@RequestMapping("map.omi")      //첫번째 정보 지도
		public String map(Model model, String area1, String area2, String name, String geocode) throws Exception {
			List<OmiVO> cctv = null;
			List<OmiVO> wifi = null;
			List<traffic3VO> bicycle = null;
			List<traffic3VO> children = null;
			List<traffic3VO> road = null;
			List<OmiVO> pb = null;
	         wifi = OmiDAO.wifi();
	          if(area2 == null) {
	             area2 = "1";
	          }
	          int areacode = OmiDAO.areaCode(area2);
	          if(geocode != null) {
	             areacode = OmiDAO.geocode(geocode);
	          }
	          
	          if(area1!=null&area2!=null) { // map, select�뿉�꽌 寃��깋 �떆 寃��깋 吏��뿭�쓽 �씠由꾩쓣 �쓣�슦湲� �쐞�븿
	              String areaName1=OmiDAO.areaName(area1);
	              String areaName2=OmiDAO.areaName(area2);
	              model.addAttribute("areaName1",areaName1);
	              model.addAttribute("areaName2",areaName2);
	          }
	              
              if(name!=null) { // map2�뿉�꽌 �겢由� �씠踰ㅽ듃瑜� �씠�슜�븯�뿬 map�쑝濡� �꽆�뼱�솕�쓣 �븣 寃��깋 吏��뿭�쓽 �씠由꾩쓣 �쓣�슦湲� �쐞�븿
              	model.addAttribute("name",name);
              }
	          
	          cctv = OmiDAO.cctv(areacode);
	          bicycle = OmiDAO.bicycle(areacode);
	          children = OmiDAO.children(areacode);
	          road = OmiDAO.roadkill(areacode);
	          pb = OmiDAO.openPbstData(areacode);
	          
	          List cc = new ArrayList();
	          List bi = new ArrayList();
	          List ch = new ArrayList();
	          List ro = new ArrayList();
	          List pu = new ArrayList();
	          List wi = new ArrayList();
		      
		      for(int i = 0 ; i < cctv.size(); i++) {
		    	  cc.add(cctv.get(i));
		      }
		      for(int i = 0 ; i < bicycle.size(); i++) {
		    	  bi.add(bicycle.get(i));
		      }
		      for(int i = 0 ; i < children.size(); i++) {
		    	  ch.add(children.get(i));
		      }
		      for(int i = 0 ; i < road.size(); i++) {
		    	  ro.add(road.get(i));
		      }
		      for(int i = 0 ; i < pb.size(); i++) {
		    	  pu.add(pb.get(i));
		      }
		      for(int i = 0 ; i < wifi.size() ; i++){
		           if((wifi.get(i)).getCode()==areacode) {
		              wi.add(wifi.get(i));
		           }
		      }
		      
		      /*if(id != null) {
		    	  session.setAttribute("memId", id);
		    	  session.setAttribute("nickname", nickname);
		      }*/
		      
		      model.addAttribute("areacode", areacode);
		      model.addAttribute("wifi", wi);
		      model.addAttribute("bicycle", bi);
		      model.addAttribute("children", ch);
		      model.addAttribute("road", ro);
		      model.addAttribute("pb", pu);
		      model.addAttribute("cc", cc);
		      model.addAttribute("main","map.jsp");
		      return "/map/main";
	      }
		
		@RequestMapping("test.omi")
	      public String rserve(String area11, String area22, String data, Model model) throws RserveException, REXPMismatchException{
	            RConnection conn = new RConnection(); 
	            String [] val = new String[10];
	            String [] hr  = new String[10];
	            
	            try{
	               if(area11 != null) {                  
	                  conn.assign("area1", area11);
	                  conn.assign("area2", area22);
	                  conn.assign("data", data);
	                  conn.eval("library(Rserve)");
	                  conn.eval("library(rvest)");
	                  conn.eval("library(httr)");
	                  
	                  conn.eval("url <- 'https://search.naver.com/search.naver?where=news&sm=tab_jum&query='");
	                  conn.eval("urls <- paste(url,'+',area1,'+',area2,'+',data, sep='')");
	                  conn.eval("html <- read_html(urls, encoding='utf8')");                
	                   conn.assign("info", "dl > dt > a");
	                   conn.eval("news <- html_nodes(html, info)");
	                   conn.eval("href <- html_attr(news, 'href')");
	                   conn.eval("news <- html_text(news)");
	                  
	                  val = conn.eval("news").asStrings();
	                  hr = conn.eval("href").asStrings();
	              
	                  model.addAttribute("val", val);
	                  model.addAttribute("hr", hr);
	                  }

	         } catch(RserveException e){
	            e.printStackTrace();
	         } catch (REngineException e) {
	         e.printStackTrace();
	      } finally{
	            if(conn != null) try {conn.close();} catch(Exception se) {}
	         }
	            return "/map/test";
	            
	      }

		@RequestMapping("select.omi")			//�뜝�룞�삕�뜝�럩�굦�뜝�럥諭� 嶺뚮∥��占쎈�
		public String select() throws Exception{
			return "map/select";
		}
		
		@RequestMapping("main.omi")		//사이트 메인
		public String main(String token, String nickname, String id, Model model, HttpSession session) {
			if(id != null) {
		    	  session.setAttribute("memId", id);
		    	  session.setAttribute("nickname", nickname);
		      }
			model.addAttribute("token", token);
		    model.addAttribute("nickname", nickname);
			model.addAttribute("main","select.jsp");
			return "/map/main";
		}
		
		@RequestMapping("map2.omi")
		public String map2(Model model) throws Exception {
			List geoInfo=OmiDAO.getGeoInfo();
			model.addAttribute("geoInfo",geoInfo);
			model.addAttribute("main","map2.jsp");
			return "/map/main";
		}
		
		@RequestMapping("logout.omi")		//지역별 자료정보
		public String logout(HttpSession session, Model model) throws Exception {
			session.invalidate();
			model.addAttribute("main", "map.jsp");
			return "/map/main";
		}
		
		//문의하기 
		@RequestMapping("inquire.omi")
		public String inquire(Model model) throws Exception{
			model.addAttribute("main","inquire.jsp");
			return "/map/main";
		}
		
		@RequestMapping("error.omi")
		public String error() {
			return "map/error";
		}
		
}
