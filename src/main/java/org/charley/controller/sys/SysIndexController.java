package org.charley.controller.sys;
import org.charley.model.User;
import org.charley.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SysIndexController {

    @Autowired
    private UserService userService;

    @GetMapping("/sys/index.do")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("sys/index");
        User user = userService.selectByPrimaryKey(1);
        //Gson gson=new Gson();
        //String userJson = gson.toJson(user);//把user转成json格式字符串
        modelAndView.addObject("user",user);
        return modelAndView;
    }

}
