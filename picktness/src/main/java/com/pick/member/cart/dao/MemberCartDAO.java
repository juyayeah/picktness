package com.pick.member.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;
import com.pick.member.cart.vo.MemberCartVO;

@Mapper
@Repository("memberCartDAO")
public interface MemberCartDAO {
	public String findCartGoods(MemberCartVO cartVO) throws DataAccessException;
	public void addCart(MemberCartVO cartVO) throws DataAccessException;
	public List<MemberCartVO> cartList(String member_id) throws DataAccessException;
	public GoodsBusinessVO placeSelectCart(String goods_id) throws DataAccessException;
	public GoodsTrainerVO trainerSelectCart(String goods_id) throws DataAccessException;
	public GoodsShoppingVO shoppingSelectCart(String goods_id) throws DataAccessException;
	public void removeCartGoodS(String goods_id) throws DataAccessException;
	public void updateCartGoods(Map updateMap) throws DataAccessException;
}
