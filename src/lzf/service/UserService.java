package lzf.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lzf.dao.UserDao;
import lzf.model.Message;
import lzf.model.RegisterUser;
import lzf.model.User;
import lzf.model.UserInfo;

@Component("us")
public class UserService {
	private UserDao ud;
	
	public UserDao getUd() {
		return ud;
	}
	@Resource
	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	@Transactional
	public boolean checkForLogin(User user){
		return ud.checkForLogin(user);
	}
	@Transactional
	public boolean registerUser(RegisterUser ruser){
		return ud.register(ruser);
	}
	@Transactional
	public void saveMessage(Message msg) {
		// TODO Auto-generated method stub
		ud.saveMessage(msg);
	}
	@Transactional
	public void modifyUserInfo(User users) {
		// TODO Auto-generated method stub
		ud.modifyUserInfo(users);
	}
	@Transactional
	public ArrayList<User> getAllUser() {
		// TODO Auto-generated method stub
		return ud.getAllUSer();
	}
	@Transactional
	public void delUser(int id) {
		// TODO Auto-generated method stub
		ud.delUser(id);
	}
	@Transactional
	public void change(User users) {
		// TODO Auto-generated method stub
		ud.change(users);
	}
	@Transactional
	public User getUser(int id) {
		// TODO Auto-generated method stub
		return ud.getUser(id);
	}
	@Transactional
	public void saveInfo(UserInfo ui) {
		// TODO Auto-generated method stub
		ud.saveInfo(ui);
	}
	@Transactional
	public UserInfo getUserInfo(int id) {
		// TODO Auto-generated method stub
		return ud.getUserInfo(id);
	}
	@Transactional
	public UserInfo getUserInfo(String textss) {
		// TODO Auto-generated method stub
		return ud.getUserInfo(textss);
	}
}
