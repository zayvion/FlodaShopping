package service;

import pojo.Order;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 15:09
 * @Description:订单service
 */
public interface OrderService {
    /**
     * 获取订单
     * @param id
     * @return
     */
    Order getOrder(int id);

    /**
     * 根据订单编号查询订单
     * @return
     */
    String getProByOrderId(int orderId);
}
