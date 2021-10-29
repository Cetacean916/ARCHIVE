package controller;

import controller.action.Action;
import controller.action.AlbumAction;
import controller.action.ArtistAction;
import controller.action.BoardAction;
import controller.action.BoardDetailAction;
import controller.action.BoardWriteAction;
import controller.action.BoardWriteFormAction;
import controller.action.GalleryAction;
import controller.action.GalleryUploadAction;
import controller.action.HomeAction;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;
import controller.action.LogoutAction;
import controller.action.MusicAction;
import controller.action.NaverLogin;

public class Factory {
	private static Factory inst = new Factory();
	
	private Factory() {
		
	}
	
	public static Factory getInst() {
		return inst;
	}
	
	public Action start(String command) {
		Action action = null;
		
		if(command.equals("login")) {
			action = new LoginAction();
		}else if(command.equals("loginForm")){
			action = new LoginFormAction();
		}else if(command.equals("board")){
			action = new BoardAction();
		}else if(command.equals("joinForm")){
			action = new JoinFormAction();
		}else if(command.equals("join")){
			action = new JoinAction();
		}else if(command.equals("write")){
			action = new BoardWriteAction();
		}else if(command.equals("writeForm")){
			action = new BoardWriteFormAction();
		}else if(command.equals("detail")){
			action = new BoardDetailAction();
		}else if(command.equals("artist")){
			action = new ArtistAction();
		}else if(command.equals("music")){
			action = new MusicAction();
		}else if(command.equals("album")){
			action = new AlbumAction();
		}else if(command.equals("home")){
			action = new HomeAction();
		}else if(command.equals("gallery")){
			action = new GalleryAction();
		}else if(command.equals("upload")){
			action = new GalleryUploadAction();
		}else if(command.equals("logout")){
			action = new LogoutAction();
		}else if(command.equals("naver")){
			action = new NaverLogin();
		}
		
		return action;
	}
}
