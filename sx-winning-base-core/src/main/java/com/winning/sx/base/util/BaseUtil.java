package com.winning.sx.base.util;

import com.winning.dapi.data.api.IDataAccessService;
import com.winning.dapi.data.entity.DataTable;
import org.apache.commons.beanutils.PropertyUtilsBean;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by jwl on 2016/6/23.
 */
public class BaseUtil {

    /**
     * 对象转map
     *
     * @param obj
     * @return Map<String, Object>
     */
    public static Map<String, Object> beanToMap(Object obj) {
        Map<String, Object> params = new HashMap<String, Object>(0);
        try {
            PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean();
            PropertyDescriptor[] descriptors = propertyUtilsBean.getPropertyDescriptors(obj);
            for (int i = 0; i < descriptors.length; i++) {
                String name = descriptors[i].getName();
                if (!"class".equals(name)) {
                    params.put(name, propertyUtilsBean.getNestedProperty(obj, name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return params;
    }

    /**
     * DataTable转Json
     *
     * @param dt
     * @return String
     */
    public static String DataTable2Json(DataTable dt) {
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{\"");
        jsonBuilder.append("type");
        jsonBuilder.append("\":");
        jsonBuilder.append("\"success\",\"");
        jsonBuilder.append("rows");
        jsonBuilder.append("\":");
        jsonBuilder.append(dt.getTotalRowNum() + ",");
        jsonBuilder.append("\"");
        jsonBuilder.append("row");
        jsonBuilder.append("\":[");
        if (dt.getDataRows().size() > 0) {
            for (int i = 0; i < dt.getDataRows().size(); i++) {
                jsonBuilder.append("{");
                for (int j = 0; j < dt.getDataColumns().size(); j++) {
                    String dbname = dt.getDataColumns().get(j).getName();
                    jsonBuilder.append("\"");
                    jsonBuilder.append(dbname);
                    jsonBuilder.append("\":\"");
                    jsonBuilder.append(dt.getDataRows().get(i).get(dbname));
                    jsonBuilder.append("\",");
                }
                jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
                jsonBuilder.append("},");
            }
            jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
        }
        jsonBuilder.append("]}");
        return jsonBuilder.toString();
    }

    public static String getPrimarykey(IDataAccessService iDataAccessService, String tablename, String key) {
        int result = 0;
        DataTable table = null;
        String sql = "SELECT * FROM " + tablename + " ORDER BY " + key + " DESC";
        return result + "";
    }

    /**
     * 获取properties配置文件
     *
     * @param propName 属性名
     * @return
     * @throws IOException 用法：GetPropValue("name")
     */
    public static String GetPropValue(String propName) throws IOException {
        String propValue = "";
        InputStream path = Thread.currentThread().getContextClassLoader().getResourceAsStream("conf/profile.properties");
        Properties pro = new Properties();
        pro.load(path);
        propValue = pro.getProperty(propName);
        return propValue;
    }

    public static void main(String[] arg) {
        try {
            System.out.println(GetPropValue("9999"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}