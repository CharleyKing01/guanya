package org.charley.service;
import org.charley.model.CodeTable;
import java.util.List;

public interface CodeTableService {
    List<CodeTable> findAllCodeTable(int pageNum, int pageSize, CodeTable codeTable);
    int insert(CodeTable codeTable);
    int updateByPrimaryKey(CodeTable codeTable);
    int deleteByPrimaryKey(Integer id);
}