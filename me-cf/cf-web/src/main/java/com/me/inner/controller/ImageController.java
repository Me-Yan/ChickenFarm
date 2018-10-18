package com.me.inner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Me on 2018/10/19.
 */
@Controller
@RequestMapping("image")
public class ImageController {

    private Logger logger = LoggerFactory.getLogger(ImageController.class);

    @RequestMapping("list")
    public ModelAndView listImage() {
        logger.debug("Execute Method listImage...");

        return new ModelAndView("image/list");
    }
}
