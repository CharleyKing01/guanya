package org.charley.controller.front;
import org.charley.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class FrontIndexController {

    @GetMapping("/front/index.do")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("front/index");
        //Gson gson=new Gson();
        //String userJson = gson.toJson(user);//把user转成json格式字符串
        //modelAndView.addObject("user",user);
        return modelAndView;
    }


}
