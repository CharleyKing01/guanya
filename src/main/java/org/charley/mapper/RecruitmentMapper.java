package org.charley.mapper;
import org.charley.model.Recruitment;
import java.util.List;

public interface RecruitmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Recruitment record);

    int insertSelective(Recruitment record);

    Recruitment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Recruitment record);

    int updateByPrimaryKey(Recruitment record);

    List<Recruitment> selectAllRecruitment(Recruitment recruitment);
}