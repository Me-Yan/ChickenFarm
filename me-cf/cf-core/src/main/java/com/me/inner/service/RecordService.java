package com.me.inner.service;

import com.me.inner.dto.RecordDTO;

import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
public interface RecordService {

    List<RecordDTO> listRecordByType(String type);

    void saveRecord(RecordDTO record) throws Exception;

    boolean checkRecordExist(String type, String recordDate);
}
