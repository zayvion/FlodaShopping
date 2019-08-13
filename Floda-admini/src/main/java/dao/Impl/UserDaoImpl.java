package dao.Impl;

import dao.UserDao;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Img;
import pojo.User;
import pojo.UserInfo;

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
     * 查询用户详细信息
     * @param user_id
     * @return
     */
    @Override
    public UserInfo info(int user_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(UserInfo.class);
        criteria.add(Restrictions.eq("user_id",user_id));
        List<UserInfo> list = (List<UserInfo>)this.getHibernateTemplate().findByCriteria(criteria);
        if (list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public void stopUser(int user_id) {
        User user = this.getHibernateTemplate().get(User.class, user_id);
        user.setStatus(1);
        this.getHibernateTemplate().update(user);
    }

    @Override
    public void startUser(int user_id) {
        User user = this.getHibernateTemplate().get(User.class, user_id);
        user.setStatus(0);
        this.getHibernateTemplate().update(user);
    }

    @Override
    public User LoginUser(String username) {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        criteria.add(Restrictions.eq("username",username));
        List<User> list = (List<User>)this.getHibernateTemplate().findByCriteria(criteria);
        return list.get(0);
    }

    @Override
    public User getUser(int id) {
        User user = this.getHibernateTemplate().get(User.class, id);
        return user;
    }

    @Override
    public String getUserImg(int id) {
        User user = this.getHibernateTemplate().get(User.class, id);
        UserInfo u = (UserInfo) this.getHibernateTemplate().find("from UserInfo where user_id =?", user.getUser_id()).get(0);
        Img img = this.getHibernateTemplate().get(Img.class, u.getHead());
        return img.getImg_addr();
    }
}
