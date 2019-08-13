package dao.Impl;

import dao.OrderDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Img;
import pojo.Order;
import pojo.OrderDetail;
import pojo.Product;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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

    @Override
    public List<Order> getOrders(int user_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
        criteria.add(Restrictions.eq("user_id",user_id));
        List<Order> list = (List<Order>)this.getHibernateTemplate().findByCriteria(criteria);
        return list;
    }

    @Override
    public List<OrderDetail> getProByOrderId(int orderId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(OrderDetail.class);
        criteria.add(Restrictions.eq("order_id",orderId));
        List<OrderDetail> list = (List<OrderDetail>)this.getHibernateTemplate().findByCriteria(criteria);
        for (OrderDetail o:list
             ) {
            Product product = this.getHibernateTemplate().get(Product.class, o.getPro_order_id());
            Img img = this.getHibernateTemplate().get(Img.class, product.getPro_imgId());
            o.setImgAddr(img.getImg_addr());
            //还要判断当前商品是否已经投过票，如果投过票就不显示

        }
        System.err.println(list);
        return list;
    }

    @Transactional
    @Override
    public void updateOrder(Order order) {
        this.getHibernateTemplate().update(order);
    }
}
