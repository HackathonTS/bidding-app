package com.mkyong.web.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.emc.web.model.BuyerData;
import com.emc.web.model.SellerData;
import com.emc.web.model.UserItem;
import com.mkyong.web.model.Connection;
import com.mkyong.web.model.Journey;
import com.mkyong.web.model.Location;
import com.mkyong.web.model.UserRoute;
import com.mkyong.web.model.Users;

@Repository(value = "mainDAO")
public class MainDAO {

	@Autowired
	@Qualifier("mainServiceSessionFactory")
	private SessionFactory sessionFactory;

	Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public List<Location> getAllLocations() {
		final Query query = getSession().getNamedQuery(Location.GET_ALL_LOCATIONS);
		return query.list();
	}

	public Location getLocationByName(String name) {
		final Query query = getSession().getNamedQuery(Location.GET_LOCATION_BY_NAME).setParameter("name", name);
		return (Location) query.list().get(0);
	}

	public List<Connection> getAllConnections() {
		final Query query = getSession().getNamedQuery(Connection.GET_ALL_CONNECTIONS);
		return query.list();
	}

	public Users getUserByUserName(String userName) {
		final Query query = getSession().getNamedQuery(Users.GET_USER_USERNAME).setParameter("userName", userName);
		return (Users) query.list().get(0);
	}

	public Long saveUserRoute(UserRoute route) {
		return (Long) getSession().save(route);
	}

	public void saveJourney(Journey journey) {
		getSession().save(journey);
	}

	public List<UserRoute> getAllUserRoute() {
		final Query query = getSession().getNamedQuery(UserRoute.GET_ALL_USERROUTES);
		return query.list();
	}

	public SellerData saveSellerData(SellerData sellerData) {
		return (SellerData) getSession().merge(sellerData);
	}

	public UserItem saveUserItem(UserItem userItem) {
		return (UserItem) getSession().merge(userItem);
	}

	public BuyerData saveBuyerData(BuyerData buyerData) {
		return (BuyerData) getSession().merge(buyerData);
	}

	public com.emc.web.model.Users getBidUserByUserName(String userName) {
		final Query query = getSession().getNamedQuery(com.emc.web.model.Users.GET_USER_USERNAME)
				.setParameter("userName", userName);
		return (com.emc.web.model.Users) query.list().get(0);
	}

	public UserItem getUserItemById(Long itemId) {
		final Query query = getSession().getNamedQuery(UserItem.GET_USERITEM_BY_ID).setParameter("userItemId", itemId);
		return (UserItem) query.list().get(0);
	}

	public UserItem getUserItemByItem(String item) {
		final Query query = getSession().getNamedQuery(UserItem.GET_USERITEMS_BY_ITEM).setParameter("item", item);
		return (UserItem) query.list().get(0);
	}

}
