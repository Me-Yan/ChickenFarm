package com.me.inner.service;

import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constant;
import com.me.inner.dto.RecordDTO;
import com.me.inner.mapper.RecordMapper;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
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

    public List<RecordDTO> listRecordByCriteria(String type, String startDate, String endDate) throws Exception {
        logger.debug("Execute Method listRecordByType...");

        Date start = null;
        Date end = null;
        if (StringUtils.isNotBlank(startDate)) {
            start = DateUtil.parseDate(startDate, CommonConstant.Pattern.YYYY_MM_DD);
        }
        if (StringUtils.isNotBlank(endDate)) {
            end = DateUtil.parseDate(endDate, CommonConstant.Pattern.YYYY_MM_DD);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(end);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            end = calendar.getTime();
        }

        return recordMapper.listRecordByCriteria(type, start, end);
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
}
