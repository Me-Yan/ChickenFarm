package com.me.inner.mapper;

import com.me.inner.dto.RecordDTO;
import com.me.inner.vo.RecordOverviewVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
public interface RecordMapper {

    List<RecordDTO> listRecordByCriteria(@Param("type") String type, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

    void saveRecord(RecordDTO record);

    Integer countRecord(@Param("type") String type, @Param("recordDate") String recordDate);

    void deleteRecord(@Param("type") String type, @Param("recordDate") Date recordDate);

    void deleteRecordById(Integer recordId);

    RecordOverviewVO getRecordOverview(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    List<String> listRecordDate(@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("type") String type);

    List<Double> listPrice(@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("type") String type);

    List<Double> listAmount(@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("type") String type);

    List<Double> listWeight(@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("type") String type);
}
