package org.charley.mapper;
import org.charley.model.Recruitment;
import org.charley.model.ResumeApplication;

import java.util.List;

public interface ResumeApplicationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ResumeApplication record);

    int insertSelective(ResumeApplication record);

    ResumeApplication selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ResumeApplication record);

    int updateByPrimaryKey(ResumeApplication record);

    List<ResumeApplication> selectAllResumeApplication(ResumeApplication resumeApplication);
}