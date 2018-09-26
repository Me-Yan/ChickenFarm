package com.me.inner.service;

import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.CategoryDTO;
import com.me.inner.mapper.CategoryMapper;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/23.
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    private Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);

    @Autowired
    private CategoryMapper categoryMapper;

    public List<CategoryDTO> listAllCategoryByClassifyId(Integer classifyId) {
        logger.debug("Execute Method listCategoryByClassifyId");

        return categoryMapper.listAllCategoryByClassifyId(classifyId);
    }

    public void activeAllCategory(Integer classifyId) {
        logger.debug("Execute Method activeCategory");

        categoryMapper.activeAllCategory(classifyId);
    }

    public void closeAllCategory(Integer classifyId) {
        logger.debug("Execute Method closeAllCategory");

        categoryMapper.closeAllCategory(classifyId);
    }

    public void saveCategory(CategoryDTO category) {
        logger.debug("Execute Method saveCategory");

        category.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
        category.setCreateDate(new Date());
        category.setCreateBy(SecurityUtil.getUserInfo().getUsername());

        categoryMapper.saveCategory(category);
    }

    public void updateCategory(CategoryDTO category) {
        logger.debug("Execute Method updateCategory");

        category.setUpdateDate(new Date());
        category.setUpdateBy(SecurityUtil.getUserInfo().getUsername());

        categoryMapper.updateCategory(category);
    }

    public void activeCategory(Integer categoryId) {
        logger.debug("Execute Method activeCategory");

        categoryMapper.activeCategory(categoryId);
    }

    public void closeCategory(Integer categoryId) {
        logger.debug("Execute Method closeCategory");

        categoryMapper.closeCategory(categoryId);
    }
}
