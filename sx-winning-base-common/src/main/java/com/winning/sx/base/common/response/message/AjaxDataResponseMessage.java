package com.winning.sx.base.common.response.message;

/**
 * Created by JWL on 2016/8/29.
 */
public class AjaxDataResponseMessage extends AjaxResponseMessage {
    private Object data;

    public AjaxDataResponseMessage() {
    }

    public Object getData() {
        return this.data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
