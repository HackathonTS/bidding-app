package com.mkyong.web.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
@NamedQueries({
	@NamedQuery(name = "getUserByUserName", query = "from Users u where u.username =:userName") })
public class Users implements Serializable {
	
	private String username;
	
	private String password;
	
	private Set<UserRoute> userRoutes = new HashSet<UserRoute>();
	
	public static final String GET_USER_USERNAME = "getUserByUserName";

	@Id
	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<UserRoute> getUserRoutes() {
		return userRoutes;
	}

	public void setUserRoutes(Set<UserRoute> userRoutes) {
		this.userRoutes = userRoutes;
	}

}
