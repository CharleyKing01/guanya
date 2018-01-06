package org.charley.service.impl;
import com.github.pagehelper.PageHelper;
import org.charley.mapper.ImageMapper;
import org.charley.model.Image;
import org.charley.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service(value = "imageService")
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageMapper imageMapper;
    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public List<Image> findAllImage(int pageNum, int pageSize, Image image) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        return imageMapper.selectAllImage(image);
    }

    @Override
    public int insert(Image image){
        return imageMapper.insert(image);
    }

    @Override
    public int updateByPrimaryKey(Image image){
        return imageMapper.updateByPrimaryKey(image);
    }

    @Override
    public int deleteByPrimaryKey(Integer id){
        return imageMapper.deleteByPrimaryKey(id);
    }

}