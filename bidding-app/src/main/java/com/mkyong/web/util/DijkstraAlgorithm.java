package com.mkyong.web.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.mkyong.web.model.Connection;
import com.mkyong.web.model.Location;
import com.mkyong.web.model.RouteMap;

public class DijkstraAlgorithm {

	private final List<Location> nodes;
	  private final List<Connection> Connections;
	  private Set<Location> settledNodes;
	  private Set<Location> unSettledNodes;
	  private Map<Location, Location> predecessors;
	  private Map<Location, Integer> distance;

	  public DijkstraAlgorithm(RouteMap routeMap) {
	    // create a copy of the array so that we can operate on this array
	    this.nodes = new ArrayList<Location>(routeMap.getLocations());
	    this.Connections = new ArrayList<Connection>(routeMap.getConnections());
	  }

	  public void execute(Location source) {
	    settledNodes = new HashSet<Location>();
	    unSettledNodes = new HashSet<Location>();
	    distance = new HashMap<Location, Integer>();
	    predecessors = new HashMap<Location, Location>();
	    distance.put(source, 0);
	    unSettledNodes.add(source);
	    while (unSettledNodes.size() > 0) {
	      Location node = getMinimum(unSettledNodes);
	      settledNodes.add(node);
	      unSettledNodes.remove(node);
	      findMinimalDistances(node);
	    }
	  }

	  private void findMinimalDistances(Location node) {
	    List<Location> adjacentNodes = getNeighbors(node);
	    for (Location target : adjacentNodes) {
	      if (getShortestDistance(target) > getShortestDistance(node)
	          + getDistance(node, target)) {
	        distance.put(target, getShortestDistance(node)
	            + getDistance(node, target));
	        predecessors.put(target, node);
	        unSettledNodes.add(target);
	      }
	    }

	  }

	  private int getDistance(Location node, Location target) {
	    for (Connection Connection : Connections) {
	      if (Connection.getSource().equals(node)
	          && Connection.getDestination().equals(target)) {
	        return Connection.getTime().intValue();
	      }
	    }
	    throw new RuntimeException("Should not happen");
	  }

	  private List<Location> getNeighbors(Location node) {
	    List<Location> neighbors = new ArrayList<Location>();
	    for (Connection Connection : Connections) {
	      if (Connection.getSource().equals(node)
	          && !isSettled(Connection.getDestination())) {
	        neighbors.add(Connection.getDestination());
	      }
	    }
	    return neighbors;
	  }

	  private Location getMinimum(Set<Location> Locationes) {
	    Location minimum = null;
	    for (Location Location : Locationes) {
	      if (minimum == null) {
	        minimum = Location;
	      } else {
	        if (getShortestDistance(Location) < getShortestDistance(minimum)) {
	          minimum = Location;
	        }
	      }
	    }
	    return minimum;
	  }

	  private boolean isSettled(Location Location) {
	    return settledNodes.contains(Location);
	  }

	  private int getShortestDistance(Location destination) {
	    Integer d = distance.get(destination);
	    if (d == null) {
	      return Integer.MAX_VALUE;
	    } else {
	      return d;
	    }
	  }

	  /*
	   * This method returns the path from the source to the selected target and
	   * NULL if no path exists
	   */
	  public LinkedList<Location> getPath(Location target) {
	    LinkedList<Location> path = new LinkedList<Location>();
	    Location step = target;
	    // check if a path exists
	    if (predecessors.get(step) == null) {
	      return null;
	    }
	    path.add(step);
	    while (predecessors.get(step) != null) {
	      step = predecessors.get(step);
	      path.add(step);
	    }
	    // Put it into the correct order
	    Collections.reverse(path);
	    return path;
	  }
	
}
