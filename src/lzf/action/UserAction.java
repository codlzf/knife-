package lzf.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import lzf.model.Comment;
import lzf.model.CommentJoinMessage;
import lzf.model.Message;
import lzf.model.RegisterUser;
import lzf.model.ShowComment;
import lzf.model.User;
import lzf.model.UserInfo;
import lzf.service.CommentService;
import lzf.service.MessageService;
import lzf.service.UserService;

@Component("user")
public class UserAction extends ActionSupport implements SessionAware{
	Comment com=new Comment();
	User users;
	UserService us;
	RegisterUser ruser;
	Message msg;
	Map<String,Object> session;
	ArrayList<User>userList;
	ArrayList<Message>msgs;
	ArrayList<Comment>coms;
	ArrayList<ShowComment>sc;
	ArrayList<CommentJoinMessage>cjm;
	MessageService ms;
	int id;
    String textss;
    CommentService cs;
    int count;
    int sum;
    UserInfo ui;
    
	public UserInfo getUi() {
		return ui;
	}
	public void setUi(UserInfo ui) {
		this.ui = ui;
	}
	public ArrayList<User> getUserList() {
		return userList;
	}
	public void setUserList(ArrayList<User> userList) {
		this.userList = userList;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ArrayList<Comment> getComs() {
		return coms;
	}
	public void setComs(ArrayList<Comment> coms) {
		this.coms = coms;
	}
	public CommentService getCs() {
		return cs;
	}
	@Resource
	public void setCs(CommentService cs) {
		this.cs = cs;
	}
	public String getTextss() {
		return textss;
	}
	public void setTextss(String textss) {
		this.textss = textss;
	}
	public Comment getCom() {
		return com;
	}
	public void setCom(Comment com) {
		this.com = com;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public MessageService getMs() {
		return ms;
	}
	@Resource
	public void setMs(MessageService ms) {
		this.ms = ms;
	}
	public ArrayList<Message> getMsgs() {
		return msgs;
	}
	public void setMsgs(ArrayList<Message> msgs) {
		this.msgs = msgs;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public Message getMsg() {
		return msg;
	}
	public void setMsg(Message msg) {
		this.msg = msg;
	}
	public RegisterUser getRuser() {
		return ruser;
	}
	public void setRuser(RegisterUser ruser) {
		this.ruser = ruser;
	}
	public UserService getUs() {
		return us;
	}
	@Resource
	public void setUs(UserService us) {
		this.us = us;
	}
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	public String doLogin(){
		boolean b=us.checkForLogin(users);
		if(b){
			session.put("user", users);
			return "success";
		}
		return "fail";
	}
	public String doRegister(){
		boolean b=us.registerUser(ruser);
		//if()
		if(b){
			return "success";
		}
		return "fail";
	}
	public String leaveMessage(){
		msg.setTime(new Date().toLocaleString());
		msg.setUsers((User)session.get("user"));
		msg.setLeaveUser(((User)(session.get("user"))).getUsername());
		msg.setTop_flag(1);
		us.saveMessage(msg);
		return "success";
	}
	
	public String getAllMessage(){
		
		users=(User) session.get("user");
		msgs=ms.getAllMessage();
		return "success";
	}
	public String getSingleMessage(){
		System.out.println(id+"id");
		msg=ms.findMessageById(id);
	//	System.out.println(msg.getMessages()+"!");
		users=us.getUser(id);
		
		sc=cs.getAllComments(id);
		return "success";
	}
	public ArrayList<ShowComment> getSc() {
		return sc;
	}
	public void setSc(ArrayList<ShowComment> sc) {
		this.sc = sc;
	}
	public String doComment(){
		System.out.println("??"+textss);
		com.setTextss(textss);
		com.setTime(new Date().toLocaleString());
		com.setUser((User)session.get("user"));
		msg=ms.findMessageById(id);
		com.setMsg(msg);
		com.setCname(((User)(session.get("user"))).getUsername());
		System.out.println();
		cs.saveComment(com,msg);
		return "success";
	}
	public String getMyMessage(){
		msgs=ms.getMyMessage((User)session.get("user"));
		return "success";
	}
	public String getMyComment(){
		System.out.println(count);
		cjm=cs.getMyComment((User)session.get("user"),count);
		sum=cs.getCountNum(((User)session.get("user")).getId());
		return "success";
	}
	public ArrayList<CommentJoinMessage> getCjm() {
		return cjm;
	}
	public void setCjm(ArrayList<CommentJoinMessage> cjm) {
		this.cjm = cjm;
	}
	public String doDelComment(){
		System.out.println(com.getId());
		cs.delComment(com.getId());
		return "success";
	}
	public String modifyUserInfoPage(){
		users=(User) session.get("user");
		return "success";
	}
	public String doModifyUserInfo(){
		if(users!=null){
			System.out.println("!@!@"+users.getUsername());
			users.setId(((User)session.get("user")).getId());
		}
		us.modifyUserInfo(users);
		return "success";
	}
	public String doDelMyMessage(){
		System.out.println("msgid"+msg.getId());
		ms.delMessage(msg.getId());
		return "success";
	}
	public String doTopMessage(){
		ms.topMessage(msg.getId());
		return "success";
	}
	public String privateSpace(){
		users=(User) session.get("user");
		return "success";
	}
	public String getAllUser(){
		userList=us.getAllUser();
		return "success";
	}
	public String delUser(){
		us.delUser(users.getId());
		return "success";
	}
	public String changePic(){
		String str="image/tx"+id+".jpg";
		users=(User) session.get("user");
		users.setPic(str);
		session.put("user", users);
		us.change(users);
		return "success";
	}
	public String logout(){
		session.put("user", null);
		return "success";
	}
	public String modifyUserHobby(){
		users=(User) session.get("user");
		ui=us.getUserInfo(users.getId());
		return "success";
	}
	public String saveInfo(){
		ui.setUsers((User)session.get("user"));
		ui.setAge(Integer.parseInt(new Date().toLocaleString().substring(0, 4))-Integer.parseInt(ui.getBirthday().substring(0, 4)));
		us.saveInfo(ui);
		return "success";
	}
	public String getSingleHobby(){
		if(id!=0){
		ui=us.getUserInfo(id);}
		else{
		ui=us.getUserInfo(textss);}
		System.out.println(ui.getUsername());
		return "success";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
}
