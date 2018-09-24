package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.dto.ClassifyDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.service.CategoryService;
import com.me.inner.service.ClassifyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2018/9/23.
 */
@Controller
@RequestMapping("classify")
public class ClassifyController {

    private Logger logger = LoggerFactory.getLogger(ClassifyController.class);

    @Autowired
    private ClassifyService classifyService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("list")
    public ModelAndView listClassify() {
        logger.debug("Execute Method listClassify...");
        Map<String, Object> model = Maps.newHashMap();
        model.put("classifyForm", new ClassifyDTO());

        return new ModelAndView("classify/list", model);
    }

    @RequestMapping("listClassifyData")
    @ResponseBody
    public List<ClassifyDTO> listClassifyData() {
        logger.debug("Execute Method listClassifyData...");

        return classifyService.listAllClassify();
    }

    @RequestMapping("activeClassify")
    @ResponseBody
    public ResponseData activeClassify(@RequestParam("classifyId") Integer classifyId) {
        logger.debug("Execute Method activeClassify...");

        try {
            categoryService.activeAllCategory(classifyId);

            return new ResponseData(true);
        } catch (Exception e) {
            logger.error("occur a error when active all category.");
            return new ResponseData(false);
        }
    }

    @RequestMapping("closeClassify")
    @ResponseBody
    public ResponseData closeClassify(@RequestParam("classifyId") Integer classifyId) {
        logger.debug("Execute Method closeClassify...");

        try {
            categoryService.closeAllCategory(classifyId);

            return new ResponseData(true);
        } catch (Exception e) {
            logger.error("occur a error when close all category.");
            return new ResponseData(false);
        }
    }

    @RequestMapping("updateClassify")
    @ResponseBody
    public ResponseData updateClassify(@ModelAttribute("classifyForm") ClassifyDTO classifyForm) {
        logger.debug("Execute Method updateClassify...");

        try {
            classifyService.updateClassify(classifyForm);

            return new ResponseData(true);
        } catch (Exception e) {
            logger.error("occur a error when update classify.");
            return new ResponseData(false);
        }
    }

    @RequestMapping("newClassify")
    @ResponseBody
    public ResponseData newClassify(@ModelAttribute("classifyForm") ClassifyDTO classifyForm) throws Exception {
        logger.debug("Execute Method newClassify...");

        try {
            classifyService.saveClassify(classifyForm);

            return new ResponseData(true);
        } catch (Exception e) {
            logger.error("occur a error when save classify.");
            return new ResponseData(false);
        }
    }
}
