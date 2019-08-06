package dao.Impl;

import dao.UserDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.User;
import java.io.Serializable;
import java.util.List;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:26
 * @Description:
 */
@Repository
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Autowired
   public void setSF(SessionFactory sessionFactory){
       super.setSessionFactory(sessionFactory);
   }

    @Override
    public String register(User user) {
        Serializable id = this.getHibernateTemplate().save(user);
        System.out.println("注册的ID："+id);
        return (String) id;
    }

    @Override
    public boolean login(User user) {
        User u = new User();
        Object[] values = {user.getUsername(),user.getPassword()};
        List<User> users = (List<User>) this.getHibernateTemplate().find("from User where username=? and password=?",values);
        if (users.get(0) != null){
            return true;
        }
        return false;
    }
}
