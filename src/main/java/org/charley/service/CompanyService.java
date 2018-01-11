package org.charley.service;
import org.charley.model.Company;
import java.util.List;

public interface CompanyService {
    List<Company> findAllCompany(int pageNum, int pageSize, Company company);
    int insert(Company type);
    int updateByPrimaryKey(Company record);
    int deleteByPrimaryKey(Integer id);
}