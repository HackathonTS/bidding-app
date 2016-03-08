package com.emc.web.model;

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
@Table(name = "user_item")
@NamedQueries({ @NamedQuery(name = "getAllUserItems", query = "from UserItem u order by u.userItemId"),
		@NamedQuery(name = "getUserItemById", query = "from UserItem u where u.userItemId =:userItemId"),
		@NamedQuery(name = "getUserItemByItem", query = "from UserItem u where u.item =:item") })
public class UserItem implements Serializable {

	private Long userItemId;

	private String item;

	private Users user;

	private List<BuyerData> buyerDatas = new ArrayList<BuyerData>();

	private List<SellerData> sellerDatas = new ArrayList<SellerData>();

	public static final String GET_ALL_USERROUTES = "getAllUserRoutes";
	public static final String GET_USERITEM_BY_ID = "getUserItemById";
	public static final String GET_USERITEMS_BY_ITEM = "getUserItemByItem";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_item_id", unique = true, nullable = false)
	public Long getUserItemId() {
		return userItemId;
	}

	public void setUserItemId(Long userItemId) {
		this.userItemId = userItemId;
	}

	@Column(name = "item", nullable = false)
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	/*@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username",insertable=false,updatable=false)
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}*/

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "userItem")
	public List<SellerData> getSellerDatas() {
		return sellerDatas;
	}

	public void setSellerDatas(List<SellerData> sellerDatas) {
		this.sellerDatas = sellerDatas;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "userItem")
	public List<BuyerData> getBuyerDatas() {
		return buyerDatas;
	}

	public void setBuyerDatas(List<BuyerData> buyerDatas) {
		this.buyerDatas = buyerDatas;
	}

}
