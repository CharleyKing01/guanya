package org.charley.controller.sys;
import org.charley.model.DataGrid;
import org.charley.model.News;
import org.charley.model.Type;
import org.charley.service.NewsService;
import org.charley.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;

@RestController
public class SysNewsController {

    @Autowired
    private NewsService newsService;
    @Autowired
    private TypeService typeService;

    @GetMapping("/sys/news/list.do")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("sys/news");
        List<Type> typeList = typeService.findAllType(1,100,null);
        modelAndView.addObject("typeList",typeList);
        return modelAndView;
    }

    @PostMapping("/sys/news/list-data.json")
    public DataGrid listData(News news){
        List<News> list = newsService.findAllNews(1,100,news);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setRows(list);
        dataGrid.setTotal(list.size());
        //Gson gson=new Gson();
        //String dataGridJson = gson.toJson(dataGrid);
        return dataGrid;
    }

    @PostMapping(value = "/sys/news/add-data.do")
    public String addData(News news){
        news.setCreateUser("系统管理员");
        news.setCreateTime(new Date());
        news.setUpdateUser("系统管理员");
        news.setUpdateTime(new Date());
        news.setPublishUser("系统管理员");
        news.setCreateTime(new Date());
        return String.valueOf(newsService.insert(news));
    }

    @PostMapping(value = "/sys/news/delete-data.do")
    public String deleteData(Integer id){
        return String.valueOf(newsService.deleteByPrimaryKey(id));
    }

    @PostMapping(value = "/sys/news/update-data.do")
    public String updateData(News news){
        news.setUpdateUser("系统管理员");
        news.setUpdateTime(new Date());
        return String.valueOf(newsService.updateByPrimaryKey(news));
    }
}
