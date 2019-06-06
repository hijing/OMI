package aop;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class Advice {
	
	public Object around(ProceedingJoinPoint j) throws Throwable {
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sa = (ServletRequestAttributes)ra;
		HttpServletRequest request = sa.getRequest();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		if(id != null) {
			return j.proceed();
		}else {
			return "redirect:/OMI/error.omi";
		}
	}

}
