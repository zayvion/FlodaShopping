package service;

import pojo.Ecaluate;

/**
 * @Auther: zwf
 * @Date: 2019-08-06 14:26
 * @Description:查看评论Service
 */
public interface EcaluateService {
    /**
     * 查询所有评论
     * @return json
     */
    String getEcaluates();

    /**
     * 增加评论
     * @param ecaluate
     * @return json
     */
    String addEcaluate(Ecaluate ecaluate);
}
