package lzf.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Message {
	private int id;
	private String title;
	private String messages;
	private String time;
	private User users;
	private String leaveUser;
	private int flag=500;
	int top_flag;
	
	
	public int getTop_flag() {
		return top_flag;
	}
	public void setTop_flag(int top_flag) {
		this.top_flag = top_flag;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getLeaveUser() {
		return leaveUser;
	}
	public void setLeaveUser(String leaveUser) {
		this.leaveUser = leaveUser;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@ManyToOne(cascade={CascadeType.MERGE},fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessages() {
		return messages;
	}
	public void setMessages(String messages) {
		this.messages = messages;
	}
	
}
