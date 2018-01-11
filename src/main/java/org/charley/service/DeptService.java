package org.charley.service;
import org.charley.model.Dept;
import java.util.List;

public interface DeptService {
    List<Dept> findAllDept(int pageNum, int pageSize, Dept dept);
    int insert(Dept dept);
    int updateByPrimaryKey(Dept record);
    int deleteByPrimaryKey(Integer id);
}