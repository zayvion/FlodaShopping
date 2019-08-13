package dao.Impl;

import dao.EcaluateDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Ecaluate;

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
        this.getHibernateTemplate().save(ecaluate);
    }

    @Override
    public List getProductEcaluate(int productId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Ecaluate.class);
        criteria.add(Restrictions.eq("product_id", productId));
        List<Ecaluate> result = (List<Ecaluate>) this.getHibernateTemplate().findByCriteria(criteria);
        return result;
    }
}
