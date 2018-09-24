package com.me.inner.service;

import com.me.inner.dto.CategoryDTO;

import java.util.List;

/**
 * Created by Me on 2018/9/23.
 */
public interface CategoryService {

    List<CategoryDTO> listAllCategoryByClassifyId(Integer classifyId);

    void activeAllCategory(Integer classifyId);

    void closeAllCategory(Integer classifyId);
}
