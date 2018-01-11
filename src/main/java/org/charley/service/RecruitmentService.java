package org.charley.service;
import org.charley.model.Recruitment;
import java.util.List;

public interface RecruitmentService {
    List<Recruitment> findAllRecruitment(int pageNum, int pageSize, Recruitment recruitment);
    int insert(Recruitment recruitment);
    int updateByPrimaryKey(Recruitment record);
    int deleteByPrimaryKey(Integer id);
}