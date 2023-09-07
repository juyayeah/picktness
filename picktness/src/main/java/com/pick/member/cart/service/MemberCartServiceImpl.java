package com.pick.member.cart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;
import com.pick.member.cart.dao.MemberCartDAO;
import com.pick.member.cart.vo.MemberCartVO;

@Service("memberCartService")
public class MemberCartServiceImpl implements MemberCartService{
	@Autowired
	MemberCartDAO memberCartDAO;
	
	@Override
	public boolean findCartGoods(MemberCartVO cartVO) throws DataAccessException {
		// TODO Auto-generated method stub
		String result = memberCartDAO.findCartGoods(cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void addCart(MemberCartVO cartVO) throws DataAccessException {
		// TODO Auto-generated method stub
		memberCartDAO.addCart(cartVO);
	}

	@Override
	public Map<String, List> cartList(String member_id) throws DataAccessException {
		Map<String, List> cartMap = new HashMap<String, List>();
		List<MemberCartVO> myCartList = memberCartDAO.cartList(member_id);
		if(myCartList.size() == 0) {
			return null;
		} else {
			List<GoodsBusinessVO> businessList = new ArrayList<GoodsBusinessVO>();
			List<GoodsTrainerVO> trainerList = new ArrayList<GoodsTrainerVO>();
			List<GoodsShoppingVO> shoppingList = new ArrayList<GoodsShoppingVO>();
			for(int i=0; i<myCartList.size(); i++) {
				String goods_id = myCartList.get(i).getGoods_id();
				if(goods_id.contains("pc")) {
					businessList.add(memberCartDAO.placeSelectCart(goods_id));
				} else if(goods_id.contains("tr")) {
					trainerList.add(memberCartDAO.trainerSelectCart(goods_id));
				} else {
					shoppingList.add(memberCartDAO.shoppingSelectCart(goods_id));
				}
			}
			cartMap.put("myCartList", myCartList);
			cartMap.put("businessList", businessList);
			cartMap.put("trainerList", trainerList);
			cartMap.put("shoppingList", shoppingList);
			return cartMap;
		}
	}

	@Override
	public void removeCartGoods(String cart_id) throws DataAccessException {
		memberCartDAO.removeCartGoods(cart_id);
		
	}

	@Override
	public void updateCartGoods(Map updateMap) throws DataAccessException {
		memberCartDAO.updateCartGoods(updateMap);
		
	}
	
	
	
	



	
	
	
}
