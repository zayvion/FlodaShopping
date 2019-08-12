package dao.Impl;

import dao.OrderDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Order;

import java.io.Serializable;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 14:53
 * @Description:订单Dao实现类
 */
@Repository
public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Transactional
    @Override
    public int addOrder(Order order) {
        Serializable id = this.getHibernateTemplate().save(order);
        return (int) id;

    }

    @Override
    public Order getOrder(int id) {
        Order order = this.getHibernateTemplate().get(Order.class, id);
        return order;
    }

    @Override
    public List<Order> getOrders() {

        return null;
    }
}
