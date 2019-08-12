package action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import utils.MailUtil;

import java.util.Random;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 18:19
 * @Description:发送邮件action
 */
@Controller
@Scope("prototype")
public class MailAction extends BaseAction {

    private String mailBox;

    public String sendMail() {
        String code = getNumber(4);
        MailUtil.sendMail(mailBox,code);
        session.put("mailcode",code);
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

    public String getMailBox() {
        return mailBox;
    }

    public void setMailBox(String mailBox) {
        this.mailBox = mailBox;
    }
}
