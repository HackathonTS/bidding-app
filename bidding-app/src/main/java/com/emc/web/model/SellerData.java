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
@Table(name = "seller_data")
@NamedQueries({ @NamedQuery(name = "getAllSellerDatas", query = "from SellerData"),
		@NamedQuery(name = "getSellerByName", query = "from SellerData b where b.name =:name") })
public class SellerData implements Serializable {

	private Long sellerDataId;

	private String name;

	private Long userItemId;

	private UserItem userItem;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_item_id", insertable=false, updatable=false)
	public UserItem getUserItem() {
		return userItem;
	}

	public void setUserItem(UserItem userItem) {
		this.userItem = userItem;
	}

	private Long sellerPrice;

	public static final String GET_ALL_BUYER_DATAS = "getAllSellerDatas";

	public static final String GET_BUYER_BY_NAME = "getSellerByName";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "seller_data_id", unique = true, nullable = false)
	public Long getSellerDataId() {
		return sellerDataId;
	}

	public void setSellerDataId(Long sellerDataId) {
		this.sellerDataId = sellerDataId;
	}

	@Column(name = "price", nullable = false)
	public Long getSellerPrice() {
		return sellerPrice;
	}

	public void setSellerPrice(Long sellerPrice) {
		this.sellerPrice = sellerPrice;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((sellerDataId == null) ? 0 : sellerDataId.hashCode());
		result = prime * result + ((sellerPrice == null) ? 0 : sellerPrice.hashCode());
		result = prime * result + ((userItemId == null) ? 0 : userItemId.hashCode());
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
		SellerData other = (SellerData) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (sellerDataId == null) {
			if (other.sellerDataId != null)
				return false;
		} else if (!sellerDataId.equals(other.sellerDataId))
			return false;
		if (sellerPrice == null) {
			if (other.sellerPrice != null)
				return false;
		} else if (!sellerPrice.equals(other.sellerPrice))
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
