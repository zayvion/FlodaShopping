package service;

import pojo.Ecaluate;

import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019-08-06 14:26
 * @Description:查看评论Service
 */
public interface EcaluateService {
    /**
     * 查询所有评论
     * @return json
     */
    String getEcaluates();

    /**
     * 增加评论
     * @param ecaluate
     * @return json
     */
    String addEcaluate(Ecaluate ecaluate);

    /**
     * 取一个商品的评论
     * @param productId
     * @return
     */
    List<Ecaluate> getProductEcaluate(int productId);

    /**
     * 通过订单ID和商品ID查评论
     * @param OrderId
     * @param productId
     * @return json
     */
    String getEcaluateWithOrderAndUser(int OrderId, int productId);
}
