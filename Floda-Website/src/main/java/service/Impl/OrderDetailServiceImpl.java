package service.Impl;

import dao.ImgDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.OrderDetail;
import pojo.Product;
import service.OrderDetailService;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 14:53
 * @Description:订单详情service实现类
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ImgDao imgDao;

    @Override
    public List getOrderDetail(int orderId) {
        List<OrderDetail> orderDetails = orderDetailDao.getOrderDetail(orderId);
        for(OrderDetail od:orderDetails){
            Product product = productDao.getProduct(od.getPro_order_id());
            String imgUrl = imgDao.getImgUrl(product.getPro_imgId());
            od.setImgAddr(imgUrl);
        }
        return orderDetails;
    }
}
