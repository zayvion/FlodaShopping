package dao;

import pojo.OrderInfo;

import java.util.List;

/**
 * @Auther: zwf97
 * @Date: 2019/8/13 09:34
 * @Description:订单详情Dao
 */
public interface OrderInfoDao {
    /**
     * 查看所有订单
     * @return list
     */
    List<OrderInfo> getOrderInfos();
}
