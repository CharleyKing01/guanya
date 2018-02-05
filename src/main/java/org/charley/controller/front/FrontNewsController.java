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
public class FrontNewsController {

    @Autowired
    private TypeService typeService;
    @Autowired
    private NewsService newsService;

    @GetMapping("/front/newsList.do")
    public ModelAndView newsList(Integer id){
        ModelAndView modelAndView = new ModelAndView("front/newsList");
        Type type = new Type();
        type.setSort("新闻");
        List<Type> typeList = typeService.findAllType(1,10,type);
        modelAndView.addObject("typeList",typeList);//新闻类别
        News news = new News();
        if(null == id){
            id = typeList.get(0).getId();
        }
        news.setType(id);
        List<News> newsList = newsService.findAllNews(1,20,news);
        modelAndView.addObject("newsList",newsList);//新闻
        modelAndView.addObject("typeId",id);
        return modelAndView;
    }

    @GetMapping("/front/newsDetail.do")
    public ModelAndView newsDetail(Integer id){
        ModelAndView modelAndView = new ModelAndView("front/newsDetail");
        Type type = new Type();
        type.setSort("新闻");
        List<Type> typeList = typeService.findAllType(1,10,type);
        modelAndView.addObject("typeList",typeList);//新闻类别
        News news = newsService.selectByPrimaryKey(id);
        modelAndView.addObject("news",news);//新闻
        return modelAndView;
    }

    @GetMapping("/front/newsCenter.do")
    public ModelAndView newsCenter(){
        ModelAndView modelAndView = new ModelAndView("front/newsCenter");
        Type type = new Type();
        type.setSort("新闻");
        List<Type> typeList = typeService.findAllType(1,10,type);
        modelAndView.addObject("typeList",typeList);//新闻类别
        News news = new News();
        news.setAdvisory(Constants.STRING_YES);
        List<News> advisoryNewsList = newsService.findAllNews(1,10,news);
        News advisoryNews = advisoryNewsList.get(0);
        modelAndView.addObject("advisoryNews",advisoryNews);
        return modelAndView;
    }
}
