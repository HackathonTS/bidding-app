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
import javax.persistence.Table;

@Entity
@Table(name = "journey")
public class Journey implements Serializable, Comparable<Journey> {
	
	private Long journeyId;
	
	private UserRoute userRoute;
	
	private Location location;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "journey_id", unique = true, nullable = false)
	public Long getJourneyId() {
		return journeyId;
	}

	public void setJourneyId(Long journeyId) {
		this.journeyId = journeyId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_route_id")
	public UserRoute getUserRoute() {
		return userRoute;
	}

	public void setUserRoute(UserRoute userRoute) {
		this.userRoute = userRoute;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "location_id")
	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	@Override
	public int compareTo(Journey o) {
		if(this.journeyId < o.journeyId){
			return 1;
		}else if(this.journeyId > o.journeyId){
			return -1;
		}
		return 0;
	}

}
