package org.charley.controller.sys;
import com.google.gson.Gson;
import org.charley.json.AjaxResult;
import org.charley.model.DataGrid;
import org.charley.model.Type;
import org.charley.service.TypeService;
import org.omg.PortableInterceptor.SUCCESSFUL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
    public DataGrid listData(){
        List<Type> list = typeService.findAllType(1,10);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setRows(list);
        dataGrid.setTotal(list.size());
        //Gson gson=new Gson();
        //String dataGridJson = gson.toJson(dataGrid);
        return dataGrid;
    }

    @PostMapping(value = "/sys/type/add-data.do")
    public boolean addData(Type type){
        int num = typeService.insert(type);
        return true;
    }
}
