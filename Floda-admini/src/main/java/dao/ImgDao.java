package dao;

import pojo.Img;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 15:25
 * @Description:图片相关dao接口
 */
public interface ImgDao {
    /**
     * 新增图片
     * @param img
     * @return 返回主键
     */
    int addImg(Img img);

    /**
     * 修改(更新)图片
     * @param img
     */
    void updateImg(Img img);

    /**
     * 获取一张图片的信息
     * @param id
     * @return
     */
    Img getImg(int id);

    /**
     * 获取图片的url
     * @param id
     * @return
     */
    String getImgUrl(int id);
}
