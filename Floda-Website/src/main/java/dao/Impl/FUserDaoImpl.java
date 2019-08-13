package dao.Impl;

import dao.FUserDao;
import org.apache.commons.lang3.ArrayUtils;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.*;
import utils.MD5Util;

import java.io.Serializable;
import java.util.List;
import java.util.Random;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:26
 * @Description:
 */
@Repository
public class FUserDaoImpl extends HibernateDaoSupport implements FUserDao {

    @Autowired
    public void setSF(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public void register(User user) {
        this.getHibernateTemplate().save(user);
    }

    @Override
    public User login(User user) {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        criteria.add(Restrictions.eq("username", user.getUsername()));
        List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<UserAddr> getAddress(int user_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(UserAddr.class);
        criteria.add(Restrictions.eq("userId", user_id));
        List<UserAddr> list = (List<UserAddr>) this.getHibernateTemplate().findByCriteria(criteria);
        for (UserAddr u : list
        ) {
            String[] addr = u.getReceiver_addr().split(",");
            StringBuffer buffer = new StringBuffer();
            for (int i = 0; i < addr.length - 1; i++) {
                if (!addr[i].equals("")||!addr[i].equals("null")) {
                    System.out.println(addr[i]);
                    Address address = this.getHibernateTemplate().get(Address.class, Integer.parseInt(addr[i]));
                    buffer.append(address.getArea_name());
                }
            }
            u.setReceiver_addr(buffer.append(addr[addr.length - 1]).toString());
        }
        return list;
    }

    @Override
    public List<Address> getArea(int parent_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Address.class);
        criteria.add(Restrictions.eq("parent_id", parent_id));
        List<Address> list = (List<Address>) this.getHibernateTemplate().findByCriteria(criteria);
        return list;
    }

    @Override
    public void addAddress(UserAddr userAddr) {
        this.getHibernateTemplate().save(userAddr);
    }

    @Override
    public void removeAddr(int user_addr_id) {
        UserAddr userAddr = this.getHibernateTemplate().get(UserAddr.class, user_addr_id);
        this.getHibernateTemplate().delete(userAddr);
    }

    @Override
    public UserAddr getAddrById(int user_addr_id) {
        UserAddr userAddr = this.getHibernateTemplate().get(UserAddr.class, user_addr_id);
        String[] addr = userAddr.getReceiver_addr().split(",");
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < addr.length - 1; i++) {
            if (!addr[i].equals("")||!addr[i].equals("null")) {
                System.out.println(addr[i]);
                Address address = this.getHibernateTemplate().get(Address.class, Integer.parseInt(addr[i]));
                buffer.append(address.getArea_name());
            }
        }
        userAddr.setReceiver_addr(buffer.append(addr[addr.length - 1]).toString());
        return userAddr;
    }

    @Override
    public void updateAddress(UserAddr userAddr) {
        this.getHibernateTemplate().update(userAddr);
    }

    @Override
    public UserInfo getUserInfo(int user_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(UserInfo.class);
        criteria.add(Restrictions.eq("user_id",user_id));
        List<UserInfo> list = (List<UserInfo>)this.getHibernateTemplate().findByCriteria(criteria);
        if (!list.isEmpty()){
            Img img = this.getHibernateTemplate().get(Img.class, list.get(0).getHead());
            if (img != null){
                list.get(0).setHeadAddr(img.getImg_addr());
            }
            return list.get(0);
        }
        return null;
    }

    @Override
    public void updateUserInfo(UserInfo userInfo) {
        UserInfo info = this.getHibernateTemplate().get(UserInfo.class, userInfo.getUserInfo_id());
        if (info == null){
            System.out.println("添加个人信息");
            this.getHibernateTemplate().save(userInfo);
        }else {
            info.setUser_id(userInfo.getUser_id());
            info.setName(userInfo.getName());
            info.setEmail(userInfo.getEmail());
            info.setSex(userInfo.getSex());
            info.setHead(userInfo.getHead());
            System.out.println("修改个人信息");
        }
    }

    @Override
    public void changePwd(String current_pwd,int user_id) {
        User user = this.getHibernateTemplate().get(User.class, user_id);
        user.setPassword(MD5Util.getMD5(current_pwd));
        System.err.println(user+"更新后的用户密码");
        this.getHibernateTemplate().update(user);
    }
}
