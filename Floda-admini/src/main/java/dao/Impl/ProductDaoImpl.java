package dao.Impl;

import dao.ProductDao;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Img;
import pojo.Product;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 14:45
 * @Description:商品dao接口实现类
 */
@Repository
public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {
    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }
    @Override
    public void addProduct(Product product) {
        this.getHibernateTemplate().save(product);
    }

    @Override
    public void updateProduct(Product product) {
        Product p = this.getHibernateTemplate().get(Product.class, product.getPro_id());
        p.setPro_desc(product.getPro_desc());
        p.setPro_name(product.getPro_name());
        p.setPro_numbers(product.getPro_numbers());
        p.setPro_price(product.getPro_price());
        p.setPro_status(product.getPro_status());
        this.getHibernateTemplate().update(p);
    }

    @Override
    public List<Product> getProducts() {
        List<Product> products = (List<Product>) this.getHibernateTemplate().find("from Product order by pro_id desc");
        return products;
    }

    @Override
    public int getProductCount() {
        List<?> list = this.getHibernateTemplate().find("from Product");
        return list.size();
    }

    @Override
    public Product getProduct(int id) {
        Product product = this.getHibernateTemplate().get(Product.class, id);
        return product;
    }

    @Override
    public void updateProductImg(Img img) {
      this.getHibernateTemplate().update(img);
    }
}
