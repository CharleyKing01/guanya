package org.charley.service;

import org.charley.model.Image;

import java.util.List;

public interface ImageService {
    List<Image> findAllImage(int pageNum, int pageSize, Image image);
    int insert(Image image);
    int updateByPrimaryKey(Image record);
    int deleteByPrimaryKey(Integer id);
}