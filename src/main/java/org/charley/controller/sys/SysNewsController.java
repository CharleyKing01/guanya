package org.charley.controller.sys;
import org.charley.model.News;
import org.charley.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SysNewsController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/sys/addNews.do")
    public String addNews(News news){
        return "12312312";
    }
}
