package dao;

import pojo.Categroy;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 09:54
 * @Description:商品分类Dao
 */
public interface CategroyDao {
    /**
     * 添加商品分类
     * @param categroy
     */
    void addCategroy(Categroy categroy);

    /**
     * 查询所有类别
     * @return list
     */
    List getCategroies();

    /**
     * 分类修改
     * @param categroy
     */
    void updateCategroy(Categroy categroy);

    /**
     * 获取一个分类下的信息
     * @param id
     * @return Categroy实体
     */
    Categroy getCategroyInfo(int id);

    /**
     * 删除一个分类下的信息
     * @param id
     * @return
     */
    void delCategroy(int id);
}
