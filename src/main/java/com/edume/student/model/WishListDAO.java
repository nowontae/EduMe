package com.edume.student.model;

import java.util.List;

public interface WishListDAO {
	public List getWishList(int midx);
	public int addWishList(int midx, int lidx);
}
