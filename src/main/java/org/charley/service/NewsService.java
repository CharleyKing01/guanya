package org.charley.service;
import org.charley.model.News;
import org.charley.model.Type;

import java.util.List;

public interface NewsService {
    List<News> findAllNews(int pageNum, int pageSize,News news);
    int insert(News news);
    int updateByPrimaryKey(News news);
    int deleteByPrimaryKey(Integer id);
}