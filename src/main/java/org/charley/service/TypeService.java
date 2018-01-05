package org.charley.service;
import org.charley.model.Type;
import java.util.List;

public interface TypeService {
    List<Type> findAllType(int pageNum, int pageSize);
    int insert(Type type);
}