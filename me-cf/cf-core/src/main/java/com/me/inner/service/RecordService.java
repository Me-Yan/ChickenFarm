package com.me.inner.service;

import com.me.inner.dto.RecordDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
public interface RecordService {

    List<RecordDTO> listRecordByCriteria(String type, String startDate, String endDate) throws Exception;

    void saveRecord(RecordDTO record) throws Exception;
}
