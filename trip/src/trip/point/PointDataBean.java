package trip.point;

import java.sql.Timestamp;

public class PointDataBean {
	private String u_id;
	private int p_num;
	private Timestamp reg_date;
	private String content;
	private String tpoint;
	private int rpoint;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTpoint() {
		return tpoint;
	}
	public void setTpoint(String tpoint) {
		this.tpoint = tpoint;
	}
	public int getRpoint() {
		return rpoint;
	}
	public void setRpoint(int rpoint) {
		this.rpoint = rpoint;
	}
}
