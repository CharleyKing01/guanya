package org.charley.service.impl;
import com.github.pagehelper.PageHelper;
import org.charley.mapper.RecruitmentMapper;
import org.charley.mapper.TypeMapper;
import org.charley.model.Recruitment;
import org.charley.model.Type;
import org.charley.service.RecruitmentService;
import org.charley.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "recruitmentService")
public class RecruitmentServiceImpl implements RecruitmentService {

    @Autowired
    private RecruitmentMapper recruitmentMapper;
    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public List<Recruitment> findAllRecruitment(int pageNum, int pageSize, Recruitment recruitment) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        return recruitmentMapper.selectAllRecruitment(recruitment);
    }

    @Override
    public int insert(Recruitment recruitment){
        return recruitmentMapper.insert(recruitment);
    }

    @Override
    public int updateByPrimaryKey(Recruitment recruitment){
        return recruitmentMapper.updateByPrimaryKey(recruitment);
    }

    @Override
    public int deleteByPrimaryKey(Integer id){
        return recruitmentMapper.deleteByPrimaryKey(id);
    }

}