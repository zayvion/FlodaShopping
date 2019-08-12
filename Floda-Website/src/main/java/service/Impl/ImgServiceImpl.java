package service.Impl;

import dao.ImgDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Img;
import service.ImgService;

import javax.annotation.Resource;

/**
 * @Auther: dc
 * @Date: 2019/8/12 14:09
 * @Description:
 */
@Service
public class ImgServiceImpl implements ImgService {

    @Resource
    private ImgDao imgDao;

    @Override
    @Transactional
    public int addImg(Img img) {
        return imgDao.addImg(img);
    }

    @Override
    @Transactional
    public void updateImg(Img img) {
        imgDao.updateImg(img);
    }
}
