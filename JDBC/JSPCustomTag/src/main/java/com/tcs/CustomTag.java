package com.tcs;

import javax.servlet.jsp.JspWriter;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class CustomTag implements Tag{

	
	PageContext context=null;
	@Override
	public void setPageContext(PageContext context) {
		this.context=context;
		
	}
	
	
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		JspWriter wr=context.getOut();
		try 
		{
			
			wr.println("This is Custom tag first application...");
		} 
		catch (IOException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE; //This line will execute the body
	}

	@Override
	public Tag getParent() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void release() {
		// TODO Auto-generated method stub
		
	}
@Override
	public void setParent(Tag arg0) {
		// TODO Auto-generated method stub
		
	}

}
