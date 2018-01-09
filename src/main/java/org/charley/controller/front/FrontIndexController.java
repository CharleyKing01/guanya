package org.charley.controller.front;
import org.charley.Constants;
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

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView index(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("front/index");
        //Gson gson=new Gson();
        //String userJson = gson.toJson(user);//把user转成json格式字符串
        String r1 = request.getSession().getServletContext().getRealPath("");
        String r2 = request.getRequestURL().toString();
        Type type = new Type();
        type.setSort("新闻");
        List<Type> typeList = typeService.findAllType(1,10,type);
        modelAndView.addObject("typeList",typeList);//新闻类别

        List<News> newsList = newsService.selectByTypeThree();
        modelAndView.addObject("newsList",newsList);//新闻

        News newsParam = new News();
        newsParam.setFocus(Constants.STRING_YES);
        List<News> specialNewsList = newsService.findAllNews(1,1,newsParam);
        News specialNews = newsList.get(0);
        if(null != specialNewsList && specialNewsList.size() > 0){
            specialNews = specialNewsList.get(0);
        }
        modelAndView.addObject("specialNews",specialNews);//特别新闻

        Image topImageParam = new Image();
        topImageParam.setTypeName("旗帜图片");
        List<Image> topImageList = imageService.findAllImage(1,20,topImageParam);
        modelAndView.addObject("topImageList",topImageList);//图片

        Image bottomImageParam = new Image();
        bottomImageParam.setTypeName("底部图片");
        List<Image> bottomImageList = imageService.findAllImage(1,3,bottomImageParam);
        modelAndView.addObject("bottomImageList",bottomImageList);//图片
        return modelAndView;
    }


}
