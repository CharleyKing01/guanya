package org.charley.controller.sys;
import org.charley.Constants;
import org.charley.model.CodeTable;
import org.charley.model.DataGrid;
import org.charley.model.Image;
import org.charley.model.Type;
import org.charley.service.CodeTableService;
import org.charley.service.ImageService;
import org.charley.service.TypeService;
import org.charley.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;

@RestController
public class SysImageController {

    @Autowired
    private ImageService imageService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private CodeTableService codeTableService;

    @GetMapping("/sys/image/list.do")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("sys/image");
        List<Type> typeList = typeService.findAllType(1,100,null);
        modelAndView.addObject("typeList",typeList);
        return modelAndView;
    }

    @PostMapping("/sys/image/list-data.json")
    public DataGrid listData(Image image){
        List<Image> list = imageService.findAllImage(1,100,image);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setRows(list);
        dataGrid.setTotal(list.size());
        //Gson gson=new Gson();
        //String dataGridJson = gson.toJson(dataGrid);
        return dataGrid;
    }

    @PostMapping(value = "/sys/image/add-data.do")
    public String addData(Image image) {
        MultipartFile file = image.getImgUrlUpload();
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();
//        System.out.println("fileName-->" + fileName);
//        System.out.println("getContentType-->" + contentType);
        //TODO 后期CodeTable放到缓存读取
        CodeTable codeTable1 = new CodeTable();
        codeTable1.setCodeType(Constants.CODE_TABLE_CODE_TYPE_UPLOAD_FOLDER);
        codeTable1.setCodeKey(Constants.CODE_TABLE_CODE_KEY_S1);
        CodeTable codeTable2 = new CodeTable();
        codeTable2.setCodeType(Constants.CODE_TABLE_CODE_TYPE_BASE_PICTURE_URL);
        codeTable2.setCodeKey(Constants.CODE_TABLE_CODE_KEY_S1);
        List<CodeTable> list1 = codeTableService.findAllCodeTable(1,1, codeTable1);
        List<CodeTable> list2 = codeTableService.findAllCodeTable(1,1, codeTable2);
        String filePath = list1.get(0).getCodeValue();
        try {
            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
            image.setName(fileName);
            image.setUrl(list2.get(0).getCodeValue()+"static/upload/"+fileName);
            image.setCreateUser("系统管理员");
            image.setCreateTime(new Date());
            image.setUpdateUser("系统管理员");
            image.setUpdateTime(new Date());
            return String.valueOf(imageService.insert(image));
        } catch (Exception e) {
            // TODO: handle exception
        }
        //返回json
        return "";
    }

    @PostMapping(value = "/sys/image/delete-data.do")
    public String deleteData(Integer id){
        return String.valueOf(imageService.deleteByPrimaryKey(id));
    }

    @PostMapping(value = "/sys/image/update-data.do")
    public String updateData(Image image){
        MultipartFile file = image.getImgUrlUpload();
        String fileName = file.getOriginalFilename();
        //TODO 后期CodeTable放到缓存读取
        CodeTable codeTable1 = new CodeTable();
        codeTable1.setCodeType(Constants.CODE_TABLE_CODE_TYPE_UPLOAD_FOLDER);
        codeTable1.setCodeKey(Constants.CODE_TABLE_CODE_KEY_S1);
        CodeTable codeTable2 = new CodeTable();
        codeTable2.setCodeType(Constants.CODE_TABLE_CODE_TYPE_BASE_PICTURE_URL);
        codeTable2.setCodeKey(Constants.CODE_TABLE_CODE_KEY_S1);
        List<CodeTable> list1 = codeTableService.findAllCodeTable(1,1, codeTable1);
        List<CodeTable> list2 = codeTableService.findAllCodeTable(1,1, codeTable2);
        String filePath = list1.get(0).getCodeValue();
        try {
            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
            image.setName(fileName);
            image.setUrl(list2.get(0).getCodeValue()+"static/upload/"+fileName);
            image.setUpdateUser("系统管理员");
            image.setUpdateTime(new Date());
            return String.valueOf(imageService.updateByPrimaryKey(image));
        } catch (Exception e) {
            // TODO: handle exception
        }
        //返回json
        return "";
    }
}
