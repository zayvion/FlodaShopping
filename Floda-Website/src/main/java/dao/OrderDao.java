package dao;

import pojo.Order;

import java.util.List;

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

    /**
     * 查询所有订单
     * @return
     */
    List<Order> getOrders();

    /**
     * 更新订单信息
     * @param order
     */
    void updateOrder(Order order);
    List<Order> getOrders(int user_id);
}
