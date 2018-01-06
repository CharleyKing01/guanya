package org.charley.util.exception;

import java.io.Serializable;

import org.springframework.stereotype.Component;

/**
 * @author yzf
 * @time 2015年11月14日上午10:32:35
 * @description 业务异常
 */
public class BizException extends Exception implements Serializable {

	private static final long serialVersionUID = 1L;
	
	protected SysMessage msg;
	
	public BizException() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param message
	 */
	public BizException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param message
	 * @param cause
	 */
	public BizException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param cause
	 */
	public BizException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param message
	 */
	public BizException(SysMessage msg) {
		super();
		this.msg = msg;
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	 * @param msg
	 * @param message
	 * @param cause
	 */
	public BizException(SysMessage msg, String message,Throwable cause){
		super(message,cause);
		this.msg = msg;
	}
	/**
	 * @param message
	 * @param cause
	 */
	public BizException(SysMessage msg, Throwable cause) {
		super(cause);
		this.msg = msg;
		// TODO Auto-generated constructor stub
	}
	
	public SysMessage getSysMsg() {
	    return this.msg;
	}
}
