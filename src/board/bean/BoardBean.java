package board.bean;

import java.util.Collections; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.bean.BoardDAOImpl;
import board.bean.BoardVO;
import omi.bean.OmiVO;

@Controller
@RequestMapping("/OMI/")
public class BoardBean {
	
	@Autowired
	private BoardDAOImpl boardDAO = null;
	
	@RequestMapping("list.omi")
	public String boardList(String pageNum, Model model) throws Exception{

        if (pageNum == null) {
            pageNum = "1";
        }
        int pageSize = 10;//한 페이지의 글의 개수
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number=0;

        List articleList = null;
        count = boardDAO.getArticleCount();//전체 글의 수 
        
        if (count > 0) {
            articleList = boardDAO.getArticles(startRow, endRow);//현재 페이지에 해당하는 글 목록
        } else {
            articleList = Collections.EMPTY_LIST;
        }

		number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
        //해당 뷰에서 사용할 속성
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("articleList", articleList);
        model.addAttribute("main", "list.jsp");
		return "/map/main";
	}
	
	@RequestMapping("content.omi")
	public String AoPcontent(int num, String pageNum, Model model) throws Exception {

        BoardVO article = boardDAO.getArticle(num); //해당 글번호에 대한 해당 레코드
  
        //해당 뷰에서 사용할 속성
        model.addAttribute("num", new Integer(num));
        model.addAttribute("pageNum", new Integer(pageNum));
        model.addAttribute("article", article);
        model.addAttribute("main", "content.jsp");
		return "/map/main";
	}
	
	@RequestMapping("writeForm.omi")
	public String AoPwriteForm(BoardVO vo,Model model) throws Exception {
		int num=0,ref=1;
        try{  
          if(vo.getNum() != 0){
	         num=vo.getNum();
	         ref=vo.getRef();
	      }
		}catch(Exception e){e.printStackTrace();}
        //해당 뷰에서 사용할 속성
		model.addAttribute("num", new Integer(num));
        model.addAttribute("ref", new Integer(ref));
        model.addAttribute("main", "writeForm.jsp");
		return "/map/main";
	}
	
	@RequestMapping("writePro.omi")
	public String writePro(BoardVO article) throws Exception{
		boardDAO.insertArticle(article);
		return "/map/writePro";
	}
	
	@RequestMapping("updateForm.omi")
	public String AoPupdateForm(int num, String pageNum, Model model) throws Exception {
		BoardVO article = boardDAO.updateGetArticle(num);
		model.addAttribute("num", new Integer(num));
        model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("article", article);
		model.addAttribute("main", "updateForm.jsp");
		return "/map/main";
	}
	
	@RequestMapping("updatePro.omi")
	public String updatePro(BoardVO article, Model model, String pageNum) throws Exception{
		int check = boardDAO.updateArticle(article);
		model.addAttribute("check", check);
		model.addAttribute("pageNum", new Integer(pageNum));
		return "/map/updatePro";
	}
	
	@RequestMapping("deleteForm.omi")
	public String AoPdeleteForm(int num, String pageNum, Model model) {		
		model.addAttribute("num", new Integer(num));
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("main", "deleteForm.jsp");
		return "/map/main";
	}
	
	@RequestMapping("deletePro.omi")
	public String deletePro(int num, String id, String pageNum, Model model) throws Exception {
		int check = boardDAO.deleteArticle(num, id);
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		return "/map/deletePro";
	}
	
	@RequestMapping("dataInsertForm.omi")
	public String dataInsertForm(int num, String pageNum, Model model) throws Exception {
		BoardVO article = boardDAO.updateGetArticle(num);
		String local = article.getLocal();
		String [] nameArray = local.split(" ");
		String name1 = nameArray[0] + " " + nameArray[1];
		String name2 = nameArray[0] + " " + nameArray[1] + " " + nameArray[2];
		String localCode = null;
		String LC = null;
		if(boardDAO != null && boardDAO.localCode(nameArray[2]) != null) {
			LC = boardDAO.localCode(nameArray[2]);
		}
		System.out.println(LC);
		if(nameArray[0].equals("세종특별자치시")) {
			localCode = boardDAO.SJlocalCode(nameArray[0]);
		}else if(LC == null){
			localCode = boardDAO.localCode(name1);
		}else if(LC != null) {
			localCode = LC;
		}
		
		
		model.addAttribute("num", new Integer(num));
        model.addAttribute("pageNum", new Integer(pageNum));
        model.addAttribute("sigungu1", nameArray[0]);
        model.addAttribute("sigungo2", nameArray[1]);
        model.addAttribute("localCode", localCode);
		model.addAttribute("article", article);
		model.addAttribute("main", "dataInsertForm.jsp");
		return "/map/main";
	}
	
	@RequestMapping("dataInsertPro.omi")
	public String dataInsertPro(OmiVO data, String information, String direction, String sigungu1, String sigungu2, int localCode, int num, String pageNum, Model model) throws Exception{
		BoardVO article = boardDAO.updateGetArticle(num);
		int check = 0;
		
		if(article.getCount() == 0) {
			if(article.getData().equals("cctv")) {
				data.setGg(sigungu1);
				data.setAddr(article.getLocal());
				data.setInfo(direction);
				data.setWedo(article.getX());
				data.setGyungdo(article.getY());
				data.setGgn(sigungu1);
				data.setGeocode(localCode);
				
				boardDAO.insertCctvData(data);
				boardDAO.count(num);
				check = 1;
			}
			
			if(article.getData().equals("wifi")) {
				data.setSido(sigungu1);
				data.setGun(sigungu2);
				data.setX(article.getX());
				data.setY(article.getY());
				data.setCode(localCode);
				data.setLocation(information);
				
				boardDAO.insertWifiData(data);
				boardDAO.count(num);
				check = 1;
			}
			
			if(article.getData().equals("공공시설")) {
				data.setSite(information);
				data.setX(article.getX());
				data.setY(article.getY());
				data.setLocal(article.getLocal());
				data.setCode(localCode);
				
				boardDAO.insertPublicData(data);
				boardDAO.count(num);
				check = 1;
			}
		}else {
			check = 2;
		}
		
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("check", check);
		return "/map/dataInsertPro";
	}
	
	@RequestMapping("dataDeletePro.omi")
	public String dataDeletePro(int num, Model model, String pageNum) throws Exception{
		
		BoardVO article = boardDAO.updateGetArticle(num);
		int check = 0;
		
		String x = article.getX();
		String y = article.getY();
		
		if(article.getData().equals("cctv")) {
			boardDAO.deleteCctvArticleData(num,x,y);
			check = 1;
		}else if(article.getData().equals("wifi")) {
			boardDAO.deleteWifiArticleData(num,x,y);
			check = 1;
		}else if(article.getData().equals("공공시설")) {
			boardDAO.deletePbstArticleData(num,x,y);
			check = 1;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("check", check);
		return "/map/dataDeletePro";
	}

}
