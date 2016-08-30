package com.winning.sx.base.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.winning.dapi.data.entity.DataTable;
import com.winning.sx.base.common.response.message.AjaxDataResponseMessage;
import com.winning.sx.base.common.response.message.AjaxTableResponseMessage;
import com.winning.sx.base.dao.DatatableDao;
import com.winning.sx.base.model.ProcedureModel;
import com.winning.sx.base.model.SelectModel;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by JWL on 2016/8/22.
 * datatable示例页面
 */
@Controller
public class DatatableController {
    @Autowired
    private DatatableDao datatableDao;

    private ObjectMapper objectMapper = new ObjectMapper();

    @RequestMapping(value = {"/datatable/{action}"})
    public ModelAndView getDatatables(@PathVariable("action") String action) {
        ModelAndView mv = new ModelAndView();
        if ("0".equals(action)) {
            mv.setViewName("table/datatable");
        }
        if ("1".equals(action)) {
            mv.setViewName("table/datatable1");
            List<SelectModel> hospitalList = datatableDao.getHospitalList();
            mv.addObject("hospitalList", hospitalList);
        }
        if ("2".equals(action)) {
            mv.setViewName("table/datatable2");
        }
        if ("3".equals(action)) {
            mv.setViewName("table/datatable3");
        }
        if ("4".equals(action)) {
            mv.setViewName("table/datatable4");
        }
        if ("5".equals(action)) {
            mv.setViewName("table/datatable5");
        }
        if ("6".equals(action)) {
            mv.setViewName("table/datatable6");
        }
        mv.addObject("msg", "bbbbbbbbbbbbbbbbbbbbb");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = {"/datatable/query"})
    public AjaxTableResponseMessage getTables(String datas) {
        AjaxTableResponseMessage ajaxTableResponseMessage = new AjaxTableResponseMessage();
        DataTable table = null;
        Map<String, Object> map = null;
        try {
            map = this.objectMapper.readValue(datas, Map.class);
            table = datatableDao.getTables(map);
            ajaxTableResponseMessage.setDatas(table.getDataRows());
            ajaxTableResponseMessage.setTotalSize((int) table.getTotalRowNum());
            ajaxTableResponseMessage.setSuccess(true);
        } catch (Exception e) {
            ajaxTableResponseMessage.setSuccess(false);
            ajaxTableResponseMessage.setErrorMsg(e.getMessage());
        }
        return ajaxTableResponseMessage;
    }

    @ResponseBody
    @RequestMapping(value = {"/datatable/updata"}, method = RequestMethod.POST)
    public AjaxDataResponseMessage update(HttpServletRequest request) {
        AjaxDataResponseMessage ajaxResponseMessage = new AjaxDataResponseMessage();
        ProcedureModel procedureModel = new ProcedureModel();
        Map<String, String[]> inmap = request.getParameterMap();
        Map<String, Object> map = new HashMap<String, Object>();
        String[] args = null;
        String action = inmap.get("action")[0];
        for (String key : inmap.keySet()) {
            if (!key.startsWith("data")) {
                continue;
            }
            int firstPosition = key.indexOf("]");
            String id = key.substring(5, firstPosition);
            procedureModel.setcProcedureCode(id);
            String field = key.substring(firstPosition + 2, key.length() - 1);
            map.put(field, inmap.get(key)[0]);
        }
        int result = 0;
        try {
            BeanUtils.populate(procedureModel, map);
            List<ProcedureModel> list = new ArrayList<ProcedureModel>();
            list.add(procedureModel);
            if ("edit".equals(action)) {
                result = datatableDao.updateProcedure(procedureModel);
            } else if ("remove".equals(action)) {
                result = datatableDao.deleteProcedure(procedureModel);
            } else if ("create".equals(action)) {
                procedureModel.setcProcedureCode(System.currentTimeMillis() + "");
                result = datatableDao.newProcedure(procedureModel);
            }
            ajaxResponseMessage.setSuccess(true);
            ajaxResponseMessage.setData(list);
        } catch (Exception e) {
            ajaxResponseMessage.setSuccess(false);
            ajaxResponseMessage.setErrorMsg(e.getMessage());
        }
        return ajaxResponseMessage;
    }

    @ResponseBody
    @RequestMapping(value = {"/procedure/{type}"}, method = RequestMethod.POST)
    public AjaxDataResponseMessage procedureIUD(@PathVariable("type") String type, ProcedureModel procedureModel) {
        AjaxDataResponseMessage ajaxResponseMessage = new AjaxDataResponseMessage();
        int result = 0;
        try {
            if ("new".equals(type)) {
                result = datatableDao.newProcedure(procedureModel);
            } else if ("update".equals(type)) {
                result = datatableDao.updateProcedure(procedureModel);
            } else if ("delete".equals(type)) {
                result = datatableDao.deleteProcedure(procedureModel);
            }
            ajaxResponseMessage.setData(procedureModel);
            ajaxResponseMessage.setSuccess(true);
        } catch (Exception e) {
            ajaxResponseMessage.setSuccess(false);
            ajaxResponseMessage.setErrorMsg(e.getMessage());
        }
        return ajaxResponseMessage;
    }

    @ResponseBody
    @RequestMapping(value = {"/datatable/datas"})
    public void getDatas(HttpServletResponse response) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", "1001");
        map.put("name", "开心");
        list.add(map);
        String data = "[" +
                "    {" +
                "      \"id\": \"Tiger Nixon\"," +
                "      \"name\": \"System Architect\"" +
                "    }," +
                "    {" +
                "      \"id\": \"Garrett Winters\"," +
                "      \"name\": \"Accountant\"" +
                "    }," +
                "    {" +
                "      \"id\": \"Ashton Cox\"," +
                "      \"name\": \"Junior Technical Author\"" +
                "    }," +
                "    {" +
                "      \"id\": \"Cedric Kelly\"," +
                "      \"name\": \"Senior Javascript Developer\"" +
                "    }," +
                "    {" +
                "      \"id\": \"Airi Satou\"," +
                "      \"name\": \"Accountant\"" +
                "    }," +
                "    {" +
                "      \"id\": \"Brielle Williamson\"," +
                "      \"name\": \"Integration Specialist\"" +
                "    }," +
                "    {" +
                "      \"id\": \"Herrod Chandler\"," +
                "      \"name\": \"Sales Assistant\"" +
                "    }" +
                "  ]";
        //JSONObject json = new JSONObject();
        //json.put("data", data);
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //out.println(json.toString());
        out.flush();
        out.close();
    }
}
