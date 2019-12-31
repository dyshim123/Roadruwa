package trip.board;
import java.sql.Timestamp;
public class BoardDataBean {
   private int b_num;
   private String b_title;
   private String b_pic1;
   private String b_pic2;
   private String b_pic3;
   private String b_cate;
   private String b_lo;
   private String b_tr;
   private int b_day1;
   private int b_day2;
   private String b_one;
   private int b_ac;
   private String u_id;
   private int b_price;
   private Timestamp b_create_dt;
   private String appr;
   
   public int getB_num() {
      return b_num;
   }

   public void setB_num(int b_num) {
      this.b_num = b_num;
   }

   public String getB_title() {
      return b_title;
   }

   public void setB_title(String b_title) {
      this.b_title = b_title;
   }

   public String getB_pic1() {
      return b_pic1;
   }

   public void setB_pic1(String b_pic1) {
      this.b_pic1 = b_pic1;
   }

   public String getB_pic2() {
      return b_pic2;
   }

   public void setB_pic2(String b_pic2) {
      this.b_pic2 = b_pic2;
   }

   public String getB_pic3() {
      return b_pic3;
   }

   public void setB_pic3(String b_pic3) {
      this.b_pic3 = b_pic3;
   }

   public String getB_cate() {
      return b_cate;
   }

   public void setB_cate(String b_cate) {
      this.b_cate = b_cate;
   }

   public String getB_lo() {
      return b_lo;
   }

   public void setB_lo(String b_lo) {
      this.b_lo = b_lo;
   }

   public String getB_tr() {
      return b_tr;
   }

   public void setB_tr(String b_tr) {
      this.b_tr = b_tr;
   }

   public int getB_day1() {
      return b_day1;
   }

   public void setB_day1(int b_day1) {
      this.b_day1 = b_day1;
   }

   public int getB_day2() {
      return b_day2;
   }

   public void setB_day2(int b_day2) {
      this.b_day2 = b_day2;
   }

   public String getB_one() {
      return b_one;
   }

   public void setB_one(String b_one) {
      this.b_one = b_one;
   }

   public int getB_ac() {
      return b_ac;
   }

   public void setB_ac(int b_ac) {
      this.b_ac = b_ac;
   }

   public String getU_id() {
      return u_id;
   }

   public void setU_id(String u_id) {
      this.u_id = u_id;
   }
   public int getB_price() {
      return b_price;
   }

   public void setB_price(int b_price) {
      this.b_price = b_price;
   }

   public Timestamp getB_create_dt() {
      return b_create_dt;
   }
   
   public void setB_create_dt(Timestamp b_create_dt) {
      this.b_create_dt = b_create_dt;
   }
   public String getAppr() {
		return appr;
	}

	public void setAppr(String appr) {
		this.appr = appr;
	}
}