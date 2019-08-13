package dao;

import pojo.Ecaluate;

import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019-08-06 14:25
 * @Description:评论Dao
 */
public interface EcaluateDao {
    /**
     * 查询所有评论
     * @return list
     */
    List getEcaluates();


    /**
     * 增加评论
     * @param ecaluate
     */
    void addEcaluate(Ecaluate ecaluate);

    /**
     * 取一个商品的评论
     * @param productId
     * @return list
     */
    List<Ecaluate> getProductEcaluate(int productId);
}
