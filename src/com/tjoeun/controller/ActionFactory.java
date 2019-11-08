package com.tjoeun.controller;

import com.tjoeun.admin.controller.AdminLoginAction;
import com.tjoeun.admin.controller.AdminLoginFormAction;
import com.tjoeun.admin.controller.AdminLogoutAction;
import com.tjoeun.admin.controller.AdminMemberListAction;
import com.tjoeun.admin.controller.AdminProductDetailAction;
import com.tjoeun.admin.controller.AdminProductListAction;
import com.tjoeun.admin.controller.AdminProductUpdateAction;
import com.tjoeun.admin.controller.AdminProductUpdateFormAction;
import com.tjoeun.admin.controller.AdminProductWriteAction;
import com.tjoeun.admin.controller.AdminProductWriteFormAction;
import com.tjoeun.controller.action.Action;
import com.tjoeun.controller.action.IdCheckFormAction;
import com.tjoeun.controller.action.JoinAction;
import com.tjoeun.controller.action.JoinFormAction;
import com.tjoeun.controller.action.LoginAction;
import com.tjoeun.controller.action.LoginFormAction;
import com.tjoeun.controller.action.LogoutAction;
import com.tjoeun.controller.action.MainLoginAction;
import com.tjoeun.controller.action.MainLoginFormAction;
import com.tjoeun.controller.action.ProductDetailAction;

public class ActionFactory {
	private static ActionFactory instance=new ActionFactory();
	private ActionFactory(){
		
	}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action ac=null;
		if(command.contentEquals("main_login_form")) ac=new MainLoginFormAction();
		else if(command.contentEquals("main_login")) ac=new MainLoginAction();
		else if(command.contentEquals("login_form")) ac=new LoginFormAction();
		else if(command.contentEquals("login")) ac=new LoginAction();
		else if(command.equals("join_form")) ac= new JoinFormAction();
		else if(command.equals("id_check_form")) ac=new IdCheckFormAction();
		else if(command.equals("join")) ac= new JoinAction();
		else if(command.equals("product_detail")) ac = new ProductDetailAction();
		
		else if(command.equals("logout")) ac= new LogoutAction();
		
		else if(command.equals("admin_login_form")) ac= new AdminLoginFormAction();
		else if(command.equals("admin_login")) ac= new AdminLoginAction();
		else if(command.equals("admin_logout")) ac= new AdminLogoutAction();
		else if(command.equals("admin_member_list")) ac= new AdminMemberListAction();
		else if(command.equals("admin_product_list")) ac= new AdminProductListAction();
		else if(command.equals("admin_product_write_form")) ac= new AdminProductWriteFormAction();
		else if(command.equals("admin_product_write")) ac= new AdminProductWriteAction();
		else if(command.equals("admin_product_detail")) ac= new AdminProductDetailAction();
		else if(command.equals("admin_product_update_form")) ac= new AdminProductUpdateFormAction();
		else if(command.equals("admin_product_update")) ac= new AdminProductUpdateAction();
		
		
		return ac;
	}

}
