package dao.Impl;

import dao.CartDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.*;

import java.util.ArrayList;
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

    @Override
    public List getCartInfos(int user_id) {
        //查询购物车信息
        DetachedCriteria criteria = DetachedCriteria.forClass(Cart.class);
        criteria.add(Restrictions.eq("user_id",user_id));
        List<Cart> carts = (List<Cart>)this.getHibernateTemplate().findByCriteria(criteria);
        List<CartInfo> cartInfos = new ArrayList<CartInfo>();
        for (int i = 0; i < carts.size(); i++){
            //根据查出来的商品id：查询商品信息
            Product pro = this.getHibernateTemplate().get(Product.class, carts.get(i).getProduct_id());
            //根据查出来的图片id：查询图片信息
            Img img = this.getHibernateTemplate().get(Img.class, pro.getPro_imgId());
            //给CartInfo(pojo)赋值
            CartInfo cartInfo = new CartInfo();
            cartInfo.setCart_id(carts.get(i).getCart_id());
            cartInfo.setPro_id(pro.getPro_id());
            cartInfo.setUrl(img.getImg_addr());
            cartInfo.setPro_name(pro.getPro_name());
            cartInfo.setPro_price(pro.getPro_price());
            cartInfo.setPro_number(carts.get(i).getPro_number());
            cartInfo.setCart_price(carts.get(i).getCart_price());
            cartInfos.add(cartInfo);
        }
        return cartInfos;
    }

    @Transactional
    @Override
    public void delCart(int cart_id) {
        Cart cart = this.getHibernateTemplate().get(Cart.class, cart_id);
        this.getHibernateTemplate().delete(cart);
    }

}
