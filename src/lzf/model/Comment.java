package lzf.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Comment {
	private int id;
	private String textss;
	private Message msg;
	private User user;
	private String cname;
	private String time;
	public String getCname() {
		return cname;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTextss() {
		return textss;
	}
	public void setTextss(String textss) {
		this.textss = textss;
	}
	@OneToOne(cascade={CascadeType.MERGE},fetch=FetchType.LAZY)
	@JoinColumn(name="msg_id")
	public Message getMsg() {
		return msg;
	}
	public void setMsg(Message msg) {
		this.msg = msg;
	}
	@ManyToOne(cascade={CascadeType.MERGE},fetch=FetchType.LAZY)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
