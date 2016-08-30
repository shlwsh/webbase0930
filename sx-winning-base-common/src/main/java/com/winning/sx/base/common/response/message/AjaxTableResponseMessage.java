package com.winning.sx.base.common.response.message;

import java.util.Collection;

/**
 * Created by JWL on 2016/8/29.
 */
public class AjaxTableResponseMessage extends AjaxResponseMessage {
    private Collection datas;
    private int totalSize;

    public AjaxTableResponseMessage() {
    }

    public Collection getDatas() {
        return this.datas;
    }

    public void setDatas(Collection datas) {
        this.datas = datas;
    }

    public int getTotalSize() {
        return this.totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }
}
