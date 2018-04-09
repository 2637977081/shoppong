package com.hzyc.shopping.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hzyc.shopping.po.Adv;
import com.hzyc.shopping.po.DGKinds;
import com.hzyc.shopping.po.GKind;
import com.hzyc.shopping.po.Goods;
import com.hzyc.shopping.po.GoodsCar;
import com.hzyc.shopping.po.Page;
import com.hzyc.shopping.po.UserRegister;
import com.hzyc.shopping.service.ShoppingService;

@Controller
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private Page page;
	@Autowired
	private Page ap;
	
	private int point=1;
	
	@RequestMapping("/newUs.do")
	public ModelAndView newUs(UserRegister ur){
		//System.out.println("!!!!!!!!!!");
		ModelAndView modelAndView = new ModelAndView();
		boolean result = shoppingService.insertUserRegister(ur);
		if(result){
			//List<UserRegister> urList = shoppingService.queryAll();
			//modelAndView.addObject("urList",urList);
			modelAndView.setViewName("index.jsp");
		}
		return modelAndView;
		
	}
	
	@RequestMapping("/queryGKindAll.do")
	public void queryGKindAll(HttpServletResponse response){
		//System.out.println("77777");
		List<GKind> gKindList = shoppingService.queryGKindAll();
		
		//jSon
		try {
			response.setHeader("Content-Type", "text/html; charset=utf-8");//设置http头 编码格式
			PrintWriter out = response.getWriter();//声明一个输出流
			
			Gson g = new Gson();
			
			out.print(g.toJson(gKindList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*if(!gKindList.isEmpty()){
			modelAndView.addObject("gKindList",gKindList);
		}*/
		
		
	}

	@RequestMapping("/addGoods.do")
	public String inertGoods(HttpServletRequest request,Goods g,MultipartFile gImgFile){
		try {
			point=1;
			
			String gImg = gImgFile.getOriginalFilename();
			g.setgImg(gImg);
			System.out.print(gImg+"---------------------------");
			String tomcatPath = request.getSession().getServletContext().getRealPath("/images");
			File file = new File(tomcatPath+"/"+gImg);
 			gImgFile.transferTo(file);
 			
 			boolean result = shoppingService.inertGoods(g);
 			if(result){
 				return "addGoods.jsp";
 			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success.jsp";
	}
	
	@RequestMapping("/addGKind.do")
	public ModelAndView insertGKind(GKind gk){
		point = 2;
		ModelAndView modelAndView = new ModelAndView();
		boolean result = shoppingService.insertGKind(gk);
		if(result){
			//List<UserRegister> urList = shoppingService.queryAll();
			//modelAndView.addObject("urList",urList);
			modelAndView.setViewName("addGoods.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping("/deleteGKind.do")
	public ModelAndView deleteGKind(DGKinds dgk){
		point = 2;
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(dgk.getdKind()+"-------------");
		boolean result = shoppingService.deleteGKind(dgk);
		if(result){
			//List<UserRegister> urList = shoppingService.queryAll();
			//modelAndView.addObject("urList",urList);
			modelAndView.setViewName("addGoods.jsp");
		}
		return modelAndView;
		
	}
	
	
	
	@RequestMapping("/queryGoodsAll.do")
	public ModelAndView queryGoodsAll(HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView();
		try {
			point = 3;
			System.out.println("��queryGoodsAll.do");
			//����position
			int t = shoppingService.queryGoodsToatal();
			System.out.println(t+"sql����");
			page.setTotal(t);
			page.setSize(7);
			page.calculatePosition();
			
			List<Goods> gList = shoppingService.queryGoodsAll(page);
			
			System.out.println("��Ʒ��Ϣ"+gList.size());
			for(Goods value:gList){
				System.out.println(value);
			}
			modelAndView.addObject("Page", page);
			modelAndView.addObject("gList" ,gList);
			modelAndView.setViewName("addGoods.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping("/pageUp.do")
	public String toUp(int nowPage){
		page.pageUp(nowPage);
		
		return "queryGoodsAll.do";
	}
	
	@RequestMapping("/pageDown.do")
	public String toDown(int nowPage){
		page.pageDown(nowPage);
		
		return "queryGoodsAll.do";
		
	}
	
	@RequestMapping("/total.do")
	public void queryGoodsToatal(HttpServletResponse response){
		try {
			int t = page.getCurrentPage();
			System.out.println(t+"*��total.do****");
			Gson g = new Gson();
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(g.toJson(t));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/AddGoodsFunction.do")
	public void agFunction(HttpServletResponse response){
		try {
			System.out.println(point+"#####����######");
			Gson g = new Gson();	
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(g.toJson(point));
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/QuerryOne.do")
	public ModelAndView queryGoodsOne(String gId){
		ModelAndView modelAndView = new ModelAndView();
		point=1;
		try {
			System.err.println("��QuerryOne.do");
			List<Goods> gListOne=shoppingService.queryGoodsOne(gId);
			for(Goods value:gListOne){
				System.err.println(value+"&&&&&");
			}
			modelAndView.addObject("gListOne" ,gListOne);
			modelAndView.setViewName("addGoods.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping("/upadateOne.do")
	public String upadateOne(String[] Map){
		try {
			point=1;
			System.out.println("����һ��upadateOne.do");
			for(int i=0;i<Map.length;i++){
				System.out.println(i+"---"+Map[i]);
			}
			
			Goods gOne = new Goods();
			System.err.println("----------"+Map[3]);
			gOne.setgId(Map[0]);
			gOne.setgName(Map[1]);
			gOne.setDiscount(Map[5]);
			gOne.setgBusiness(Map[6]);
			gOne.setgImg(Map[7]);
			gOne.setgKind(Map[2]);
			gOne.setgNumber(Map[3]);
			gOne.setgPrice(Map[4]);
			
			shoppingService.upadateOne(gOne);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "addGoods.jsp";
	}
	
	@RequestMapping("/deleteOne.do")
	public String deleteOne(String gId){
		point=3;
		try {
			System.out.println("��ת��deleteOne---"+gId);
			shoppingService.deleteOne(gId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addGoods.jsp";
	}
	
	@RequestMapping("/addAdv.do")
	public String addAdv(String path){
		point = 4;
		try {
			System.out.println("��ת��addAdv---"+path);
			Adv adv = new Adv();
			adv.setPath(path);
			shoppingService.addAdv(adv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addGoods.jsp";
	}
	
	@RequestMapping("queryAllAdv.do")
	public ModelAndView quertAllAdv(){
		ModelAndView modelAndView = new ModelAndView();
		point=4;
		try {
			System.out.println("��ת��queryAllAdv.do");
			int t=shoppingService.quertAllAdvToatal();
			ap.setTotal(t);
			ap.setSize(4);
			ap.calculatePosition();
			
			List<Adv> aAList = shoppingService.quertAllAdv(ap);
			for(Adv value:aAList){
				System.out.println(value+"******");
			}
			System.out.println("ҳ��"+ap.getCurrentPage());
			modelAndView.addObject("aAList", aAList);
			modelAndView.addObject("ap", ap);
			
			modelAndView.setViewName("addGoods.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping("/advPageUp.do")
	public String advPageUp(int nowPage){
		ap.pageUp(nowPage);
		
		return "queryAllAdv.do";
	}
	
	@RequestMapping("/advPageDown.do")
	public String advPageDown(int nowPage){
		ap.pageDown(nowPage);
		
		return "queryAllAdv.do";
		
	}
	
	@RequestMapping("/deleteAdvOne.do")
	public String deleteAdvOne(String id){
		point=4;
		try {
			System.out.println("deleteAdvOne.do----"+id);
			shoppingService.deleteAdvOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addGoods.jsp";
	} 
	
	@RequestMapping("/markAdv.do")
	public String markAdv(String id){
		point=4;
		try {
			System.out.println("markAdv.do---"+id);
			shoppingService.updateAdvInit();
			shoppingService.updateAdvMark(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addGoods.jsp";
	}
	
	@RequestMapping("/getInfoKindtoMark.do")
	public ModelAndView getInfoKindtoMark(){
		ModelAndView modelAndView = new ModelAndView();
		try {
			System.out.println("��getInfoKindtoMark.do");
		  	List<GKind> gKList= shoppingService.queryGKindAll();
		  	List<Goods> gList = shoppingService.showKindsGood();
		  	Adv adv = shoppingService.showAdv();
		  	
			for(GKind value:gKList){
				System.out.println(value+"---����");
			}
			for(Goods value:gList){
				System.out.println(value+"---��Ʒ");
			}
			
			modelAndView.addObject("gList",gList);
			modelAndView.addObject("gKList",gKList);
			modelAndView.addObject("adv",adv);
			
			modelAndView.setViewName("market.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
	
	@RequestMapping("/login.do")
	public String login(String username,String password,HttpSession session){
		
		try {
			UserRegister ur = new UserRegister();
			session.setAttribute("username", username);
			System.out.println("��login.do"+username+"---"+password);
			ur=shoppingService.login(username);
			System.out.println("-------"+ur.getPassword()+"------"+password);
			if(ur.getPassword().equals(password)){
				System.out.println(ur.getIndentity());
				if("������Ա".equals(ur.getIndentity())){
					return "addGoods.jsp";
				}else if("�û�".equals(ur.getIndentity())){
					return "market.jsp";
				}
					
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "index.jsp";
	}
	
	@RequestMapping("/addGoodCars.do")
	public String addGoodCars(String goodOneId,String username){
		try {
			System.out.println("��addGoodCars.do***"+goodOneId+"***user:"+username);
			System.out.println("-----***********-----");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(username+"-#-"+goodOneId);
		String url = "queryGoodCar.do?username="+username+"&goodOneId="+goodOneId;
		System.out.println(url+"%%%%");
		return url;
	}
	
	@RequestMapping("/queryGoodCar.do")
	public ModelAndView queryGoodCar(String username,String goodOneId){
		
		System.out.println("��queryGoodCar.do---�û�--"+username+"��Ʒ"+goodOneId);
		ModelAndView modelAndView = new ModelAndView();
		try {
			
			username = username.split(",")[0];
			goodOneId = goodOneId.split(",")[0];
			System.out.println("�û�--"+username+"��Ʒ"+goodOneId);
			
			List<GoodsCar> gcLitsQ = shoppingService.queryGoodCarBygId(goodOneId);
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println("��ѯ"+goodOneId+"�Ƿ����");
			for(GoodsCar value:gcLitsQ){
				System.out.println("*****"+value);
			}
			
			GoodsCar gc = new GoodsCar();
			if(gcLitsQ.isEmpty()){
				System.out.println("���");
				gc.setGoodId(goodOneId);
				gc.setUserName(username);
				
				shoppingService.addGoodsCar(gc);
			}else{
				System.out.println("���и���Ʒ������+1");
				gc = gcLitsQ.get(0);
				int number = Integer.parseInt(gc.getNumber())+1;
				gc.setNumber(""+number);
				//gc.setMark("0");
				shoppingService.updategcById(gc);
			}
			System.out.println("��ѯ���û�MarkΪ0����Ʒ");
			List<GoodsCar>	gcList=shoppingService.queryGoodCar(username);
			List<Goods> gList = new ArrayList<Goods>();
			for(int i =0;i<gcList.size();i++){
				
				String id=gcList.get(i).getGoodId();
				String mark=gcList.get(i).getMark();
				System.out.println(mark+"mark��ֵ");
				List<Goods> gOneList=shoppingService.queryGoodsOne(id); 
				gList.add(gOneList.get(0));
			}
			for(Goods value:gList){
				System.out.println(value+"------");
			}
			modelAndView.addObject("gcList", gcList);
			modelAndView.addObject("gList", gList);
			modelAndView.addObject("username",username);
			
			modelAndView.setViewName("goodCar.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
	
	@RequestMapping("/deleteGCById.do")
	public String deleteGCById(String goodId){
		try {
			System.out.println("��deleteGCById--------"+goodId);
			shoppingService.deleteGCById(goodId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "goodCar.jsp";
	}
	
	@RequestMapping("/accounts.do")
	public ModelAndView accounts(String gIdArray,String numberArrary,String moneyArray,String username){
		ModelAndView modelAndView = new ModelAndView();
		try {
			System.out.println("����accounts.do---"+gIdArray+"###"+numberArrary+"$$$"+moneyArray);
			String[] gId = gIdArray.split(",");
			String[] number = numberArrary.split(",");
			String[] money = moneyArray.split(",");
			
			double totalMoney = 0;
			
			for(int i=0;i<gId.length;i++){
				System.out.println(gId[i]+"��Ʒnum"+number[i]);
				GoodsCar gc = new GoodsCar();
				gc.setGoodId(gId[i]);
				gc.setNumber(number[i]);
				gc.setMoney(money[i]);
				gc.setMark("1");
				shoppingService.updategcById(gc);
				
				totalMoney+= Double.parseDouble(money[i]);
			}
			
			modelAndView.addObject("username", username);
			modelAndView.addObject("totalMoney", totalMoney);
			
			modelAndView.setViewName("Success.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
		
	}
	
	
	@RequestMapping("/showBuyGoods.do")
	public ModelAndView showBuyGoods(){
		ModelAndView modelAndView = new ModelAndView();
		point=5;
		try {
			System.out.println("��ת��showBuyGoods.do");
			List<GoodsCar>	gcList=shoppingService.showBuyGoods();
			
			for(GoodsCar value:gcList){
				System.out.println(value+"-----");
			}
			modelAndView.addObject("gcList",gcList);
			
			modelAndView.setViewName("addGoods.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
	
	@RequestMapping("usNew.do")
	public  void usNew(String username,HttpServletRequest request, HttpServletResponse response){
		int mark = 1;
		try {
			System.out.println("��usNew.do-----"+username);
			UserRegister ur=shoppingService.login(username);
			if(ur == null){
				mark=0;
			}
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			Gson g = new Gson();
			
			out.print(g.toJson(mark));
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
