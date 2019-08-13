package dao.Impl;

import dao.OrderInfoDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Order;
import pojo.OrderInfo;
import pojo.User;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zwf97
 * @Date: 2019/8/13 09:38
 * @Description:订单详情Dao的实现类
 */
@Repository
public class OrderInfoDaoImpl extends HibernateDaoSupport implements OrderInfoDao {
    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public List<OrderInfo> getOrderInfos() {
        DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
        List<Order> orders = (List<Order>)this.getHibernateTemplate().findByCriteria(criteria);
        System.out.println(orders.toString());
        List<OrderInfo> orderInfos = new ArrayList<OrderInfo>();
        for(int i = 0; i < orders.size(); i++){
            //根据查出来的user_id获取user_name
            User user = this.getHibernateTemplate().get(User.class, orders.get(i).getUser_id());

            OrderInfo orderInfo = new OrderInfo();
            orderInfo.setOrder_id(orders.get(i).getOrder_id());
            orderInfo.setUser_name(user.getUsername());
            orderInfo.setOrder_money(orders.get(i).getOrder_money());
            orderInfo.setCreattime(orders.get(i).getCreattime());
            if (orders.get(i).getType() == 1){
                orderInfo.setType("待付款");
            }else if (orders.get(i).getType() == 2){
                orderInfo.setType("待评价");
            }else{
                orderInfo.setType("已完成");
            }

            orderInfos.add(orderInfo);
        }
        System.out.println(orderInfos.toString());
        return orderInfos;
    }
}
