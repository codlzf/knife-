package lzf.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.sun.mail.handlers.message_rfc822;

import lzf.model.Message;
import lzf.model.RegisterUser;
import lzf.model.User;
import lzf.model.UserInfo;

@Component("ud")
public class UserDao {
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkForLogin(User user){
		Session session = sessionFactory.getCurrentSession();
		Query q=session.createQuery("from User u where u.username=:name and u.password=:pass and u.role=:role")
				.setParameter("name", user.getUsername()).setParameter("pass", user.getPassword()).setParameter("role", user.getRole());
		List<User>li=q.list();	
		if (li.size()==0) {
			return false;
		}
		user.setId(li.get(0).getId());
		user.setPic(li.get(0).getPic());
		return true;
	}
	public boolean checkForRegister(User user){
		Session session = sessionFactory.getCurrentSession();
		Query q=session.createQuery("from User u where u.username=:name")
				.setParameter("name", user.getUsername());
		List<User>li=q.list();
		if (li.size()==0) {
			return false;
		}
		return true;
	}
	public boolean register(RegisterUser user) {
		// TODO Auto-generated method stub
		User u=new User();
		u.setPassword(user.getPassword());
		u.setPic("image/default.jpg");
		u.setUsername(user.getUsername());
		u.setRole("普通用户");
		boolean b=checkForRegister(u);
		if(b){
			return false;
		}
		Session session=sessionFactory.getCurrentSession();
		session.save(u);
		return true;
		
	}
	

	public void saveMessage(Message msg) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createSQLQuery("select min(flag) from Message");
		ArrayList<Integer>arr= (ArrayList<Integer>) q.list();
		if(arr!=null){
		int temp=arr.get(0);
		temp--;
		msg.setFlag(temp);
		}
		session.save(msg);
		
	}
	public void modifyUserInfo(User users) {
		// TODO Auto-generated method stub
		System.out.println("id is "+users.getId());
		Session session = sessionFactory.getCurrentSession();
		User u = (User) session.get(User.class, users.getId());
		if (u != null) {
			System.out.println("good");
			
			session.createSQLQuery("update comment set cname='"+users.getUsername()+"' where user_id="+u.getId()).executeUpdate();
			session.createSQLQuery("update message set leaveUser='"+users.getUsername()+"' where user_id="+u.getId()).executeUpdate();
			u.setUsername(users.getUsername());
			u.setPassword(users.getPassword());
			session.update(u);
		}
	}
	public ArrayList<User> getAllUSer() {
		// TODO Auto-generated method stub
	    Session session=sessionFactory.getCurrentSession();
	    Query q=session.createSQLQuery("select * from user where role ='普通用户'").addEntity(User.class);
		return (ArrayList<User>) q.list();
	}
	public void delUser(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		User u=(User) session.get(User.class, id);
		session.createSQLQuery("delete from comment where user_id="+id).executeUpdate();
		session.createSQLQuery("delete from Message where user_id="+id).executeUpdate();
		session.delete(u);
		
	}
	public void change(User users) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		User u=(User) session.get(User.class, users.getId());
		u.setPic(users.getPic());
		session.update(u);
	}
	public User getUser(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Message m=(Message) session.get(Message.class, id);
		if(m!=null){
		Query q=session.createQuery("from User where username=:name").setParameter("name", m.getLeaveUser());
		return (User) q.list().get(0);}
		return new User();
	}
	public void saveInfo(UserInfo ui) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createSQLQuery("select * from userinfo where user_id="+ui.getUsers().getId()).addEntity(UserInfo.class);
		if(q.list().size()>0){
			System.out.println("uiid:"+ui.getId());
			UserInfo u=(UserInfo) session.get(UserInfo.class, ((UserInfo)(q.list().get(0))).getId());
			u.setUsername(ui.getUsername());
			u.setAge(ui.getAge());
			u.setBirthday(ui.getBirthday());
			u.setCity(ui.getCity());
			u.setHobby(ui.getHobby());
			u.setIntroduce(ui.getIntroduce());
			u.setSex(ui.getSex());
			u.setStar(ui.getStar());
			session.update(u);
			return;
		}
		session.save(ui);
	}
	public UserInfo getUserInfo(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createSQLQuery("select * from userinfo where user_id="+id).addEntity(UserInfo.class);
		if(q.list().size()>0){
		return (UserInfo) q.list().get(0);}
		return new UserInfo();
	}
	public UserInfo getUserInfo(String textss) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createSQLQuery("select * from userinfo where username='"+textss+"'").addEntity(UserInfo.class);
		if(q.list().size()>0){
		return (UserInfo) q.list().get(0);}
		return new UserInfo();
	}
}
