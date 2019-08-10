package service.Impl;

import com.google.gson.Gson;
import dao.WishlistDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.WishlistService;
import utils.ResponseResult;

import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019/8/10 10:30
 * @Description: 收藏Service实现类
 */
@Service
public class WishlistServiceImpl implements WishlistService {
    @Autowired
    private WishlistDao wishlistDao;

    @Transactional
    @Override
    public String addWishlist(int pro_id, int user_id) {
        try {
            wishlistDao.addWishlist(pro_id,user_id);
            return ResponseResult.build(200,"收藏添加成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"收藏添加失败");
    }

    @Override
    public String getWishlistInfos(int user_id) {
        List wishlistInfos = wishlistDao.getWishlistInfos(user_id);
        String json = new Gson().toJson(wishlistInfos);
        return json;
    }

    @Transactional
    @Override
    public String delWishlist(int wishlist_id) {
        try {
            wishlistDao.delWishlist(wishlist_id);
            return ResponseResult.build(200,"删除成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"删除失败");
    }
}
