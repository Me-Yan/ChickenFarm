package com.me.inner.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constant;
import com.me.inner.dto.RecordDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.service.RecordService;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2018/9/27.
 */
@Controller
@RequestMapping("record")
public class RecordController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(RecordController.class);

    @Autowired
    private RecordService recordService;

    @RequestMapping("list/{type}")
    public ModelAndView listWeight(@PathVariable("type") String type) {
        logger.debug("Execute Method listWeight...");
        Map<String, Object> model = Maps.newHashMap();

        model.put("type", type);

        model.put(Constant.Record_Type.WEIGHT, Constant.Record_Type.WEIGHT);
        model.put(Constant.Record_Type.PRICE, Constant.Record_Type.PRICE);
        model.put(Constant.Record_Type.AMOUNT, Constant.Record_Type.AMOUNT);
        model.put(Constant.Record_Type.COUNT, Constant.Record_Type.COUNT);

        return new ModelAndView("record/list", model);
    }

    @RequestMapping("listData")
    @ResponseBody
    public List<RecordDTO> listData(@RequestParam("type") String type) {
        logger.debug("Execute Method listData...");

        return recordService.listRecordByType(type);
    }

    @RequestMapping("newRecord")
    @ResponseBody
    public ResponseData newRecord(@ModelAttribute("recordForm") RecordDTO recordForm) throws Exception {
        logger.debug("Execute Method newRecord...");

        try {
            recordService.saveRecord(recordForm);
        } catch (Exception e) {
            logger.error("occur a error when save record", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("checkRecordExist")
    @ResponseBody
    public ResponseData checkRecordExist(@RequestParam("type") String type, @RequestParam("recordDateStr") String recordDateStr) {
        logger.debug("Execute Method checkRecordExist...");

        try {
            boolean outcome = recordService.checkRecordExist(type, recordDateStr);
            if (outcome) {
                return new ResponseData(false);
            }
        } catch (Exception e) {
            logger.error("occur a error when check reocord", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }
}
