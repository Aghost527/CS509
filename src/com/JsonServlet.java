package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import driver.*;
import flight.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import driver.DriverManager;
import flight.Flight;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonServlet extends HttpServlet {

	@Override
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	   throws ServletException, IOException {
	  doPost(req, resp);
	 }

	 @Override
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	   throws ServletException, IOException {
	  // TODO Auto-generated method stub
	  resp.setContentType("text/xml;character=utf-8");
	  resp.setHeader("Cache-Control", "no-cache");
	  try{


	   try{

//	    JSONArray json =JSONArray.fromObject(list);
	    JSONObject jb =new JSONObject();
	    DriverManager driverManager=new DriverManager();
//	    jb.put("person", json);
	    resp.getWriter().write(driverManager.search("", "", "", "", "").toString());
	   }catch(IOException e){
	    e.printStackTrace();
	   }
	  }catch(Exception e){
	   e.printStackTrace();
	  }
	 }

	}
