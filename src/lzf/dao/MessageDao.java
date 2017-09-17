package lzf.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import lzf.model.Comment;
import lzf.model.Message;
import lzf.model.User;

@Component("md")
public class MessageDao {
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public ArrayList<Message> getAllMessage(){
		ArrayList<Message>msgs=new ArrayList<Message>();
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Message m order by top_flag, flag ");
		msgs=(ArrayList<Message>) q.list();
		System.out.println("size"+msgs.size());
		return msgs;
	}
	public Message findMessageById(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Message msg=(Message) session.get(Message.class, id);
		return msg;
	}
	public ArrayList<Message> getMyMessage(User user) {
		// TODO Auto-generated method stub
		ArrayList<Message>arr;
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createSQLQuery("select * from Message where user_id="+user.getId()).addEntity(Message.class);
		arr=(ArrayList<Message>) q.list();
		return arr;
	}
	public void delMessage(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();		
		session.createSQLQuery("DELETE from comment where msg_id="+id).executeUpdate();
		session.delete(session.get(Message.class, id));		
	}
	public void topMessage(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Message m=(Message) session.get(Message.class, id);
		if(m.getTop_flag()==1){
			m.setTitle("[¶¥]"+m.getTitle());
			m.setTop_flag(0);
			session.update(m);
		}
		else{
			m.setTitle(m.getTitle().substring(3,m.getTitle().length()));
			m.setTop_flag(1);
			session.update(m);
		}
		
	}
}
