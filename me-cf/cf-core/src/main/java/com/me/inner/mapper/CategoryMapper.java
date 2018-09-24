package com.me.inner.mapper;

import com.me.inner.dto.CategoryDTO;
import com.me.inner.dto.ClassifyDTO;

import java.util.List;

/**
 * Created by Me on 2018/9/23.
 */
public interface CategoryMapper {

    List<CategoryDTO> listAllCategoryByClassifyId(Integer classifyId);

    void activeAllCategory(Integer classifyId);

    void closeAllCategory(Integer classifyId);
}
