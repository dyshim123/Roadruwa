package com.b3;

import java.sql.Timestamp;

public class Users {
   String u_id;
   String u_pwd;
   String u_name;
   int u_age;
   String u_phone;
   String u_gender;
   String u_type;
   String u_email;
   String u_image;
   Timestamp u_reg;
   
   public String getU_id() {
      return u_id;
   }
   public void setU_id(String u_id) {
      this.u_id = u_id;
   }
   public String getU_pwd() {
      return u_pwd;
   }
   public void setU_pwd(String u_pwd) {
      this.u_pwd = u_pwd;
   }
   public String getU_name() {
      return u_name;
   }
   public void setU_name(String u_name) {
      this.u_name = u_name;
   }
   public int getU_age() {
      return u_age;
   }
   public void setU_age(int u_age) {
      this.u_age = u_age;
   }
   public String getU_phone() {
      return u_phone;
   }
   public void setU_phone(String u_phone) {
      this.u_phone = u_phone;
   }
   public String getU_gender() {
      return u_gender;
   }
   public void setU_gender(String u_gender) {
      this.u_gender = u_gender;
   }
   public String getU_email() {
      return u_email;
   }
   public void setU_email(String u_email) {
      this.u_email = u_email;
   }
   public String getU_image() {
      return u_image;
   }
   public void setU_image(String u_image) {
      this.u_image = u_image;
   }
   public String getU_type() {
      return u_type;
   }
   public void setU_type(String u_type) {
      this.u_type = u_image;
   }
   public Timestamp getU_reg() {
      return u_reg;
   }
   public void setU_reg(Timestamp u_reg) {
      this.u_reg = u_reg;
   }
}