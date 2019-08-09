package service.Impl;

import com.google.gson.Gson;
import dao.CategroyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Categroy;
import service.CategroyService;
import utils.ResponseResult;

import java.util.List;

/**
 * @Auther  : zayvion
 * @Date: 2019-08-05 10:03
 * @Description:商品分类Service的实现类
 */
@Service
public class CategroyServiceImpl implements CategroyService {

    @Autowired
    private CategroyDao categroyDao;

    @Transactional
    @Override
    public String addCategroy(Categroy categroy) {
        try {
            categroyDao.addCategroy(categroy);
            return ResponseResult.build(200,"添加分类成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"商品分类添加失败");
    }

    @Override
    public String getCategroies() {
        List categroies = categroyDao.getCategroies();
        String json = new Gson().toJson(categroies);
        return json;
    }
    @Transactional
    @Override
    public String updateCategroy(Categroy categroy) {
        try {
            categroyDao.updateCategroy(categroy);
            return ResponseResult.ok("分类修改成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"分类修改失败");
    }

    @Override
    public String getCategroyInfo(int id) {
        if (id == 0){
            return ResponseResult.build(500,"id获取失败");

        }
        Categroy categroyInfo = categroyDao.getCategroyInfo(id);
        return new Gson().toJson(categroyInfo);
    }

    @Transactional
    @Override
    public String delCategroy(int id) {
        if (id == 0){
            return ResponseResult.build(500,"id获取失败");
        }
        categroyDao.delCategroy(id);
        return ResponseResult.ok("删除分类成功");
    }
}
