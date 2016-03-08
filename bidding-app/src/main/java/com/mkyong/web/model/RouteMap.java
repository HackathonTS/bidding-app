package com.mkyong.web.model;

import java.util.List;

public class RouteMap {

	private final List<Connection> connections;
	private final List<Location> locations;
	
	public RouteMap(List<Connection> connections, List<Location> locations) {
	    this.connections = connections;
	    this.locations = locations;
	 }
	
	public List<Connection> getConnections() {
		return connections;
	}
	public List<Location> getLocations() {
		return locations;
	}
	
	
}
