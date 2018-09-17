package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.dto.BaseUserDetails;
import com.me.inner.dto.ClassifyDTO;
import com.me.inner.service.ClassifyService;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2018/9/15.
 */
@Controller
public class HomeController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private ClassifyService classifyService;

    @RequestMapping("index")
    public ModelAndView index() {
        logger.debug("Execute Method index");

        Map<String, Object> model = Maps.newHashMap();

        List<ClassifyDTO> classifyList = classifyService.listClassify();
        BaseUserDetails user = SecurityUtil.getUserInfo();

        model.put("user", user);
        model.put("classifyList", classifyList);

        return new ModelAndView("index", model);
    }

    @RequestMapping("dashboard")
    public ModelAndView dashboard() {
        logger.debug("Execute Method dashboard");
        Map<String, Object> model = Maps.newHashMap();

        return new ModelAndView("dashboard/dashboard");
    }
}
