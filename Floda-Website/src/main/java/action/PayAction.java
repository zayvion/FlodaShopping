package action;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.google.gson.Gson;
import dao.CartDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import pojo.*;
import service.AlipayConfig;
import service.AlipayTrade;
import service.CartService;
import service.ProductService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Auther: zayvion
 * @Date: 2019-08-10 17:02
 * @Description:支付的action
 */
@Component
@Scope("prototype")
public class PayAction extends BaseAction {

    @Autowired
    private CartDao cartDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private AlipayTrade alipayTrade;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private ProductService productService;
    private String out_trade_no;
    private String total_amount;
    private int addr_id;
    private float total;
    private int user_id;
    private int orderId;

    /**
     * 创建订单
     *
     * @return
     * @throws IOException
     * @throws AlipayApiException
     */
    public String createOrder() throws IOException, AlipayApiException {
        User user = (User) session.get("onliner");
        //新建一个订单
        Order order = new Order();
        order.setCreattime(new Timestamp(new Date().getTime()));
        //设置为未付款状态
        order.setType(1);
        order.setUser_id(user.getUser_id());
        order.setAddr_id(addr_id);
        order.setOrder_money(total);
        int orderId = orderDao.addOrder(order);
        List<CartInfo> cartInfos = cartDao.getCartInfos(user.getUser_id());
        for (CartInfo c : cartInfos) {
            //订单详情信息
            OrderDetail orderDetail = new OrderDetail();
            Product product = productDao.getProduct(c.getPro_id());
            orderDetail.setPro_name(product.getPro_name());
            orderDetail.setPro_number(c.getPro_number());
            orderDetail.setPro_price(product.getPro_price());
            orderDetail.setOrder_id(orderId);
            orderDetail.setPro_order_id(product.getPro_id());
            orderDetailDao.addOrderDetail(orderDetail);
            //放入订单就删除购物车
            cartDao.delCart(c.getCart_id());
            //放入订单后商品库存减少1
            product.setPro_numbers(product.getPro_numbers()-1);
            //如果商品库存小于0，商品下架
            if (product.getPro_numbers() <= 0){
                product.setPro_status(1);
            }
            productService.updateProduct(product);
        }
        String pagepay = alipayTrade.Pagepay(super.request,total,orderId);
        request.setAttribute("result", pagepay);
        return PAY;
    }

    /**
     * 如果用户之前取消了订单的支付，在个人中心里继续支付将调用这个方法
     * @return
     * @throws IOException
     * @throws AlipayApiException
     */
    public String finishPay() throws IOException, AlipayApiException {
        Order order = orderDao.getOrder(orderId);
        String pagepay = alipayTrade.Pagepay(super.request, (float) order.getOrder_money(),order.getOrder_id());
        request.setAttribute("result", pagepay);
        return PAY;
    }

    public String successPay() throws UnsupportedEncodingException, AlipayApiException {
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        if (signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
            request.setAttribute("out_trade_no", out_trade_no);
            request.setAttribute("total_amount", total_amount);

            if (trade_status.equals("TRADE_FINISHED")) {

            } else if (trade_status.equals("TRADE_SUCCESS")) {
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
            }
            System.out.println("success");

        } else {//验证失败
            System.out.println("fail");

        }
        Order order = orderDao.getOrder(Integer.parseInt(out_trade_no));
        //付款完成后设置为已付款账号
        order.setType(2);
        orderDao.updateOrder(order);
        return PAYSUCCESS;

    }

    public String getOrders(){
        try {
            List<Order> orders = orderDao.getOrders(user_id);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(new Gson().toJson(orders));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    };

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(String total_amount) {
        this.total_amount = total_amount;
    }

    public int getAddr_id() {
        return addr_id;
    }

    public void setAddr_id(int addr_id) {
        this.addr_id = addr_id;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
