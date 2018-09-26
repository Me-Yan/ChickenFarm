package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.dto.CategoryDTO;
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
@RequestMapping("category")
public class CategoryController {

    private Logger logger = LoggerFactory.getLogger(CategoryController.class);

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ClassifyService classifyService;

    @RequestMapping("list")
    public ModelAndView listCategory() {
        logger.debug("Execute Method listCategory...");
        Map<String, Object> model = Maps.newHashMap();

        List<ClassifyDTO> classifyList = classifyService.listAllClassify();
        model.put("classifyList", classifyList);

        return new ModelAndView("category/list", model);
    }

    @RequestMapping("listData")
    @ResponseBody
    public List<CategoryDTO> listCategoryData(@RequestParam(name = "classifyId", required = false) Integer classifyId) {
        logger.debug("Execute Method listCategoryData...");

        return categoryService.listAllCategoryByClassifyId(classifyId);
    }

    @RequestMapping("newCategory")
    @ResponseBody
    public ResponseData newCategory(@ModelAttribute("categoryForm") CategoryDTO categoryForm) throws Exception {
        logger.debug("Execute Method newCategory...");

        try {
            categoryService.saveCategory(categoryForm);
        } catch (Exception e) {
            logger.error("occur a error when amend category", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("updateCategory")
    @ResponseBody
    public ResponseData updateCategory(@ModelAttribute("categoryForm") CategoryDTO categoryForm) throws Exception {
        logger.debug("Execute Method updateCategory...");

        try {
            categoryService.updateCategory(categoryForm);
        } catch (Exception e) {
            logger.error("occur a error when amend category", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("activeCategory")
    @ResponseBody
    public ResponseData activeCategory(@RequestParam(name = "categoryId") Integer categoryId) throws Exception {
        logger.debug("Execute Method activeCategory...");

        try {
            categoryService.activeCategory(categoryId);
        } catch (Exception e) {
            logger.error("occur a error when active category", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("closeCategory")
    @ResponseBody
    public ResponseData closeCategory(@RequestParam(name = "categoryId") Integer categoryId) throws Exception {
        logger.debug("Execute Method closeCategory...");

        try {
            categoryService.closeCategory(categoryId);
        } catch (Exception e) {
            logger.error("occur a error when close category", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }
}
