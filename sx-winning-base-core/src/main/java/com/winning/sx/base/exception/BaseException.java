package com.winning.sx.base.exception;

/**
 * Created by Administrator on 2016/6/23.
 */
public class BaseException extends Exception {

    private int errorCode;

    public BaseException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public int getErrorCode() {
        return this.errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }
}
