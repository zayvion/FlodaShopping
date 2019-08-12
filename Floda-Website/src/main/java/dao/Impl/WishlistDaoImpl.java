package dao.Impl;

import dao.WishlistDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019/8/10 10:20
 * @Description: 收藏DAO的实现类
 */
@Repository
public class WishlistDaoImpl extends HibernateDaoSupport implements WishlistDao {
    @Autowired
   public void setSF(SessionFactory sessionFactory){
       super.setSessionFactory(sessionFactory);
   }


    @Override
    public void addWishlist(int pro_id, int user_id) {
        //先查是否之前存过
        DetachedCriteria criteria = DetachedCriteria.forClass(Wishlist.class);
        criteria.add(Restrictions.eq("user_id",user_id));
        criteria.add(Restrictions.eq("product_id",pro_id));
        List<Wishlist> list = (List<Wishlist>) this.getHibernateTemplate().findByCriteria(criteria);
       if (list.size()==0){
           Wishlist wishlist = new Wishlist();
           wishlist.setProduct_id(pro_id);
           wishlist.setUser_id(user_id);
           this.getHibernateTemplate().save(wishlist);
       }
    }

    @Override
    public List getWishlistInfos(int user_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Wishlist.class);
        criteria.add(Restrictions.eq("user_id",user_id));
        List<Wishlist> wishlists = (List<Wishlist>) this.getHibernateTemplate().findByCriteria(criteria);
        List<WishlistInfo> wishlistInfos  = new ArrayList<WishlistInfo>();
        for (int i = 0; i < wishlists.size(); i++){
            //根据查出来的商品id：查询商品信息
            Product pro = this.getHibernateTemplate().get(Product.class, wishlists.get(i).getProduct_id());
            System.out.println("aaaaaaa"+wishlists.get(i).getProduct_id());
            //根据查出来的图片id：查询图片信息
            Img img = this.getHibernateTemplate().get(Img.class, pro.getPro_imgId());
            //给wishlistInfo(pojo)赋值
            WishlistInfo wishlistInfo = new WishlistInfo();

            wishlistInfo.setWishlist_id(wishlists.get(i).getWishlist_id());
            wishlistInfo.setUser_id(user_id);
            wishlistInfo.setPro_id(pro.getPro_id());
            wishlistInfo.setUrl(img.getImg_addr());
            wishlistInfo.setPro_name(pro.getPro_name());
            wishlistInfo.setPro_price(pro.getPro_price());
            wishlistInfos.add(wishlistInfo);
        }
        return wishlistInfos;
    }

    @Override
    public void delWishlist(int wishlist_id) {
        Wishlist wishlist = this.getHibernateTemplate().get(Wishlist.class, wishlist_id);
        this.getHibernateTemplate().delete(wishlist);
    }
}
