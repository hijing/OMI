package omi.bean;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class OmiDAOImpl implements OmiDAO {

	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List cctv(int areaCode) throws Exception{
		return sqlSession.selectList("omi.cctv", areaCode);
	}
	
	@Override
	   public int areaCode(String num) throws Exception {
	      int code = (Integer)sqlSession.selectOne("omi.areaCode", num);
	      return code;
	  }
	
	@Override
	public List area() throws Exception {
		return sqlSession.selectList("omi.area");
	}
	
	//와이파이
	@Override
	public List wifi() throws Exception {
		return sqlSession.selectList("omi.wifi2");
	}
	
	//교통 사고
	public List getPoints() throws Exception {		//자전거 교통사고
		// TODO Auto-generated method stub
		return sqlSession.selectList("omi.traffic3");
	}
	
	@Override
	public List getPoints2() throws Exception {		//어린이 교통사고
		// TODO Auto-generated method stub
		return sqlSession.selectList("omi.traffic2");
	}

	@Override
	public List getPoints3() throws Exception {		//무단횡단 교통사고
		// TODO Auto-generated method stub
		return sqlSession.selectList("omi.traffic1");
	}

	@Override
	public List getGeoInfo() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("omi.geoInfo");
	}

	//제주 사고 정리
	public List bicycle(int areaCode) throws Exception {
		return sqlSession.selectList("omi.bicycle", areaCode);
	}
	
	public List children(int areaCode) throws Exception {
		return sqlSession.selectList("omi.children", areaCode);
	}
	
	public List roadkill(int areaCode) throws Exception {
		return sqlSession.selectList("omi.roadkill", areaCode);
	}
	//공공시설
	@Override
	public List openPbstData(int areaCode) throws Exception {
		return sqlSession.selectList("omi.public", areaCode);		
	}
	
	@Override
   public int geocode(String geocode) throws Exception{
      int geocod = (Integer)sqlSession.selectOne("omi.geocode" ,geocode);
      return geocod;
   }


	@Override
	public String areaName(String areaCode) throws Exception {
		return sqlSession.selectOne("omi.areaName",areaCode);
	}
	
}
