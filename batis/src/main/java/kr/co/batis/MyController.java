package kr.co.batis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@Autowired
	SqlSession sqlsession;

	@RequestMapping("/")
	public String home() {
		MyDao mdao = sqlsession.getMapper(MyDao.class);
		return "redirect:/list";
	}

	@RequestMapping("/write")
	public String write() {
		return "/write";
	}

	@RequestMapping("/writeOk")
	public String writeOk(MyDto mydto) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		mdao.insert(mydto);

		return "/list";
	}

	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		int page = 1;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));

		int rec = 10;
		if (request.getParameter("rec") != null)
			rec = Integer.parseInt(request.getParameter("rec"));

		int index;

		index = (page - 1) * rec;

		int pstart, pend;

		pstart = page / 10;
		if (page % 10 == 0) {
			pstart = pstart - 1;
		}
		pstart = pstart * 10 + 1;
		pend = pstart + 9;

		ArrayList<MyDto> list = mdao.list(index, rec);
		int chong = mdao.chong(rec);
		if (pend > chong) {
			pend = chong;
		}

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("rec", rec);

		System.out.println(page + " " + pstart + " " + pend);

		return "/list";

	}

	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest request) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		int id = Integer.parseInt(request.getParameter("id"));
		int rec = Integer.parseInt(request.getParameter("rec"));
		int page = Integer.parseInt(request.getParameter("page"));

		mdao.readnum(id);

		return "redirect:/content?id=" + id + "&rec=" + rec + "&page=" + page;

	}

	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		int id = Integer.parseInt(request.getParameter("id"));
		int rec = Integer.parseInt(request.getParameter("rec"));
		int page = Integer.parseInt(request.getParameter("page"));
		String err=request.getParameter("err");

		MyDto mdto = mdao.content(id);

		// 같은 페이지로 리턴할 때는 model로 주면 된다.
		model.addAttribute("mdto", mdto);
		model.addAttribute("page", page);
		model.addAttribute("rec", rec);
		model.addAttribute("err",err);

		return "/content";

	}
	
	
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		int id = Integer.parseInt(request.getParameter("id"));
		int rec = Integer.parseInt(request.getParameter("rec"));
		int page = Integer.parseInt(request.getParameter("page"));
		String err=request.getParameter("err");

		MyDto mdto = mdao.content(id);

		// 같은 페이지로 리턴할 때는 model로 주면 된다.
		model.addAttribute("mdto", mdto);
		model.addAttribute("page", page);
		model.addAttribute("rec", rec);
		model.addAttribute("err",err);

		return "/update";

	}
	
	
	
	
	@RequestMapping("/updateOk")
	public String updateOk(MyDto mdto, HttpServletRequest request, Model model) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		int rec = Integer.parseInt(request.getParameter("rec"));
		int page = Integer.parseInt(request.getParameter("page"));
		

		
		
		if(mdao.isPwd(mdto.getId(), mdto.getPwd())) {
			mdao.updateOk(mdto);
			return "redirect:/content?rec="+rec+"&page="+page+"&id="+mdto.getId();
			
			
		}else {
			return "redirect:/update?err=1&rec="+rec+"&page="+page+"&id="+mdto.getId();
		}

		
		
		
		
		
		// 같은 페이지로 리턴할 때는 model로 주면 된다.
	
		
		

	}
	
	
	
	
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		MyDao mdao = sqlsession.getMapper(MyDao.class);

		int id = Integer.parseInt(request.getParameter("id"));
		int rec = Integer.parseInt(request.getParameter("rec"));
		int page = Integer.parseInt(request.getParameter("page"));
		String pwd=request.getParameter("pwd");

		if(mdao.isPwd(id, pwd))
		{
			mdao.delete(id);
			return "redirect:/list?page="+page+"&rec"+rec;
			
		}else
		{
			return "redirect:/content?err=1&id="+id+"&page="+page+"&rec="+rec;
		}
			
			
			
		
		// 같은 페이지로 리턴할 때는 model로 주면 된다.
		


	}



}
