package org.charley.controller.sys;
import org.charley.model.CodeTable;
import org.charley.model.DataGrid;
import org.charley.service.CodeTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@RestController
public class SysCodeTableController {

    @Autowired
    private CodeTableService codeTableService;


    @GetMapping("/sys/codeTable/list.do")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("sys/codeTable");
        return modelAndView;
    }

    @PostMapping("/sys/codeTable/list-data.json")
    public DataGrid listData(CodeTable codeTable){
        List<CodeTable> list = codeTableService.findAllCodeTable(1,100,codeTable);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setRows(list);
        dataGrid.setTotal(list.size());
        //Gson gson=new Gson();
        //String dataGridJson = gson.toJson(dataGrid);
        return dataGrid;
    }

    @PostMapping(value = "/sys/codeTable/add-data.do")
    public String addData(CodeTable codeTable){
        return String.valueOf(codeTableService.insert(codeTable));
    }

    @PostMapping(value = "/sys/codeTable/delete-data.do")
    public String deleteData(Integer id){
        return String.valueOf(codeTableService.deleteByPrimaryKey(id));
    }

    @PostMapping(value = "/sys/codeTable/update-data.do")
    public String updateData(CodeTable codeTable){
        return String.valueOf(codeTableService.updateByPrimaryKey(codeTable));
    }
}
