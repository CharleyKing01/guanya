package org.charley.service;
import org.charley.model.User;

import java.util.List;


public interface UserService {

    int addUser(User user);

    List<User> findAllUser(int pageNum, int pageSize);

    User selectByPrimaryKey(Integer userId);
}