package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.service.ClassifyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by Me on 2018/9/9.
 */

@Controller
public class LoginController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping("login")
    public ModelAndView login(@RequestParam(name = "error", required = false) String error, HttpServletRequest request, HttpServletResponse response) {
        logger.debug("Execute Method login");

        Map<String, Object> model = Maps.newHashMap();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication!=null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }

        model.put("error", Boolean.FALSE);
        if (null != error) {
            model.put("error", Boolean.TRUE);
        }

        return new ModelAndView("login", model);
    }
}
