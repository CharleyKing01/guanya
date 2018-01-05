package org.charley.service;
import org.charley.model.News;
import java.util.List;

public interface NewsService {
    List<News> findAllNews(int pageNum, int pageSize);

}