package kr.co.batis;

import java.util.ArrayList;

public interface MyDao {
	
	public void insert(MyDto mydto);
	public ArrayList<MyDto> list(int index,int rec);
	public int chong(int rec);
	public int readnum(int id);
	public MyDto content(int id);
	public void delete(int id);
	public boolean isPwd(int id, String pwd);
	public void updateOk(MyDto mdto);

}
