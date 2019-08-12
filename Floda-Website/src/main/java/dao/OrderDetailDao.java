package dao;

import pojo.OrderDetail;

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
}
