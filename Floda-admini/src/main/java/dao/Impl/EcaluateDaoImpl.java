package dao.Impl;

import dao.EcaluateDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Ecaluate;
import pojo.Order;
import pojo.OrderDetail;

import java.io.Serializable;
import java.util.List;

/**
 * @Auther: zwf97
 * @Date: 2019/8/6 14:11
 * @Description:查看评论Dao的实现类
 */
@SuppressWarnings("unchecked")
@Repository
public class EcaluateDaoImpl extends HibernateDaoSupport implements EcaluateDao {

    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public List getEcaluates() {
        DetachedCriteria criteria = DetachedCriteria.forClass(Ecaluate.class);
        List<Ecaluate> ecaluates = (List<Ecaluate>)this.getHibernateTemplate().findByCriteria(criteria);
        return ecaluates;
    }

    @Override
    public void addEcaluate(Ecaluate ecaluate) {
        int id = (int)this.getHibernateTemplate().save(ecaluate);
        if (id > 0){
            DetachedCriteria criteria = DetachedCriteria.forClass(OrderDetail.class);
            criteria.add(Restrictions.eq("order_id",ecaluate.getOrder_id()));
            List<OrderDetail> list = (List<OrderDetail>)this.getHibernateTemplate().findByCriteria(criteria);
            //记录当前订单所有商品是否都被评论,如果都被评论，那么就把当前订单的状态修改为已评价
            boolean allIsEcal = true;
            for (OrderDetail o:list) {
                //修改订单详情表里面的状态
                if (o.getPro_order_id() == ecaluate.getProduct_id()){
                    o.setIsEvaluate(1);
                }
                //当前订单所有的商品都被评价了以后把订单状态改为已评价
                if (o.getIsEvaluate() == 0){
                    allIsEcal = false;
                }
            }
            if (allIsEcal){
                Order order = this.getHibernateTemplate().get(Order.class, ecaluate.getOrder_id());
                order.setType(3);
                System.err.println(order+"----");
            }

        }
    }

    @Override
    public List getProductEcaluate(int productId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Ecaluate.class);
        criteria.add(Restrictions.eq("product_id", productId));
        List<Ecaluate> result = (List<Ecaluate>) this.getHibernateTemplate().findByCriteria(criteria);
        return result;
    }

    @Override
    public Ecaluate getEcaluateWithOrderAndUser(int orderId, int productId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Ecaluate.class);
        criteria.add(Restrictions.eq("product_id", productId));
        criteria.add(Restrictions.eq("order_id", orderId));
        List<Ecaluate> list = (List<Ecaluate>) this.getHibernateTemplate().findByCriteria(criteria);
        return list.get(0);

    }
}
