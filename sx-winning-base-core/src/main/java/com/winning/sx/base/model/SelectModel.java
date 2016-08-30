package com.winning.sx.base.model;

/**
 * Created by GY on 2016/6/17.
 */
public class SelectModel {
    private String text;
    private String value;
    private boolean bEncrypt;

    public boolean isbEncrypt() {
        return bEncrypt;
    }

    public void setbEncrypt(boolean bEncrypt) {
        this.bEncrypt = bEncrypt;
    }

    public SelectModel() {
    }

    public SelectModel(String text, String value) {
        this.text = text;
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
