package org.charley.service.impl;
import com.github.pagehelper.PageHelper;
import org.charley.mapper.CodeTableMapper;
import org.charley.model.CodeTable;
import org.charley.service.CodeTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service(value = "codeTableService")
public class CodeTableServiceImpl implements CodeTableService {

    @Autowired
    private CodeTableMapper codeTableMapper;
    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public List<CodeTable> findAllCodeTable(int pageNum, int pageSize, CodeTable codeTable) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        return codeTableMapper.selectAllCodeTable(codeTable);
    }

    @Override
    public int insert(CodeTable codeTable){
        return codeTableMapper.insert(codeTable);
    }

    @Override
    public int updateByPrimaryKey(CodeTable codeTable){
        return codeTableMapper.updateByPrimaryKey(codeTable);
    }

    @Override
    public int deleteByPrimaryKey(Integer id){
        return codeTableMapper.deleteByPrimaryKey(id);
    }
}