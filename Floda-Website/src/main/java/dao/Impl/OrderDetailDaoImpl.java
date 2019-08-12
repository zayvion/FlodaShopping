package dao.Impl;

import dao.OrderDetailDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.OrderDetail;

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
}
