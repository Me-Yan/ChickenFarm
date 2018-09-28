package com.me.inner.mapper;

import com.me.inner.dto.RecordDTO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
public interface RecordMapper {

    List<RecordDTO> listRecordByType(String type);

    void saveRecord(RecordDTO record);

    Integer countRecord(@Param("type") String type, @Param("recordDate") String recordDate);

    void deleteRecord(@Param("type") String type, @Param("recordDate") Date recordDate);
}
