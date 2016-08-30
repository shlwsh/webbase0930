package com.winning.sx.base.dao;

import com.winning.dapi.data.api.IDataAccessService;
import com.winning.dapi.data.entity.DataTable;
import com.winning.sx.base.exception.BaseException;
import com.winning.sx.base.model.ProcedureModel;
import com.winning.sx.base.model.SelectModel;
import com.winning.sx.base.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by JWL on 2016/8/23.
 */
@Repository
public class DatatableDao {
    @Autowired
    @Qualifier("mysql")
    private IDataAccessService iDataAccessService;

    /**
     * 获取table列表
     *
     * @param map
     * @return
     * @throws BaseException
     */
    public DataTable getTables(Map<String, Object> map) throws BaseException {

        DataTable table = null;
        try {
            String sql = "SELECT cProcedureCode,cProcedureName,a.cHospitalCode,b.cHospitalName,a.cDescribe,a.bEncrypt From RIM_Procedure a LEFT JOIN RIM_Hospital b ON a.cHospitalCode=b.cHospitalCode order by cProcedureCode desc";
            table = iDataAccessService.querySql(sql);
        } catch (Exception e) {
            throw new BaseException(-2001, "获取信息失败！");
        }
        return table;
    }

    /**
     * 新增流程信息
     * @param procedureModel
     * @return
     * @throws BaseException
     */
    public int newProcedure(ProcedureModel procedureModel) throws BaseException {
        int result = 0;
        try {
            Map<String, Object> map = BaseUtil.beanToMap(procedureModel);
            result =iDataAccessService.executeSqlUsingParam("insert into RIM_Procedure(cProcedureCode,cProcedureName,cHospitalCode,cDescribe,bEncrypt) " +
                    "values(:cProcedureCode,:cProcedureName,:cHospitalCode,:cDescribe,:bEncrypt)", map);
        } catch (Exception e) {
            throw new BaseException(-2002, "新增信息失败！");
        }
        return result;
    }

    /**
     * 更新流程信息
     *
     * @param procedureModel
     * @return
     * @throws BaseException
     */
    public int updateProcedure(ProcedureModel procedureModel) throws BaseException {
        int result = 0;
        try {
            Map<String, Object> map = BaseUtil.beanToMap(procedureModel);
           String sql = "update  RIM_Procedure set cProcedureName=:cProcedureName,cHospitalCode=:cHospitalCode,cDescribe=:cDescribe,bEncrypt=:bEncrypt where cProcedureCode=:cProcedureCode";
            result = iDataAccessService.executeSqlUsingParam(sql, map);
        } catch (Exception e) {
            throw new BaseException(-2003, "修改信息失败！");
        }
        return result;
    }

    /**
     * 删除流程
     *
     * @param procedureModel
     * @return
     * @throws BaseException
     */
    public int deleteProcedure(ProcedureModel procedureModel) throws BaseException {
        int result = 0;
        try {
            Map<String, Object> map = BaseUtil.beanToMap(procedureModel);

            result = iDataAccessService.executeSqlUsingParam("delete from RIM_Procedure where cProcedureCode=:cProcedureCode", map);
        } catch (Exception e) {
            throw new BaseException(-2004, "删除信息失败！");
        }
        return result;
    }



    /**
     * 获取医院列表
     * return List<SelectModel>
     */
    public List<SelectModel> getHospitalList()
    {
        String sql="Select cHospitalCode as value,cHospitalName as text,bEncrypt from RIM_Hospital";
        List<SelectModel> hospitalList=iDataAccessService.querySqlForBean(sql,SelectModel.class);
        return hospitalList;
    }
}
