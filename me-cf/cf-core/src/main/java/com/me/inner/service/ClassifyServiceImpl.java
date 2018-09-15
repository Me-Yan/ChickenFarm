package com.me.inner.service;

import com.me.inner.dto.ClassifyDTO;
import com.me.inner.mapper.ClassifyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
