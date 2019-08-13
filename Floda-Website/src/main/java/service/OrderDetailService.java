package service;

import pojo.Order;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 14:52
 * @Description:订单详情Service
 */
public interface OrderDetailService {

    /**
     * 获取订单详情
     * @param orderId
     * @return
     */
    List getOrderDetail(int orderId);
}
