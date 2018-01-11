package org.charley.service.impl;
import com.github.pagehelper.PageHelper;
import org.charley.mapper.CompanyMapper;
import org.charley.mapper.TypeMapper;
import org.charley.model.Company;
import org.charley.model.Type;
import org.charley.service.CompanyService;
import org.charley.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "companyService")
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;
    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public List<Company> findAllCompany(int pageNum, int pageSize, Company company) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        return companyMapper.selectAllCompany(company);
    }

    @Override
    public int insert(Company company){
        return companyMapper.insert(company);
    }

    @Override
    public int updateByPrimaryKey(Company company){
        return companyMapper.updateByPrimaryKey(company);
    }

    @Override
    public int deleteByPrimaryKey(Integer id){
        return companyMapper.deleteByPrimaryKey(id);
    }

}