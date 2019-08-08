package dao.Impl;

import dao.CartDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Cart;
import pojo.Product;
import pojo.User;

import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019/8/8 9:27
 * @Description: 购物车DAO的实现类
 */
@Repository
public class CartDaoImpl extends HibernateDaoSupport implements CartDao{
    @Autowired
   public void setSF(SessionFactory sessionFactory){
       super.setSessionFactory(sessionFactory);
   }


    @Override
    public void addCart(int pro_id, int user_id, int pro_number) {
        Cart cart = new Cart();
        cart.setProduct_id(pro_id);
        cart.setUser_id(user_id);
        cart.setPro_number(pro_number);
        DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
        criteria.add(Restrictions.eq("pro_id",pro_id));
        List<Product> list = (List<Product>)this.getHibernateTemplate().findByCriteria(criteria);
        double cart_price = list.get(0).getPro_price()*pro_number;
        cart.setCart_price(cart_price);
        this.getHibernateTemplate().save(cart);
    }
}
