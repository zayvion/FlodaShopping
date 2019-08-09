package dao.Impl;

import dao.FUserDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Address;
import pojo.User;
import pojo.UserAddr;

import java.util.List;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:26
 * @Description:
 */
@Repository
public class FUserDaoImpl extends HibernateDaoSupport implements FUserDao {
    @Autowired
   public void setSF(SessionFactory sessionFactory){
       super.setSessionFactory(sessionFactory);
   }

    @Override
    public void register(User user) {
        this.getHibernateTemplate().save(user);
    }

    @Override
    public User login(User user) {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        criteria.add(Restrictions.eq("username",user.getUsername()));
        List<User> list = (List<User>)this.getHibernateTemplate().findByCriteria(criteria);
        if (!list.isEmpty()){
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<UserAddr> getAddress(int user_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(UserAddr.class);
        criteria.add(Restrictions.eq("userId",user_id));
        List<UserAddr> list = (List<UserAddr>)this.getHibernateTemplate().findByCriteria(criteria);
        return list;
    }

    @Override
    public List<Address> getArea(int parent_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Address.class);
        criteria.add(Restrictions.eq("parent_id",parent_id));
        List<Address> list = (List<Address>)this.getHibernateTemplate().findByCriteria(criteria);
        return list;
    }
}
