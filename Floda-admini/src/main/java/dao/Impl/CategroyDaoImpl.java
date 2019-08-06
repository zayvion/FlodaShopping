package dao.Impl;


import dao.CategroyDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import pojo.Categroy;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 09:56
 * @Description:商品分类Dao的实现类
 */
@SuppressWarnings("unchecked")
@Repository
public class CategroyDaoImpl extends HibernateDaoSupport implements CategroyDao {
    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }
    @Override
    public void addCategroy(Categroy categroy) {
        this.getHibernateTemplate().save(categroy);
    }

    @Override
    public List getCategroies() {
        List<Categroy> categroies = (List<Categroy>) this.getHibernateTemplate().find("from Categroy");
        return categroies;
    }

    @Override
    public void updateCategroy(Categroy categroy) {
        Categroy c = this.getHibernateTemplate().get(Categroy.class, categroy.getCate_id());
        //getHibernateTemplate().setCheckWriteOperations(false);
        c.setCate_name(categroy.getCate_name());
        c.setCate_desc(categroy.getCate_desc());
        this.getHibernateTemplate().update(c);
    }

    @Override
    public Categroy getCategroyInfo(int id) {
        Categroy categroy = this.getHibernateTemplate().get(Categroy.class, id);
        return categroy;
    }

    @Override
    public void delCategroy(int id) {
        Categroy categroy = this.getHibernateTemplate().get(Categroy.class, id);
        this.getHibernateTemplate().delete(categroy);
    }
}
