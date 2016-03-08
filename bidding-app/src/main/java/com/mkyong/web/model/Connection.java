package com.mkyong.web.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="connection")
@NamedQueries({
	@NamedQuery(name = "getAllConnections", query = "from Connection") })
public class Connection implements Serializable {
	
	private Long connectionId;
	
	private Location source;
	private Location destination;
	private Long time;
	
	public static final String GET_ALL_CONNECTIONS = "getAllConnections";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "connection_id", unique = true, nullable = false)
	public Long getConnectionId() {
		return connectionId;
	}
	public void setConnectionId(Long connectionId) {
		this.connectionId = connectionId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "location1_id", nullable = false, insertable = false, updatable = false)
	public Location getSource() {
		return source;
	}
	public void setSource(Location source) {
		this.source = source;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "location2_id", nullable = false, insertable = false, updatable = false)
	public Location getDestination() {
		return destination;
	}
	public void setDestination(Location destination) {
		this.destination = destination;
	}
	
	@Column(name = "time")
	public Long getTime() {
		return time;
	}
	public void setTime(Long time) {
		this.time = time;
	}
	
	@Override
	  public String toString() {
	    return source + " " + destination;
	  }

}
