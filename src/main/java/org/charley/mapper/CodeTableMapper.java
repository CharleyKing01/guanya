package org.charley.mapper;
import org.charley.model.CodeTable;
import org.charley.model.News;

import java.util.List;

public interface CodeTableMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CodeTable record);

    int insertSelective(CodeTable record);

    CodeTable selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CodeTable record);

    int updateByPrimaryKey(CodeTable record);

    List<CodeTable> selectAllCodeTable(CodeTable codeTable);
}