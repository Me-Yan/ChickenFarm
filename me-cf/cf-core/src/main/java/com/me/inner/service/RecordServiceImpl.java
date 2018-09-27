package com.me.inner.service;

import com.me.inner.dto.RecordDTO;
import com.me.inner.mapper.RecordMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
@Service
public class RecordServiceImpl implements RecordService {

    private Logger logger = LoggerFactory.getLogger(RecordServiceImpl.class);

    @Autowired
    private RecordMapper recordMapper;

    public List<RecordDTO> listRecordByType(String type) {
        logger.debug("Execute Method listRecordByType...");

        return recordMapper.listRecordByType(type);
    }
}
