package lzf.model;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class User {
private int id;
private String username;
private String password;
private String role;
private String pic;
//private Set<Message>msg=new HashSet<Message>();



public String getRole() {
	return role;
}
public String getPic() {
	return pic;
}
public void setPic(String pic) {
	this.pic = pic;
}
public void setRole(String role) {
	this.role = role;
}
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getId() {
	return id;
}
//@ManyToMany(cascade={CascadeType.ALL},fetch=FetchType.EAGER)
//@JoinColumn(name="baba_id")
	// @OneToMany(cascade={CascadeType.ALL},fetch=FetchType.EAGER)
	// @JoinColumn(name="baba_id")
	// public Set<Message> getMsg() {
	// return msg;
	// }
	// public void setMsg(Set<Message> msg) {
	// this.msg = msg;
	// }
	public void setId(int id) {
		this.id = id;
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

}
