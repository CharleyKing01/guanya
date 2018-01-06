package org.charley.util.exception;

import java.io.Serializable;

/**
 * @author yzf
 * @time 2015年11月14日上午10:33:03
 * @description 可回滚的业务异常
 * 是BizException的直接实现类，方法列表和逻辑与BizException一致，作为标记，供事务框架识别。触发事务的回滚
 */
public class RollbackableBizException extends BizException implements
		Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 一般的异常构造，由于不包含异常代码，不建议使用
	 */
	public RollbackableBizException() {
		super();
	}
	/**
	 * @param message
	 */
	public RollbackableBizException(String message) {
		super(message);

	}
	/**
	 * 
	 * @param message
	 * @param cause
	 */
	public RollbackableBizException(String message, Throwable cause) {
		super(message, cause);
	}
	/**
	 * 
	 * @param message
	 * @param cause
	 */
	public RollbackableBizException(SysMessage msg, String message,Throwable cause) {
		super(msg,message, cause);
	}

	/**
	 *
	 * @param msg
	 */
	public RollbackableBizException(SysMessage msg) {
		super(msg);
	}
	/**
	 * 
	 * @param msg
	 * @param cause
	 */
	public RollbackableBizException(SysMessage msg, Throwable cause) {
		super(msg, cause);
	}
	/**
	 * 
	 * @param cause
	 */
	public RollbackableBizException(Throwable cause) {
		super(cause);
	}
}
