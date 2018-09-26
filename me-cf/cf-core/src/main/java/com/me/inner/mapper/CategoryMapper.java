package com.me.inner.mapper;

import com.me.inner.dto.CategoryDTO;
import com.me.inner.dto.ClassifyDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/9/23.
 */
public interface CategoryMapper {

    List<CategoryDTO> listAllCategoryByClassifyId(@Param("classifyId") Integer classifyId);

    void activeAllCategory(Integer classifyId);

    void closeAllCategory(Integer classifyId);

    void saveCategory(CategoryDTO category);

    void updateCategory(CategoryDTO category);

    void activeCategory(Integer categoryId);

    void closeCategory(Integer categoryId);
}
