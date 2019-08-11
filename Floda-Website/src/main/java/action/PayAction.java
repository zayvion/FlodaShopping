package action;

import com.alipay.api.AlipayApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import service.AlipayTrade;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * @Auther: zayvion
 * @Date: 2019-08-10 17:02
 * @Description:支付的action
 */
@Component
@Scope("prototype")
public class PayAction extends BaseAction{
    @Autowired
    private AlipayTrade alipayTrade;

    public String pay() throws IOException, AlipayApiException {
        String pagepay = alipayTrade.Pagepay(super.request);
        request.setAttribute("result",pagepay);

        return PAY;
    }

    public String successPay(){

        return "paysuccess";
    }
}
