package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constant;
import com.me.inner.dto.RecordDTO;
import com.me.inner.mapper.RecordMapper;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
import com.me.inner.vo.RecordOverviewVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/27.
 */
@Service
public class RecordServiceImpl implements RecordService {

    private Logger logger = LoggerFactory.getLogger(RecordServiceImpl.class);

    @Autowired
    private RecordMapper recordMapper;

    public List<RecordDTO> listRecordByCriteria(String startDate, String endDate, String type) throws Exception {
        logger.debug("Execute Method listRecordByType...");

        Date start = null, end = null;
        if (StringUtils.isNotBlank(startDate)&&StringUtils.isNotBlank(endDate)) {
            start = DateUtil.parseDate(startDate, CommonConstant.Pattern.YYYY_MM_DD);
            end = DateUtil.parseDate(endDate, CommonConstant.Pattern.YYYY_MM_DD);

            return recordMapper.listRecordByCriteria(start, end, type);
        }

        return Lists.newArrayList();
    }

    public void saveRecord(RecordDTO record) throws Exception {
        logger.debug("Execute Method saveRecord...");

        Date curDate = new Date();
        String curDateStr = DateUtil.formatDate(curDate, CommonConstant.Pattern.YYYY_MM_DD);
        String late = CommonConstant.YES_NO.NO;
        Date recordDate = DateUtil.parseDate(record.getRecordDateStr(), CommonConstant.Pattern.YYYY_MM_DD);
        String username = SecurityUtil.getUserInfo().getUsername();

        if (!curDateStr.equals(record.getRecordDateStr())) {
            late = CommonConstant.YES_NO.YES;
        }
        if (StringUtils.isNotBlank(record.getType())) {

            record.setLate(late);
            record.setRecordDate(recordDate);
            record.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
            record.setCreateDate(curDate);
            record.setCreateBy(username);

            recordMapper.deleteRecord(record.getType(), record.getRecordDate());
            recordMapper.saveRecord(record);
        } else {
            Double weight = record.getWeight();
            Double price = record.getPrice();
            Double amount = record.getAmount();
            String description = record.getDescription();

            RecordDTO moreRecord = new RecordDTO();
            moreRecord.setLate(late);
            moreRecord.setType(Constant.Record_Type.MORE);
            moreRecord.setWeight(weight);
            moreRecord.setPrice(price);
            moreRecord.setAmount(amount);
            moreRecord.setDescription(description);
            moreRecord.setRecordDate(recordDate);
            moreRecord.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
            moreRecord.setCreateBy(username);
            moreRecord.setCreateDate(curDate);

            RecordDTO weightRecord = new RecordDTO();
            weightRecord.setLate(late);
            weightRecord.setType(Constant.Record_Type.WEIGHT);
            weightRecord.setWeight(weight);
            weightRecord.setDescription(description);
            weightRecord.setRecordDate(recordDate);
            weightRecord.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
            weightRecord.setCreateBy(username);
            weightRecord.setCreateDate(curDate);

            RecordDTO priceRecord = new RecordDTO();
            priceRecord.setLate(late);
            priceRecord.setType(Constant.Record_Type.PRICE);
            priceRecord.setPrice(price);
            priceRecord.setDescription(description);
            priceRecord.setRecordDate(recordDate);
            priceRecord.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
            priceRecord.setCreateBy(username);
            priceRecord.setCreateDate(curDate);

            RecordDTO amountRecord = new RecordDTO();
            amountRecord.setLate(late);
            amountRecord.setType(Constant.Record_Type.AMOUNT);
            amountRecord.setAmount(amount);
            amountRecord.setDescription(description);
            amountRecord.setRecordDate(recordDate);
            amountRecord.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
            amountRecord.setCreateBy(username);
            amountRecord.setCreateDate(curDate);

            recordMapper.deleteRecord(null, recordDate);

            recordMapper.saveRecord(moreRecord);
            recordMapper.saveRecord(weightRecord);
            recordMapper.saveRecord(priceRecord);
            recordMapper.saveRecord(amountRecord);
        }
    }

    public boolean checkRecordExist(String type, String recordDate) {
        logger.debug("Execute Method checkRecordExist");

        Integer count = recordMapper.countRecord(type, recordDate);
        if (count!=null&&count!=0) {
            return true;
        }
        return false;
    }

    public void deleteRecordById(Integer recordId) {
        logger.debug("Execute Method deleteRecordById");

        recordMapper.deleteRecordById(recordId);
    }

    public RecordOverviewVO getCurRecordOverview() {
        logger.debug("Execute Method getCurRecordOverview");

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date curEnd = calendar.getTime();

        calendar.set(Calendar.DAY_OF_MONTH, 1);
        Date curStart = calendar.getTime();

        return recordMapper.getRecordOverview(curStart, curEnd);
    }

    public RecordOverviewVO getPreRecordOverview() {
        logger.debug("Execute Method getPreRecordOverview");

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        Date preEnd = calendar.getTime();

        calendar.set(Calendar.DAY_OF_MONTH, 1);
        Date preStart = calendar.getTime();

        return recordMapper.getRecordOverview(preStart, preEnd);
    }

    public List<String> listRecentOneMonthPriceRecordDate() {
        logger.debug("Execute Method listRecentOneMonthPriceRecordDate");

        return listRecentOneMonthRecordDate(Constant.Record_Type.PRICE);
    }

    public List<String> listRecentOneMonthAmountRecordDate() {
        logger.debug("Execute Method listRecentOneMonthAmountRecordDate");

        return listRecentOneMonthRecordDate(Constant.Record_Type.AMOUNT);
    }

    public List<String> listRecentOneMonthWeightRecordDate() {
        logger.debug("Execute Method listRecentOneMonthWeightRecordDate");

        return listRecentOneMonthRecordDate(Constant.Record_Type.WEIGHT);
    }

    public List<Double> listRecentOneMonthPrice() {
        logger.debug("Execute Method listRecentOneMonthPrice");

        return listRecentOneMonthData(Constant.Record_Type.PRICE);
    }

    public List<Double> listRecentOneMonthAmount() {
        logger.debug("Execute Method listRecentOneMonthAmount");

        return listRecentOneMonthData(Constant.Record_Type.AMOUNT);
    }

    public List<Double> listRecentOneMonthWeight() {
        logger.debug("Execute Method listRecentOneMonthWeight");

        return listRecentOneMonthData(Constant.Record_Type.WEIGHT);
    }

    private List<Double> listRecentOneMonthData(String type) {
        logger.debug("Execute Method listRecentOneMonth");

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date endDate = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.MONTH, -1);

        Date startDate = calendar.getTime();

        if (type.equals(Constant.Record_Type.PRICE)) {
            return recordMapper.listPrice(startDate, endDate, Constant.Record_Type.PRICE);
        } else if (type.equals(Constant.Record_Type.AMOUNT)) {
            return recordMapper.listAmount(startDate, endDate, Constant.Record_Type.AMOUNT);
        } else if (type.equals(Constant.Record_Type.WEIGHT)) {
            return recordMapper.listWeight(startDate, endDate, Constant.Record_Type.WEIGHT);
        }

        return Lists.newArrayList();
    }

    public List<String> listRecordDateByCriteria(Date startDate, Date endDate, String type) throws Exception {
        logger.debug("Execute Method listRecordDateByCriteria");

        return recordMapper.listRecordDate(startDate, endDate, type);
    }

    public List<Double> listWeightData(Date startDate, Date endDate, String type) throws Exception {
        logger.debug("Execute Method listWeightData");

        return recordMapper.listWeight(startDate, endDate, type);
    }

    public List<Double> listPriceData(Date startDate, Date endDate, String type) throws Exception {
        logger.debug("Execute Method listPriceData");

        return recordMapper.listPrice(startDate, endDate, type);
    }

    public List<Double> listAmountData(Date startDate, Date endDate, String type) throws Exception {
        logger.debug("Execute Method listAmountData");

        return recordMapper.listAmount(startDate, endDate, type);
    }

    public List<Integer> listCountData(Date startDate, Date endDate, String type) throws Exception {
        logger.debug("Execute Method listCountData");

        return recordMapper.listCount(startDate, endDate, type);
    }

    private List<String> listRecentOneMonthRecordDate(String type) {
        logger.debug("Execute Method listRecentOneMonthRecordDate");

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date endDate = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.MONTH, -1);

        Date startDate = calendar.getTime();

        return recordMapper.listRecordDate(startDate, endDate, type);
    }
}
