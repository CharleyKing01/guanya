package org.charley.service;
import org.charley.model.Role;
import java.util.List;

public interface RoleService {
    List<Role> findAllRole(int pageNum, int pageSize, Role role);
    int insert(Role role);
    int updateByPrimaryKey(Role record);
    int deleteByPrimaryKey(Integer id);
}