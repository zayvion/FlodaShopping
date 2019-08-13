package dao.Impl;

import dao.OrderDetailDao;
import org.apache.xmlbeans.impl.xb.xsdschema.RestrictionDocument;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.OrderDetail;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 14:40
 * @Description:订单详情的实现类
 */
@Repository
public class OrderDetailDaoImpl extends HibernateDaoSupport implements OrderDetailDao {
    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Transactional
    @Override
    public void addOrderDetail(OrderDetail orderDetail) {
        this.getHibernateTemplate().save(orderDetail);

    }

    @Transactional
    @Override
    public List getOrderDetail(int orderId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(OrderDetail.class);
        criteria.add(Restrictions.eq("order_id",orderId));
        List<OrderDetail> result = (List<OrderDetail>) this.getHibernateTemplate().findByCriteria(criteria);
        return result;
    }
}
