package service;

import pojo.Categroy;


/**
 * @Auther: zayvion
 * @Date: 2019-08-05 10:01
 * @Description:商品分类Service
 */
public interface CategroyService {
    /**
     *  添加商品分类
     * @param categroy
     * @return json
     */
    String addCategroy(Categroy categroy);

    /**
     * 查询所有类别
     * @return json
     */
    String getCategroies();

    /**
     * 分类修改
     * @param categroy
     * @return json
     */
    String updateCategroy(Categroy categroy);

    /**
     * 获取一个分类下的信息
     * @param id
     * @return
     */
    String getCategroyInfo(int id);

    /**
     * 删除一个分类下的信息
     * @param id
     * @return
     */
    String delCategroy(int id);
}
