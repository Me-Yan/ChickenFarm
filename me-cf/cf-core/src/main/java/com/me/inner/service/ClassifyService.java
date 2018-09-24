package com.me.inner.service;

import com.me.inner.dto.ClassifyDTO;

import java.util.List;

/**
 * Created by Me on 2018/9/15.
 */
public interface ClassifyService {

    List<ClassifyDTO> listClassify();

    List<ClassifyDTO> listAllClassify();

    void updateClassify(ClassifyDTO classify);

    void saveClassify(ClassifyDTO classify);
}
