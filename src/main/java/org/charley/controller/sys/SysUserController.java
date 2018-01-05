package org.charley.controller.sys;
import org.charley.model.User;
import org.charley.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SysUserController {

    @Autowired
    private UserService userService;

    @PostMapping("/sys/user/add")
    public int addUser(User user){
        return userService.addUser(user);
    }

    @GetMapping(value = "/sys/user/all/{pageNum}/{pageSize}", produces = {"application/json;charset=UTF-8"})
    public Object findAllUser(@PathVariable("pageNum") int pageNum, @PathVariable("pageSize") int pageSize){
        return userService.findAllUser(pageNum,pageSize);
    }

    @GetMapping("/sys/test")
    public ModelAndView test() {
        ModelAndView modelAndView = new ModelAndView("sys/index");
        User user = userService.selectByPrimaryKey(1);
        //Gson gson=new Gson();
        //String userJson = gson.toJson(user);//把user转成json格式字符串
        modelAndView.addObject("user",user);
        return modelAndView;
    }

}
