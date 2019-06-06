package board.bean;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import board.bean.BoardVO;
import omi.bean.OmiVO;

public class BoardDAOImpl implements BoardDAO{
	
	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int getArticleCount() throws Exception {
		return sqlSession.selectOne("omi.count");
	}


	@Override
	public List getArticles(int start, int end) throws Exception {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("omi.articleList", map);
	}
	
	@Override
	public void insertArticle(BoardVO article) throws Exception {
		int number = 0;
		int num=article.getNum();
		int ref=article.getRef();
		if(sqlSession.selectOne("omi.maxNum") != null) {
			number = (int)sqlSession.selectOne("omi.maxNum") + 1;
		}else {
			number = 1;
		}
		if (num!=0)
		{
			sqlSession.update("omi.upRef", article);
		}else{ 
			article.setRef(number);
		}
		
		sqlSession.insert("omi.insert", article);
	}


	@Override
	public BoardVO getArticle(int num) throws Exception {
		sqlSession.update("omi.readcount", num);
		return sqlSession.selectOne("omi.content", num);
	}

	@Override
	public BoardVO updateGetArticle(int num) throws Exception {
		return sqlSession.selectOne("omi.content", num);
	}

	@Override
	public int updateArticle(BoardVO article) throws Exception {
		String dbid = sqlSession.selectOne("omi.checkID", article.getNum());
		int check = 0;
		if(dbid.equals(article.getId())) {
			sqlSession.update("omi.updateArticle", article);
			check = 1;
		}
		return check;
	}

	@Override
	public int deleteArticle(int num, String id) throws Exception {
		String dbid = sqlSession.selectOne("omi.checkID", num);
		int check = 0;
		if(dbid.equals(id) || id.equals("1014030732")) {
			sqlSession.delete("omi.deleteArticle", num);
			check = 1;
		}
		return check;
	}

	@Override
	public String localCode(String name) throws Exception {
		String localCode = sqlSession.selectOne("omi.localCode", name);
		return localCode;
	}

	@Override
	public void insertPublicData(OmiVO data) throws Exception {
		sqlSession.insert("omi.publicDataInsert", data);
	}
	
	@Override
	public void insertWifiData(OmiVO data) throws Exception {
		sqlSession.insert("omi.wifiDataInsert", data);
	}

	@Override
	public void insertCctvData(OmiVO data) throws Exception {
		sqlSession.insert("omi.cctvDataInsert", data);
	}

	@Override
	public String SJlocalCode(String name) throws Exception {
		String localCode = sqlSession.selectOne("omi.SJlocalCode", name);
		return localCode;
	}

	@Override
	public void count(int num) throws Exception {
		sqlSession.update("omi.dataInsertCount", num);
	}

	@Override
	public void deleteCctvArticleData(int num, String x, String y) throws Exception {
		HashMap map = new HashMap();
		map.put("x", x);
		map.put("y", y);
		sqlSession.update("omi.resetCount", num);
		sqlSession.delete("omi.deleteCctvArticleData", map);
	}

	@Override
	public void deleteWifiArticleData(int num, String x, String y) throws Exception {
		HashMap map = new HashMap();
		map.put("x", x);
		map.put("y", y);
		sqlSession.update("omi.resetCount", num);
		sqlSession.delete("omi.deleteWifiArticleData", map);
	}

	@Override
	public void deletePbstArticleData(int num, String x, String y) throws Exception {
		HashMap map = new HashMap();
		map.put("x", x);
		map.put("y", y);
		sqlSession.update("omi.resetCount", num);
		sqlSession.delete("omi.deletePbstArticleData", map);
	}

}
