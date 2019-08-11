package action;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import org.json.JSONException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.Random;

/**
 * @Auther: zayvion
 * @Date: 2019-08-10 10:43
 * @Description:腾讯云SMS,注册时发送验证码
 */
@Controller("smsAction")
@Scope("prototype")
public class SMSAction extends BaseAction{
    // 短信应用 SDK AppID
    private int appid = 1400241088; // SDK AppID
    // 短信应用 SDK AppKey
    private String appkey = "db2521edbfd1e059c2b1f88dc17b6df3";
    // 需要发送短信的手机号码
    private String phoneNumber;
    // 短信模板 ID，需要在短信应用中申请
    private int templateId = 393265;
    // 签名
    private String smsSign = "lzllzlcn";

    public String sendRegSMS(){
        System.out.println("phoneNumber:"+phoneNumber);
        String code = getNumber(4);
        System.out.println("code:"+ code);
        String params[]={code};
       try {
            SmsSingleSender ssender = new SmsSingleSender(appid, appkey);
            SmsSingleSenderResult result = ssender.sendWithParam("86", phoneNumber.trim(),
                    templateId, params, smsSign, "", "");
            System.out.println(result);
            //验证码放入session
            session.put("code",code);
        } catch (HTTPException e) {
            // HTTP 响应码错误
            e.printStackTrace();
        } catch (JSONException e) {
            // JSON 解析错误
            e.printStackTrace();
        } catch (IOException e) {
            // 网络 IO 错误
            e.printStackTrace();
        }
        return NONE;
    }

    public String getNumber(int n) {
        String str = "1234567890qwertyuioplkjhgfdsazxcvbnm";
        Random r = new Random();
        String ss = "";
        for (int i = 0; i < n; i++) {
            char c = str.charAt(r.nextInt(str.length()));
            ss = ss + c;
        }
        return ss;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}
