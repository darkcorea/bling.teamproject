package com.project.bling.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.AddrService;
import com.project.bling.vo.Address_listVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Addr")
@Controller
public class AddrController {

	@Autowired
	AddrService addrService;
	
	//주소록 메인 리스트
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model, HttpSession session, int page) throws Exception {
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		
		//페이징
		int count;
		count = addrService.count(midx);
		
		Criteria sc = new Criteria();
		sc.setPerPageNum(5);
		sc.setPage(page);
		
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setTotalCount(count);
		pm.setPidx(midx);
		
		model.addAttribute("list",addrService.list(pm));
		model.addAttribute("one",addrService.one(midx));
		model.addAttribute("page",page);
		model.addAttribute("pm", pm);
		
		return "addr/main";
	}
	
	//주소록 등록
	@RequestMapping(value="/insert.do")
	@ResponseBody
	public void insert(HttpSession session, Address_listVO al,String addr_name,String zip_code
			 ,String addr1,String addr2,String rphone,String name,int basic_addr)throws Exception{
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		//저장할 주소 내용 vo에 삽입
		 al.setMidx(midx);
		 al.setAddr_name(addr_name);
		 al.setName(name);
		 al.setZip_code(zip_code);
		 al.setAddr1(addr1);
		 al.setAddr2(addr2);
		 al.setRphone(rphone);
		 al.setBasic_addr(basic_addr);
		 
		 System.out.println(">>>>>주소이름"+addr_name);
		 
		 
		 if(basic_addr == 1) {
			 addrService.basic(midx);
		 }
		 
		 addrService.insert(al);
	}
	
	//주소록 정보 가져오기
	@RequestMapping(value="/modify.do")
	@ResponseBody
	public Address_listVO modify(Locale locale, Model model,int addr_idx) throws Exception{
		return addrService.modify(addr_idx);
	}
	
	//주소록 수정
	@RequestMapping(value="/Remodify.do")
	public String Remodify(Address_listVO al,int midx,int addr_idx,String addr_name,String zip_code
			 ,String addr1,String addr2,String rphone,String name,int basic_addr)throws Exception{
		 
		al.setAddr_idx(addr_idx);
		al.setAddr_name(addr_name);
		al.setName(name);
		al.setZip_code(zip_code);
		al.setAddr1(addr1);
		al.setAddr2(addr2);
		al.setRphone(rphone);
		al.setBasic_addr(basic_addr);
		 
		if(basic_addr == 1) {
			 addrService.basic(midx);
		 }
		
		addrService.Remodify(al);
		
		return "redirect:/Addr/main.do?page=1";
	}
	
	//주소록 삭제
	@RequestMapping(value="/delete.do")
	public String delete(int addr_idx)throws Exception{
		addrService.delete(addr_idx);
		return "redirect:/Addr/main.do?page=1";
	}
}
