package lzf.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lzf.dao.MessageDao;
import lzf.model.Message;
import lzf.model.User;

@Component("ms")
public class MessageService {
	MessageDao md;
	
	public MessageDao getMd() {
		return md;
	}
	@Resource
	public void setMd(MessageDao md) {
		this.md = md;
	}
	@Transactional
	public ArrayList<Message> getAllMessage(){
		ArrayList<Message>msgs;
		msgs=md.getAllMessage();
		return msgs;
	}
	@Transactional
	public Message findMessageById(int id) {
		// TODO Auto-generated method stub
		return md.findMessageById(id);
	}
	@Transactional
	public ArrayList<Message> getMyMessage(User user) {
		// TODO Auto-generated method stub
		return md.getMyMessage(user);
	}
	@Transactional
	public void delMessage(int id) {
		// TODO Auto-generated method stub
		md.delMessage(id);
	}
	@Transactional
	public void topMessage(int id) {
		// TODO Auto-generated method stub
		md.topMessage(id);
	}
}
