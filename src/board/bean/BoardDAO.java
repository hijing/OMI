package board.bean;

import java.util.List; 

import board.bean.BoardVO;
import omi.bean.OmiVO;

public interface BoardDAO {
	
	public void insertArticle(BoardVO article) throws Exception;
	
	public int getArticleCount() throws Exception;
	
	public List getArticles(int start, int end) throws Exception;
	
	public BoardVO getArticle(int num) throws Exception;
	
	public BoardVO updateGetArticle(int num) throws Exception;
	
	public int updateArticle(BoardVO article) throws Exception;
	
	public int deleteArticle(int num, String passwd) throws Exception;
	
	public String localCode(String name1) throws Exception;
	
	public String SJlocalCode(String name) throws Exception;
	
	public void insertPublicData(OmiVO data) throws Exception;
	
	public void insertWifiData(OmiVO data) throws Exception;
	
	public void insertCctvData(OmiVO data) throws Exception;
	
	public void count(int num) throws Exception;
	
	public void deleteCctvArticleData(int num, String x, String y) throws Exception;
	
	public void deleteWifiArticleData(int num, String x, String y) throws Exception;
	
	public void deletePbstArticleData(int num, String x, String y) throws Exception;

}
