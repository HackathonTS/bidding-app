package com.emc.web.model;

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
@Table(name = "buyer_data")
@NamedQueries({
		@NamedQuery(name = "getAllBuyerDatas", query = "from BuyerData"),
		@NamedQuery(name = "getBuyerByName", query = "from BuyerData b where b.name =:name") })
public class BuyerData implements Serializable {

	private Long buyerDataId;
	private String name;

	private Long userItemId;

	private Long buyerPrice;

	public static final String GET_ALL_BUYER_DATAS = "getAllBuyerDatas";

	public static final String GET_BUYER_BY_NAME = "getBuyerByName";

	private UserItem userItem;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_item_id", insertable = false, updatable = false)
	public UserItem getUserItem() {
		return userItem;
	}

	public void setUserItem(UserItem userItem) {
		this.userItem = userItem;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "buyer_data_id", unique = true, nullable = false)
	public Long getBuyerDataId() {
		return buyerDataId;
	}

	public void setBuyerDataId(Long buyerDataId) {
		this.buyerDataId = buyerDataId;
	}

	@Column(name = "username", nullable = true, length = 100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "user_item_id", nullable = false)
	public Long getUserItemId() {
		return userItemId;
	}

	public void setUserItemId(Long userItemId) {
		this.userItemId = userItemId;
	}

	@Column(name = "price", nullable = false)
	public Long getBuyerPrice() {
		return buyerPrice;
	}

	public void setBuyerPrice(Long buyerPrice) {
		this.buyerPrice = buyerPrice;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((buyerDataId == null) ? 0 : buyerDataId.hashCode());
		result = prime * result
				+ ((buyerPrice == null) ? 0 : buyerPrice.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((userItemId == null) ? 0 : userItemId.hashCode());
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
		BuyerData other = (BuyerData) obj;
		if (buyerDataId == null) {
			if (other.buyerDataId != null)
				return false;
		} else if (!buyerDataId.equals(other.buyerDataId))
			return false;
		if (buyerPrice == null) {
			if (other.buyerPrice != null)
				return false;
		} else if (!buyerPrice.equals(other.buyerPrice))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (userItemId == null) {
			if (other.userItemId != null)
				return false;
		} else if (!userItemId.equals(other.userItemId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return name;
	}

}
