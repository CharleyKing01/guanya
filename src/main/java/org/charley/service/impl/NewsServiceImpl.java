package org.charley.service.impl;
import com.github.pagehelper.PageHelper;
import org.charley.mapper.NewsMapper;
import org.charley.model.News;
import org.charley.model.Type;
import org.charley.model.User;
import org.charley.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "newsService")
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;
    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public List<News> findAllNews(int pageNum, int pageSize,News news) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        return newsMapper.selectAllNews(news);
    }

    @Override
    public int insert(News news){
        return newsMapper.insert(news);
    }

    @Override
    public int updateByPrimaryKey(News news){
        return newsMapper.updateByPrimaryKey(news);
    }

    @Override
    public int deleteByPrimaryKey(Integer id){
        return newsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<News> selectByTypeThree(){
        return newsMapper.selectByTypeThree();
    }

    @Override
    public News selectByPrimaryKey(Integer id){return newsMapper.selectByPrimaryKey(id);}
}