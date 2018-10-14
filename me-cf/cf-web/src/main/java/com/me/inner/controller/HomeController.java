package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constant;
import com.me.inner.dto.*;
import com.me.inner.service.ClassifyService;
import com.me.inner.service.CodeService;
import com.me.inner.service.RecordService;
import com.me.inner.service.UserService;
import com.me.inner.util.CommonUtil;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
import com.me.inner.vo.RecordOverviewVO;
import com.me.inner.vo.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2018/9/15.
 */
@Controller
public class HomeController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private ClassifyService classifyService;
    @Autowired
    private UserService userService;
    @Autowired
    private CodeService codeService;
    @Autowired
    private RecordService recordService;

    @RequestMapping("index")
    public ModelAndView index() throws Exception {
        logger.debug("Execute Method index");

        Map<String, Object> model = Maps.newHashMap();
        BaseUserDetails userDetails = SecurityUtil.getUserInfo();

        List<ClassifyDTO> classifyList = classifyService.listClassify();
        UserDTO user = userService.getUserByUserId(userDetails.getUserId());
        List<CodeDTO> recodeTypeList = codeService.listCodeByType(Constant.Code_Type.RECORD_TYPE);

        model.put("user", user);
        model.put("userForm", new UserVO());
        model.put("classifyList", classifyList);
        model.put("recordTypeList", recodeTypeList);
        model.put("curDate", DateUtil.formatDate(new Date(), CommonConstant.Pattern.YYYY_MM_DD));

        return new ModelAndView("index/index", model);
    }

    @RequestMapping("dashboard")
    public ModelAndView dashboard() {
        logger.debug("Execute Method dashboard");
        Map<String, Object> model = Maps.newHashMap();

        RecordOverviewVO curOverview = recordService.getCurRecordOverview();
        RecordOverviewVO preOverview = recordService.getPreRecordOverview();
        List<String> priceRecordDateList = recordService.listRecentOneMonthPriceRecordDate();
        List<String> amountRecordDateList = recordService.listRecentOneMonthAmountRecordDate();
        List<String> weightRecordDateList = recordService.listRecentOneMonthWeightRecordDate();
        List<Double> priceList = recordService.listRecentOneMonthPrice();
        List<Double> amountList = recordService.listRecentOneMonthAmount();
        List<Double> weightList = recordService.listRecentOneMonthWeight();

        model.put("priceRecordDateData", new Gson().toJson(priceRecordDateList));
        model.put("amountRecordDateData", new Gson().toJson(amountRecordDateList));
        model.put("weightRecordDateData", new Gson().toJson(weightRecordDateList));
        model.put("priceData", new Gson().toJson(priceList));
        model.put("amountData", new Gson().toJson(amountList));
        model.put("weightData", new Gson().toJson(weightList));
        model.put("curOverview", curOverview);
        model.put("preOverview", preOverview);

        return new ModelAndView("dashboard/dashboard", model);
    }

    @RequestMapping("updateUser")
    public ModelAndView updateUserInfo(@ModelAttribute("userForm") UserVO userForm) throws Exception {
        logger.debug("Execute Method updateUserInfo...");

        UserDTO newUser = new UserDTO();
        newUser.setPassword(userForm.getPassword());
        newUser.setUserInfo(userForm.getUserInfo());

        newUser.getUserInfo().setBirthDay(DateUtil.parseDate(userForm.getBirthDayStr(), CommonConstant.Pattern.YYYY_MM_DD));

        userService.updateUser(newUser);

        String target = "redirect:/home";
        if (CommonConstant.YES_NO.YES.equals(userForm.getResetI())) {
            target = "redirect:/updateSuccess";
        }

        return new ModelAndView(target);
    }

    @RequestMapping("updateSuccess")
    public ModelAndView updateSuccess(HttpServletRequest request, HttpServletResponse response) {
        logger.debug("Execute Method updateSuccess...");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication!=null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }

        return new ModelAndView("updateSuccess");
    }
}
