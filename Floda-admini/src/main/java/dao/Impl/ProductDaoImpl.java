package dao.Impl;

import dao.ProductDao;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.*;
import org.hibernate.engine.query.spi.sql.NativeSQLQueryReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Img;
import pojo.OrderDetail;
import pojo.Product;

import java.beans.Expression;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 14:45
 * @Description:商品dao接口实现类
 */
@Repository
public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {
    @Autowired
    public void setSF(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public void addProduct(Product product) {
        this.getHibernateTemplate().save(product);
    }


    @Override
    @Transactional
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
        List<Product> products = (List<Product>) this.getHibernateTemplate().find("from Product where pro_status=0 order by pro_id desc");
        return products;
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = (List<Product>) this.getHibernateTemplate().find("from Product order by pro_id desc");
        return products;
    }

    @Override
    public List<Product> getSearchResult(String keyword) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
        criteria.add(Restrictions.like("pro_name", "%" + keyword + "%"));
        List<Product> products = (List<Product>) this.getHibernateTemplate().findByCriteria(criteria);
        for (Product p : products
        ) {
            Img img = this.getHibernateTemplate().get(Img.class, p.getPro_imgId());
            p.setPro_imgAddr(img.getImg_addr());
        }
        return products;
    }

    @Override
    public List<Product> getHotProducts() {
        List<Product> products = new ArrayList<>();
        List<Object[]> list = (List<Object[]>) this.getHibernateTemplate().find("select pro_order_id as id,count(pro_order_id) as num from OrderDetail group by pro_order_id order by num desc ");
        for(int i = 0 ;i <4 ;i++){
            if (i< list.size()-1){
                Object[] o = list.get(i);
                Product product = this.getHibernateTemplate().get(Product.class, (int) o[0]);
                Img img = this.getHibernateTemplate().get(Img.class, product.getPro_imgId());
                product.setPro_imgAddr(img.getImg_addr());
                products.add(product);
            }else {
                continue;
            }
        }
        System.out.println(products);
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

    @Override
    public List<Product> getProByCate(int cate_id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
        criteria.add(Restrictions.eq("pro_cateId", cate_id));
        criteria.add((Restrictions.eq("pro_status", 0)));
        criteria.addOrder(Order.desc("pro_id"));
        List<Product> list = (List<Product>) this.getHibernateTemplate().findByCriteria(criteria);
        for (Product p : list
        ) {
            Img img = this.getHibernateTemplate().get(Img.class, p.getPro_imgId());
            p.setPro_imgAddr(img.getImg_addr());
        }
        return list;
    }
}
