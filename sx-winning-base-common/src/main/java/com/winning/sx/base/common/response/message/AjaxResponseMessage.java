package com.winning.sx.base.common.response.message;

/**
 * Created by JWL on 2016/8/29.
 */
public class AjaxResponseMessage {
    private boolean success;
    private String errorMsg;

    public AjaxResponseMessage() {
    }

    public boolean isSuccess() {
        return this.success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getErrorMsg() {
        return this.errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
