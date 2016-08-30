package com.winning.sx.base.model;

/**
 * Created by MJ on 2016-06-15.
 * 流程定义的模型
 * cProcedureCode流程编码
 * cProcedureName流程名称
 * cHospitalCode医院编码
 * cDescribe描述信息
 */
public class ProcedureModel {
    private String cProcedureCode;
    private String cProcedureName;
    private String cHospitalCode;
    private String cHospitalName;
    private String cDescribe;
    private boolean bEncrypt;

    public boolean isbEncrypt() {
        return bEncrypt;
    }

    public void setbEncrypt(boolean bEncrypt) {
        this.bEncrypt = bEncrypt;
    }

    public String getcHospitalName() {
        return cHospitalName;
    }

    public void setcHospitalName(String cHospitalName) {
        this.cHospitalName = cHospitalName;
    }

    public String getcProcedureCode() {
        return cProcedureCode;
    }

    public void setcProcedureCode(String cProcedureCode) {
        this.cProcedureCode = cProcedureCode;
    }

    public String getcProcedureName() {
        return cProcedureName;
    }

    public void setcProcedureName(String cProcedureName) {
        this.cProcedureName = cProcedureName;
    }

    public String getcHospitalCode() {
        return cHospitalCode;
    }

    public void setcHospitalCode(String cHospitalCode) {
        this.cHospitalCode = cHospitalCode;
    }

    public String getcDescribe() {
        return cDescribe;
    }

    public void setcDescribe(String cDescribe) {
        this.cDescribe = cDescribe;
    }

}
