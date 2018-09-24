package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.BaseUserDetails;
import com.me.inner.dto.ClassifyDTO;
import com.me.inner.dto.UserDTO;
import com.me.inner.dto.UserInfoDTO;
import com.me.inner.service.ClassifyService;
import com.me.inner.service.UserService;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
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

    @RequestMapping("index")
    public ModelAndView index() {
        logger.debug("Execute Method index");

        Map<String, Object> model = Maps.newHashMap();
        BaseUserDetails userDetails = SecurityUtil.getUserInfo();

        List<ClassifyDTO> classifyList = classifyService.listClassify();
        UserDTO user = userService.getUserByUserId(userDetails.getUserId());

        model.put("user", user);
        model.put("userForm", new UserVO());
        model.put("classifyList", classifyList);

        return new ModelAndView("index", model);
    }

    @RequestMapping("dashboard")
    public ModelAndView dashboard() {
        logger.debug("Execute Method dashboard");
        Map<String, Object> model = Maps.newHashMap();

        return new ModelAndView("dashboard/dashboard");
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
