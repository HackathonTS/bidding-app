package com.mkyong.web.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "location")
@NamedQueries({
	@NamedQuery(name = "getAllLocations", query = "from Location"),
	@NamedQuery(name = "getLocationByName", query = "from Location l where l.name =:name") })
public class Location implements Serializable {
	
	private Long locationId;
	private String name;
	
	public static final String GET_ALL_LOCATIONS = "getAllLocations";
	
	public static final String GET_LOCATION_BY_NAME = "getLocationByName";
	
	@Column(name = "name", nullable = true, length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "location_id", unique = true, nullable = false)
	public Long getLocationId() {
		return locationId;
	}
	public void setLocationId(Long locationId) {
		this.locationId = locationId;
	}

	@Override
	  public int hashCode() {
	    final int prime = 31;
	    int result = 1;
	    result = prime * result + ((locationId == null) ? 0 : locationId.hashCode());
	    return result;
	  }
	  
	  @Override
	  public boolean equals(Object obj) {
	    if (this == obj)
	      return true;
	    if (obj == null)
	      return false;
	    if (getClass() != obj.getClass())
	      return false;
	    Location other = (Location) obj;
	    if (locationId == null) {
	      if (other.locationId != null)
	        return false;
	    } else if (!locationId.equals(other.locationId))
	      return false;
	    return true;
	  }

	  @Override
	  public String toString() {
	    return name;
	  }
	
}
