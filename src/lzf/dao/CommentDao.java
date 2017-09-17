package lzf.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import lzf.model.Comment;
import lzf.model.CommentJoinMessage;
import lzf.model.Message;
import lzf.model.ShowComment;
import lzf.model.User;

@Component("cd")
public class CommentDao {
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void saveComment(Comment com, Message msg) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createSQLQuery("select min(flag) from Message");
		ArrayList<Integer> arr = (ArrayList<Integer>) q.list();
		if (arr != null) {
			int temp = arr.get(0);
			temp--;
			Message msgs = (Message) session.get(Message.class, msg.getId());
			msgs.setFlag(temp);
		}

		session.save(com);
	}

	public ArrayList<ShowComment> getAllComments(int id) {
		// TODO Auto-generated method stub
		ArrayList<ShowComment>arr=new ArrayList<ShowComment>();
		Session session = sessionFactory.getCurrentSession();
		//Query q = session.createSQLQuery("select * from comment where msg_id=" + id).addEntity(Comment.class);
		Query q = session
				.createSQLQuery("select c.textss," + "c.time,c.cname,u.pic from user u join comment c "
						+ "on u.id=c.user_id where c.msg_id=" + id+" order by c.time" );
		List<Object[]> li = q.list();
		for (Object[] obj : li) {
			if (obj.length <= 0) {
				break;
			}
			ShowComment sc=new ShowComment();
			sc.setTextss(obj[0].toString());
			sc.setTime(obj[1].toString());
			sc.setCname(obj[2].toString());
			sc.setPic(obj[3].toString());
			arr.add(sc);
		}
		return arr;
	}

	public ArrayList<CommentJoinMessage> getMyComment(User user, int count) {
		// TODO Auto-generated method stub
		ArrayList<CommentJoinMessage> arr = new ArrayList<CommentJoinMessage>();
		Session session = sessionFactory.getCurrentSession();
		Query q = session
				.createSQLQuery("select m.title,c.textss," + "c.time,m.id,c.id as id1 from message m join comment c "
						+ "on m.id=c.msg_id where c.user_id=" + user.getId() + " limit " + count * 10 + ", 10");
		List<Object[]> li = q.list();
		for (Object[] obj : li) {
			if (obj.length <= 0) {
				break;
			}
			CommentJoinMessage cjm = new CommentJoinMessage();
			cjm.setMessageTitle(obj[0].toString());
			cjm.setComment(obj[1].toString());
			cjm.setTime(obj[2].toString());
			cjm.setMessageId((Integer) obj[3]);
			cjm.setCommentId((Integer) obj[4]);
			arr.add(cjm);
		}
		return arr;
	}

	public void delComment(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Comment c = (Comment) session.load(Comment.class, id);
		// c=null;
		session.delete(c);
	}

	public int getCountNum(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createSQLQuery("select * from comment where user_id=" + id).addEntity(Comment.class);

		return q.list().size();
	}

}
