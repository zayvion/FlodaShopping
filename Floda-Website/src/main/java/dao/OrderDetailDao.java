package dao;

import pojo.OrderDetail;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 14:39
 * @Description:订单详情Dao
 */
public interface OrderDetailDao {
    /**
     * 增加订单详情
     *
     * @param orderDetail
     */
    void addOrderDetail(OrderDetail orderDetail);

    /**
     * 订单号获取订单详情
     * @param orderId
     * @return
     */
    List getOrderDetail(int orderId);
}
