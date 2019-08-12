package dao;

import pojo.Order;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 14:51
 * @Description:订单Dao
 */
public interface OrderDao {

    /**
     * 新增订单
     * @param order
     * @return 订单id
     */
    int addOrder(Order order);

    /**
     * 获取订单
     * @param id
     * @return
     */
    Order getOrder(int id);
}
