package com.hzyc.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.shopping.mapper.ShoppingMapper;
import com.hzyc.shopping.po.Adv;
import com.hzyc.shopping.po.DGKinds;
import com.hzyc.shopping.po.GKind;
import com.hzyc.shopping.po.Goods;
import com.hzyc.shopping.po.GoodsCar;
import com.hzyc.shopping.po.Page;
import com.hzyc.shopping.po.UserRegister;

@Service
public class ShoppingService {
	
	//@Autowired表示自动注入、不需要实现get和set
	@Autowired	
	private ShoppingMapper shoppingMapper;
	
	//添加用户，自定义返回值
	public boolean insertUserRegister(UserRegister ur){
		boolean result = false;
		try {
			shoppingMapper.insertUserRegister(ur);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//查询UserRegister表中所有记录
	/*public List<UserRegister> queryAll(){
		return shoppingMapper.queryAll();
	}*/
	public List<GKind> queryGKindAll(){
		return shoppingMapper.queryGKindAll();
	} 
	
	public boolean inertGoods(Goods g){
		boolean result = false;
		try {
			shoppingMapper.inertGoods(g);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean insertGKind(GKind gk){
		boolean result=false;
		try {
			shoppingMapper.insertGKind(gk);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deleteGKind(DGKinds dgk){
		boolean result=false;
		try {
			shoppingMapper.deleteGKind(dgk);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int queryGoodsToatal(){
		int result=0;
		try {
			result=shoppingMapper.queryGoodsToatal();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Goods> queryGoodsAll(Page p){
		return shoppingMapper.queryGoodsAll(p);
	} 

	public List<Goods> queryGoodsOne(String gId){
		return shoppingMapper.queryGoodsOne(gId);
	}
	
	public void upadateOne(Goods g){
		shoppingMapper.upadateOne(g);
	}
	public void deleteOne(String gId){
		shoppingMapper.deleteOne(gId);
	}
	
	public void addAdv(Adv adv){
		shoppingMapper.addAdv(adv);
	}
	
	public List<Adv> quertAllAdv(Page p){
		return shoppingMapper.quertAllAdv(p);
	}
	
	public int quertAllAdvToatal(){
		return shoppingMapper.quertAllAdvToatal();
	}
	public void deleteAdvOne(String id){
		shoppingMapper.deleteAdvOne(id);
	}
	public void updateAdvInit(){
		shoppingMapper.updateAdvInit();
	}
	public void updateAdvMark(String id){
		shoppingMapper.updateAdvMark(id);
	}
	public List<Goods> showKindsGood(){
		return shoppingMapper.showKindsGood();
	}
	
	public Adv showAdv(){
		return shoppingMapper.showAdv();
	}
	
	public UserRegister login(String username){
		return shoppingMapper.login(username); 
	}
	public void addGoodsCar(GoodsCar gc){
		shoppingMapper.addGoodsCar(gc);
	}
	public List<GoodsCar> queryGoodCar(String username){
		return shoppingMapper.queryGoodCar(username);
	}
	public List<GoodsCar> queryGoodCarBygId(String goodId){
		return shoppingMapper.queryGoodCarBygId(goodId);
	}
	public void updategcById(GoodsCar gc){
		shoppingMapper.updategcById(gc);
	}
	public void deleteGCById(String goodId){
		shoppingMapper.deleteGCById(goodId);
	}
	public List<GoodsCar> showBuyGoods(){
		return shoppingMapper.showBuyGoods();
	}
}
