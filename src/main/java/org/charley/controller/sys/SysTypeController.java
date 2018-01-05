package org.charley.controller.sys;
import org.charley.model.DataGrid;
import org.charley.model.Type;
import org.charley.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@RestController
public class SysTypeController {

    @Autowired
    private TypeService typeService;

    @GetMapping("/sys/type/list.do")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("sys/type");
        return modelAndView;
    }

    @PostMapping("/sys/type/list-data.json")
    public DataGrid listData(Type type){
        List<Type> list = typeService.findAllType(1,100,type);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setRows(list);
        dataGrid.setTotal(list.size());
        //Gson gson=new Gson();
        //String dataGridJson = gson.toJson(dataGrid);
        return dataGrid;
    }

    @PostMapping(value = "/sys/type/add-data.do")
    public String addData(Type type){
        type.setCreateUser("系统管理员");
        type.setCreateTime(new Date());
        type.setUpdateUser("系统管理员");
        type.setUpdateTime(new Date());
        return String.valueOf(typeService.insert(type));
    }

    @PostMapping(value = "/sys/type/delete-data.do")
    public String deleteData(Integer id){
        return String.valueOf(typeService.deleteByPrimaryKey(id));
    }

    @PostMapping(value = "/sys/type/update-data.do")
    public String updateData(Type type){
        type.setUpdateUser("系统管理员");
        type.setUpdateTime(new Date());
        return String.valueOf(typeService.updateByPrimaryKey(type));
    }
}
