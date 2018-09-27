package com.me.inner.mapper;

import com.me.inner.dto.RecordDTO;

import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
public interface RecordMapper {

    List<RecordDTO> listRecordByType(String type);
}
