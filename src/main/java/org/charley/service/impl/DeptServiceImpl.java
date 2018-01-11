package org.charley.service.impl;
import com.github.pagehelper.PageHelper;
import org.charley.mapper.DeptMapper;
import org.charley.mapper.TypeMapper;
import org.charley.model.Dept;
import org.charley.model.Type;
import org.charley.service.DeptService;
import org.charley.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "deptService")
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;
    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public List<Dept> findAllDept(int pageNum, int pageSize,Dept dept) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        return deptMapper.selectAllDept(dept);
    }

    @Override
    public int insert(Dept dept){
        return deptMapper.insert(dept);
    }

    @Override
    public int updateByPrimaryKey(Dept dept){
        return deptMapper.updateByPrimaryKey(dept);
    }

    @Override
    public int deleteByPrimaryKey(Integer id){
        return deptMapper.deleteByPrimaryKey(id);
    }

}