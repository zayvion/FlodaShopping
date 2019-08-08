package service.Impl;

import dao.CartDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.CartService;
import utils.ResponseResult;

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
            return ResponseResult.ok("添加购物车成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"购物车添加失败");
    }
}
