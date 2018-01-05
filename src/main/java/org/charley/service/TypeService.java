package org.charley.service;
import org.charley.model.Type;
import java.util.List;

public interface TypeService {
    List<Type> findAllType(int pageNum, int pageSize,Type type);
    int insert(Type type);
    int updateByPrimaryKey(Type record);
    int deleteByPrimaryKey(Integer id);
}