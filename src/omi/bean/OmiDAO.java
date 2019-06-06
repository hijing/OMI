package omi.bean;

import java.util.List;

public interface OmiDAO {

	public List cctv(int areaCode) throws Exception;
	
	public int areaCode(String num) throws Exception;
	
	public List area() throws Exception;
	
	public List wifi() throws Exception;

	public List getPoints() throws Exception; 
	
	public List getPoints2() throws Exception;
	
	public List getPoints3() throws Exception; 
	
	public List getGeoInfo() throws Exception; 
	
	public List children(int areaCode) throws Exception;
	
	public List bicycle(int areaCode) throws Exception;
	
	public List roadkill(int areaCode) throws Exception;
	
	public List openPbstData(int areaCode) throws Exception;
	
	public int geocode(String geocode) throws Exception;
	
	public String areaName(String areaCode) throws Exception;
	
}
