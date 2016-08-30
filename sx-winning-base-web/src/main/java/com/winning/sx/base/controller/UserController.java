package com.winning.sx.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by xiaoY on 2016/8/25.
 */
@Controller
public class UserController {
    @ResponseBody
    @RequestMapping(value = "/userList")
    public ModelAndView userPage(String param) {
        ModelAndView mv = new ModelAndView("/userList");
        return mv;
    }
}
