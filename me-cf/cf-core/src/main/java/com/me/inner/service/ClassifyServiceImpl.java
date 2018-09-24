package com.me.inner.service;

import com.me.inner.constant.Constant;
import com.me.inner.dto.ClassifyDTO;
import com.me.inner.mapper.ClassifyMapper;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/15.
 */
@Service
public class ClassifyServiceImpl implements ClassifyService {

    private Logger logger = LoggerFactory.getLogger(ClassifyServiceImpl.class);

    @Autowired
    private ClassifyMapper classifyMapper;

    public List<ClassifyDTO> listClassify() {
        logger.debug("Execute Method listClassify...");

        return classifyMapper.listClassify();
    }

    public List<ClassifyDTO> listAllClassify() {
        logger.debug("Execute Method listAllClassify...");

        return classifyMapper.listAllClassify();
    }

    public void updateClassify(ClassifyDTO classify) {
        logger.debug("Execute Method updateClassify...");

        classify.setUpdateBy(SecurityUtil.getUserInfo().getUsername());
        classify.setUpdateDate(new Date());
        classifyMapper.updateClassify(classify);
    }

    public void saveClassify(ClassifyDTO classify) {
        logger.debug("Execute Method saveClassify...");

        classify.setStatus(Constant.Classify_Status.VARIABLE);
        classify.setCreateDate(new Date());
        classify.setCreateBy(SecurityUtil.getUserInfo().getUsername());

        classifyMapper.saveClassify(classify);
    }
}
