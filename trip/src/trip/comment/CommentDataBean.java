package trip.comment;
import java.sql.Timestamp;

public class CommentDataBean {
	private int c_num; 
    private String c_content;
    private Timestamp c_reg;
    private int b_num;
    private String c_id;
    private String star;
    private String c_pic;

	public String getC_pic() {
		return c_pic;
	}
	public void setC_pic(String c_pic) {
		this.c_pic = c_pic;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
    public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
    public Timestamp getC_reg() {
		return c_reg;
	}
    public void setC_reg(Timestamp c_reg) {
		this.c_reg = c_reg;
	}
    public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
}