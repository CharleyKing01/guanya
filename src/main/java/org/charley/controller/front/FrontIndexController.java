package org.charley.controller.front;
import org.charley.model.Image;
import org.charley.model.News;
import org.charley.model.Type;
import org.charley.service.ImageService;
import org.charley.service.NewsService;
import org.charley.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class FrontIndexController {

    @Autowired
    private TypeService typeService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private ImageService imageService;

    @GetMapping("/front/index.do")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("front/index");
        //Gson gson=new Gson();
        //String userJson = gson.toJson(user);//把user转成json格式字符串
        Type type = new Type();
        type.setSort("新闻");
        List<Type> typeList = typeService.findAllType(1,10,type);
        modelAndView.addObject("typeList",typeList);//新闻类别
        List<News> newsList = newsService.findAllNews(1,100,null);
        modelAndView.addObject("newsList",newsList);//新闻
        modelAndView.addObject("specialNews",newsList.get(0));//特别新闻
        List<Image> imageList = imageService.findAllImage(1,100,null);
        modelAndView.addObject("imageList",imageList);//图片
        return modelAndView;
    }


}
