package com.hzyc.shopping.mapper;

import java.util.List;

import com.hzyc.shopping.po.Adv;
import com.hzyc.shopping.po.DGKinds;
import com.hzyc.shopping.po.GKind;
import com.hzyc.shopping.po.Goods;
import com.hzyc.shopping.po.GoodsCar;
import com.hzyc.shopping.po.Page;
import com.hzyc.shopping.po.UserRegister;

//Dao²ã±»Service²ãµ÷ÓÃ
public interface ShoppingMapper {
	
	void insertUserRegister(UserRegister ur);

	//List<UserRegister> queryAll();
	List<GKind> queryGKindAll();
	
	void inertGoods(Goods g);
	void insertGKind(GKind gk);
	void deleteGKind(DGKinds dgk);
	int queryGoodsToatal();
	List<Goods> queryGoodsAll(Page p);
	
	List<Goods> queryGoodsOne(String gId);
	void upadateOne(Goods g);
	void deleteOne(String gId);
	
	void addAdv(Adv adv);
	List<Adv> quertAllAdv(Page p);
	int quertAllAdvToatal();
	void deleteAdvOne(String id);
	void updateAdvInit();
	void updateAdvMark(String id);
	// queryGKindAll
	
	List<Goods> showKindsGood();
	
	Adv showAdv();
	
	UserRegister login(String username);
	
	void addGoodsCar(GoodsCar gc);
	
	List<GoodsCar> queryGoodCar(String username);
	List<GoodsCar> queryGoodCarBygId(String goodId);
	
	void updategcById(GoodsCar gc);
	void deleteGCById(String goodId);
	
	List<GoodsCar> showBuyGoods();
	
}
