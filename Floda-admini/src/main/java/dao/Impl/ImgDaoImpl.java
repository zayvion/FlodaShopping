package dao.Impl;

import dao.ImgDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Img;

import java.io.Serializable;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 15:27
 * @Description:图片dao的实现类
 */
@Repository
@Transactional
public class ImgDaoImpl extends HibernateDaoSupport implements ImgDao {
    @Autowired
    public void setSF(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public int addImg(Img img) {
        Serializable id = this.getHibernateTemplate().save(img);
        return (int) id;
    }

    @Override
    @Transactional
    public void updateImg(Img img) {
        this.getHibernateTemplate().update(img);
    }

    @Override
    public Img getImg(int id) {
        Img img = this.getHibernateTemplate().get(Img.class,id);
        return img;
    }

    @Override
    public String getImgUrl(int id) {
        Img img = this.getHibernateTemplate().get(Img.class , id);
        return img.getImg_addr();
    }
}
