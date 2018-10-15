package com.me.inner.service;

import com.me.inner.dto.RecordDTO;
import com.me.inner.vo.RecordOverviewVO;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2018/9/27.
 */
public interface RecordService {

    List<RecordDTO> listRecordByCriteria(String startDate, String endDate, String type) throws Exception;

    void saveRecord(RecordDTO record) throws Exception;

    void deleteRecordById(Integer recordId);

    RecordOverviewVO getCurRecordOverview();

    RecordOverviewVO getPreRecordOverview();

    List<String> listRecentOneMonthPriceRecordDate();

    List<String> listRecentOneMonthAmountRecordDate();

    List<String> listRecentOneMonthWeightRecordDate();

    List<Double> listRecentOneMonthPrice();

    List<Double> listRecentOneMonthAmount();

    List<Double> listRecentOneMonthWeight();

    List<String> listRecordDateByCriteria(String startDate, String endDate, String type) throws Exception;

    List<Double> listWeightData(String startDate, String endDate, String type) throws Exception;

    List<Double> listPriceData(String startDate, String endDate, String type) throws Exception;

    List<Double> listAmountData(String startDate, String endDate, String type) throws Exception;

    List<Integer> listCountData(String startDate, String endDate, String type) throws Exception;
}
