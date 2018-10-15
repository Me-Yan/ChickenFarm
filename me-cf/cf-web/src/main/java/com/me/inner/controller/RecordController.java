package com.me.inner.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constant;
import com.me.inner.dto.CodeDTO;
import com.me.inner.dto.RecordDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.service.CodeService;
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

import java.util.Calendar;
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
    @Autowired
    private CodeService codeService;

    @RequestMapping("list/{type}")
    public ModelAndView listWeight(@PathVariable("type") String type) throws Exception {
        logger.debug("Execute Method listWeight...");
        Map<String, Object> model = Maps.newHashMap();

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date end = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.MONTH, -1);

        Date start = calendar.getTime();

        CodeDTO typeCode = codeService.getCodeByTypeAndName(Constant.Code_Type.RECORD_TYPE, type);

        model.put("startDate", DateUtil.formatDate(start, CommonConstant.Pattern.YYYY_MM_DD));
        model.put("endDate", DateUtil.formatDate(end, CommonConstant.Pattern.YYYY_MM_DD));
        model.put("typeCode", typeCode);

        return new ModelAndView("record/list", model);
    }

    @RequestMapping("listRecordDateData")
    @ResponseBody
    public List<String> listRecordDateData(@RequestParam("type") String type,
                                 @RequestParam("startDate") String startDate,
                                 @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method listRecordDateData...");

        return recordService.listRecordDateByCriteria(startDate, endDate, type);
    }

    @RequestMapping("listWeightData")
    @ResponseBody
    public List<Double> listWeightData(@RequestParam("type") String type,
                                       @RequestParam("startDate") String startDate,
                                       @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method listRecordData...");

        return recordService.listWeightData(startDate, endDate, type);
    }

    @RequestMapping("listPriceData")
    @ResponseBody
    public List<Double> listPriceData(@RequestParam("type") String type,
                                       @RequestParam("startDate") String startDate,
                                       @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method listPriceData...");

        return recordService.listPriceData(startDate, endDate, type);
    }

    @RequestMapping("listAmountData")
    @ResponseBody
    public List<Double> listAmountData(@RequestParam("type") String type,
                                       @RequestParam("startDate") String startDate,
                                       @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method listAmountData...");

        return recordService.listAmountData(startDate, endDate, type);
    }

    @RequestMapping("listCountData")
    @ResponseBody
    public List<Integer> listCountData(@RequestParam("type") String type,
                                       @RequestParam("startDate") String startDate,
                                       @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method listCountData...");

        return recordService.listCountData(startDate, endDate, type);
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

    @RequestMapping("search")
    public ModelAndView search() throws Exception {
        logger.debug("Execute Method search...");

        Map<String, Object> model = Maps.newHashMap();

        Calendar today = Calendar.getInstance();
        Date end = today.getTime();
        today.add(Calendar.YEAR, -1);
        Date start = today.getTime();

        String startDate = DateUtil.formatDate(start, CommonConstant.Pattern.YYYY_MM_DD);
        String endDate = DateUtil.formatDate(end, CommonConstant.Pattern.YYYY_MM_DD);

        List<CodeDTO> dataTypeList = codeService.listCodeByType(Constant.Code_Type.RECORD_TYPE);

        model.put("dataTypeList", dataTypeList);
        model.put("startDate", startDate);
        model.put("endDate", endDate);

        return new ModelAndView("record/data", model);
    }

    @RequestMapping("searchData")
    @ResponseBody
    public List<RecordDTO> searchData(@RequestParam("type") String type,
                                      @RequestParam("startDate") String startDate,
                                      @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method searchData...");

        return recordService.listRecordByCriteria(startDate, endDate, type);
    }

    @RequestMapping("delete")
    @ResponseBody
    public ResponseData delete(@RequestParam("recordId") Integer recordId) throws Exception {
        logger.debug("Execute Method delete...");

        try {
            recordService.deleteRecordById(recordId);
        } catch (Exception e) {
            logger.error("occur a error when save record", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("listSale")
    public ModelAndView listSale() throws Exception {
        logger.debug("Execute Method listSale...");

        Map<String, Object> model = Maps.newHashMap();

        Calendar today = Calendar.getInstance();
        Date end = today.getTime();
        today.add(Calendar.YEAR, -1);
        Date start = today.getTime();

        String startDate = DateUtil.formatDate(start, CommonConstant.Pattern.YYYY_MM_DD);
        String endDate = DateUtil.formatDate(end, CommonConstant.Pattern.YYYY_MM_DD);

        model.put("startDate", startDate);
        model.put("endDate", endDate);

        return new ModelAndView("record/sale", model);
    }

    @RequestMapping("listSaleData")
    @ResponseBody
    public List<RecordDTO> listSaleData(@RequestParam("startDate") String startDate,
                                      @RequestParam("endDate") String endDate) throws Exception {
        logger.debug("Execute Method listSaleData...");

        return recordService.listRecordByCriteria(startDate, endDate, Constant.Record_Type.MORE);
    }
}
