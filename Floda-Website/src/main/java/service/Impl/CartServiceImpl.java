package service.Impl;

import com.google.gson.Gson;
import dao.CartDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.CartInfo;
import service.CartService;
import utils.ResponseResult;

import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019/8/8 9:50
 * @Description: 购物车Service实现类
 */
@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;

    @Transactional
    @Override
    public String addCart(int pro_id, int user_id, int pro_number) {
        try {
            cartDao.addCart(pro_id, user_id, pro_number);
            return ResponseResult.build(200,"购物车添加成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"购物车添加失败");
    }

    @Override
    public String getCartInfos(int user_id) {
        List cartInfos = cartDao.getCartInfos(user_id);
        String json = new Gson().toJson(cartInfos);
        return json;
    }

    @Transactional
    @Override
    public String delCart(int cart_id) {
        try {
            cartDao.delCart(cart_id);
            return ResponseResult.build(200,"删除成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"删除失败");
    }

}
