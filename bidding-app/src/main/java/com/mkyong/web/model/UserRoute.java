package com.mkyong.web.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user_route")
@NamedQueries({
	@NamedQuery(name = "getAllUserRoutes", query = "from UserRoute u order by u.userRouteId") })
public class UserRoute implements Serializable {
	
	private Long userRouteId;
	
	private Users user;
	
	private Long sourceId;
	
	private Long destinationId;
	
	private Location source;
	
	private Location destination;
	
	private List<Journey> journeys = new ArrayList<Journey>();
	
	public static final String GET_ALL_USERROUTES = "getAllUserRoutes";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_route_id", unique = true, nullable = false)
	public Long getUserRouteId() {
		return userRouteId;
	}

	public void setUserRouteId(Long userRouteId) {
		this.userRouteId = userRouteId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "username")
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	@Column(name = "route_source_id", nullable = false)
	public Long getSourceId() {
		return sourceId;
	}

	public void setSourceId(Long sourceId) {
		this.sourceId = sourceId;
	}

	@Column(name = "route_destination_id", nullable = false)
	public Long getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(Long destinationId) {
		this.destinationId = destinationId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "route_source_id", insertable = false, updatable = false)
	public Location getSource() {
		return source;
	}

	public void setSource(Location source) {
		this.source = source;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "route_destination_id", insertable = false, updatable = false)
	public Location getDestination() {
		return destination;
	}

	public void setDestination(Location destination) {
		this.destination = destination;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userRoute")
	public List<Journey> getJourneys() {
		return journeys;
	}

	public void setJourneys(List<Journey> journeys) {
		this.journeys = journeys;
	}

}
