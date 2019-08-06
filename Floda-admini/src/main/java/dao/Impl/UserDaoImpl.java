package dao.Impl;

import dao.UserDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.User;

import java.util.List;

@Repository
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    /**
     * 获取用户列表
     * @return
     */
    @Override
    public List<User> getUserList() {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        List<User> list = (List<User>)this.getHibernateTemplate().findByCriteria(criteria);
        return list;
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void addUser(User user) {
        this.getHibernateTemplate().save(user);
    }
}
