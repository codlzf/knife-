package lzf.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lzf.dao.CommentDao;
import lzf.model.Comment;
import lzf.model.CommentJoinMessage;
import lzf.model.Message;
import lzf.model.ShowComment;
import lzf.model.User;

@Component("cs")
public class CommentService {
	private CommentDao cd;
	
	public CommentDao getCd() {
		return cd;
	}
	@Resource
	public void setCd(CommentDao cd) {
		this.cd = cd;
	}
	@Transactional
	public void saveComment(Comment com, Message msg) {
		// TODO Auto-generated method stub
		cd.saveComment(com,msg);
	}
	@Transactional
	public ArrayList<ShowComment> getAllComments(int id) {
		// TODO Auto-generated method stub
		
		return cd.getAllComments(id);
	}
	@Transactional
	public ArrayList<CommentJoinMessage> getMyComment(User user,int count) {
		// TODO Auto-generated method stub
		return cd.getMyComment(user,count);
	}
	@Transactional
	public void delComment(int id) {
		// TODO Auto-generated method stub
		cd.delComment(id);
	}
	
	@Transactional
	public int getCountNum(int id) {
		// TODO Auto-generated method stub
		return cd.getCountNum(id);
	}

}
