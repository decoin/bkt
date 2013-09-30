package com.bkt.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

import net.sf.json.JSONObject;

import com.bkt.bean.User;
import com.bkt.service.UserService;
import com.bkt.util.WriteData;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName UserAction
 * @Description TODO 用户业务逻辑处理
 * @author zyj jayzh1993@gmail.com
 * @date 2013-9-30
 */
public class UserAction extends ActionSupport {
	
	private User user;
	private UserService userservice;
	private String username;
	private String password;
	private static int count = 0;
	//图片上传属性
	private File image;
	private String imageFileName;
	private String imageContentType;
	
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserservice() {
		return userservice;
	}
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}
	
	/** 
	 * @Method: loginUser 
	 * @Description: TODO 用户登陆
	 * @param @return
	 * @param @throws Exception
	 * @return String
	 */
	public String loginUser() throws Exception{
		User us = this.userservice.queryByName(username);
		if(us == null){
			WriteData.write("notexist");
		}else{
			if(us.getPassword().equals(password)){
				Map request = ActionContext.getContext().getSession();
				request.put("user", us);
				request.put("username", username);
				request.put("photo", us.getPhoto());
				count++;
				request.put("count", count);
				WriteData.write("success");
			}else{
				WriteData.write("fail");
			}
		}
		return null;
	}
	/** 
	 * @Method: queryUser 
	 * @Description: TODO 显示用户个人信息
	 * @param @return
	 * @return String
	 */
	public String queryUser(){
		Map request = ActionContext.getContext().getSession();
		String tname = (String)request.get("username");
		User us = this.userservice.queryByName(tname);
		Map<String,Object> result = new HashMap<String,Object>();
		List<String> list = new ArrayList();
		int total = 6;
		String name = "{\"name\":\"用户名\"" +",\"value\":\"" +us.getName() +"\",\"group\":\"个人信息\",\"editor\":\"text\"}"; 
		String id = "{\"name\":\"身份证号\"" +",\"value\":\"" +us.getCardId() +"\",\"group\":\"个人信息\",\"editor\":\"text\"}";
		String mail = "{\"name\":\"邮箱\"" +",\"value\":\"" +us.getEmail() +"\",\"group\":\"个人信息\",\"editor\":\"text\"}";
		String sex = "{\"name\":\"性别\"" +",\"value\":\"" +us.getSex() +"\",\"group\":\"个人信息\",\"editor\":\"text\"}";
		String tel = "{\"name\":\"联系电话\"" +",\"value\":\"" +us.getTelephone() +"\",\"group\":\"个人信息\",\"editor\":\"text\"}";
		String add = "{\"name\":\"地址\"" +",\"value\":\"" +us.getAddress() +"\",\"group\":\"个人信息\",\"editor\":\"text\"}";
		list.add(name);
		list.add(id);
		list.add(mail);
		list.add(sex);
		list.add(tel);
		list.add(add);
		result.put("total", total);
		result.put("rows", list);
		JSONObject json = JSONObject.fromObject(result);
		WriteData.write(json.toString());
		return null;
	}
	/** 
	 * @Method: logoutUser 
	 * @Description: TODO 用户注销
	 * @param @return
	 * @return String
	 */
	public String logoutUser(){
		Map session = ActionContext.getContext().getSession();
		session.clear();
		count--;
		session.put("count", count);
		WriteData.write("成功退出");
		return null;
	}
	/** 
	 * @Method: regUser 
	 * @Description: TODO 新用户注册
	 * @param @return
	 * @return String
	 */
	public String regUser(){
		this.userservice.save(user);
		WriteData.write("注册成功");
		return null;
	}
	/** 
	 * @Method: uploadPhoto 
	 * @Description: TODO 用户上传头像
	 * @param @return
	 * @param @throws Exception
	 * @return String
	 */
	public String uploadPhoto() throws Exception{
		InputStream is = new FileInputStream(image);
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
		Map session = ActionContext.getContext().getSession();
		String usname = (String)session.get("username");
		User us = this.userservice.queryByName(usname);
		String imageName = usname + ".jpg";
		us.setPhoto(imageName);
		this.userservice.update(us);
		File toImage = new File(path,imageName);
		OutputStream os = new FileOutputStream(toImage);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = is.read(buffer)) > 0) {  
	            os.write(buffer, 0, length);  
	    }
		is.close();
		os.close();
		WriteData.write("头像更改成功");
		return null;
	}
	/** 
	 * @Method: changePwd 
	 * @Description: TODO 用户密码修改
	 * @param @return
	 * @return String
	 */
	public String changePwd(){
		Map session = ActionContext.getContext().getSession();
		String usname = (String)session.get("username");
		User us = this.userservice.queryByName(usname);
		ActionContext ac = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ac.get(ServletActionContext.HTTP_REQUEST);
		String newpassword = request.getParameter("newpassword");
		if(us.getPassword().equals(password)){
			us.setPassword(newpassword);
			this.userservice.update(us);
			WriteData.write("success");
		}else{
			WriteData.write("fail");
		}
		return null;
	}
}
