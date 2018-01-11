package org.charley.service;
import org.charley.model.ResumeApplication;
import java.util.List;

public interface ResumeApplicationService {
    List<ResumeApplication> findAllResumeApplication(int pageNum, int pageSize, ResumeApplication type);
    int insert(ResumeApplication resumeApplication);
    int updateByPrimaryKey(ResumeApplication record);
    int deleteByPrimaryKey(Integer id);
}