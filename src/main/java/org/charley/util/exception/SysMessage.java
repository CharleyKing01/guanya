package org.charley.util.exception;

import java.io.Serializable;

import org.springframework.stereotype.Component;

/**
 * @author yzf
 * @time 2015年11月14日上午10:33:12
 * @description 异常信息类
 */
public class SysMessage implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * message key to identify the message in resource bundle (required)
	 */
	protected String key;
	
	/**
	 * parameter values for message placeholder (optional)
	 */
	protected Object params[];
	
	
	/**
	 * @return  key.
	 */
	public String getKey() {
		return key;
	}
	/**
	 * @param key 
	 */
	public void setKey(String key) {
		this.key = key;
	}
	/**
	 * @return  params.
	 */
	public Object[] getParams() {
		return params;
	}
	/**
	 * @param params 
	 */
	public void setParams(Object[] params) {
		this.params = params;
	}
	/**
	 * @param key
	 * @param params
	 */
	public SysMessage(String key, Object[] params) {
		super();
		this.key = key;
		this.params = params;
	}
	/**
	 * @param key
	 */
	public SysMessage(String key) {
		super();
		this.key = key;
	}
}
