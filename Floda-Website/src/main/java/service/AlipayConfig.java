package service;

import java.io.FileWriter;
import java.io.IOException;

/**
 * @Auther: zayvion
 * @Date: 2019-08-10 16:42
 * @Description:
 */
public class AlipayConfig {
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016100100639682";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCeUSg5XonVIhh0H/ogDs+169MtXIdIO7VusewbzHlSDiVyxBsDIxLHj9zPFYvnwgjnBKqm4Kh9dMriyQePKNMNKmFWlLgGKBKzmOJk6MtXct09tdinsMs3RqzeNp2gXOuNqAilcTfklLn+lb/MBc0eiwuyOu/DSxfr6B4/McXRo3CEg/8awikRi75lVuA+QYQe18A/gDfClPmTUiqbSLizRbljEyBwRZWjjciHBR2m3xW4zo4WQBVmH8jlQNZ2DKy/5L7y2G+3QczUQPjuh0YNqDmk1GT8nfeWr28AEQZlBVM9F7iWL9J6gbvSmk82iBSbrjpantTPz2YYe3hSSMT/AgMBAAECggEAfnptvS9mxAwiJxuo0tWiYT8Ojc2/EhkJgG7KJwc64TAGAOLkhaQOi7nF+PbIt5VPUWhsATe3w8p7j6R00o0V1w3Fh8r2HY0EK9D3BRDp6moMkBFoDcfzAa0Hy9ssIII7eQcGKU4DDi03TklKWe9EiKMi6/ejtoyWhtQA3hGgbTJ4rGeMECwErBn03/kPqraA83ParwEuJlcMX741lrKp02AkLoIJzG0g4POfy9IUCjs84li1VM1rqPdVngS9DzRsJiFtUQUBCqaSXEADm5KUWE3224snwkd3evoo67cnCtRMfnYmZUnH1CIh2HuLEM3lSw2fFCc+8oUIro29u4soMQKBgQDMUm6sEdgl9rp5LBa20joDjqK4n8gcp2+pjUPJy/VQNN8uccKHi7c2EeMO+jgpd9+W9geqiifsObjs3dWeVL3XPtl18k7/7YPdTrxoX3gYf5K7uYYXPhjTtfszzUW5IC7CLo8xW6I9qhiDfGCNsdciHFem7CopUA3b06Cu8nJppwKBgQDGW/c7Znq2h5JcstGcnXJdMpz14+2wctpQVm1TbsB8VI5p+XHsMW3qTvT1Y/lMJ3PAn+MqnR7wuOCdfE0AcFqxuE6wkwol1f83JNm01gtUjyc672/8bLet5YlgDR7AlAln+e5AEc7TisKZstc9S2apFOnfKAkTZvngRIUj/YAE6QKBgQCQkNqhgNawtcvmpF1F6aUGk0tq2hLaw1VsX/lQtLDTmTU4RWFgSmjNJwbCuCQ4owpeY6G09p+cspK3dZYJuue/fkaa/2EKD+G3GliQeMweeVU24eOQWm1yjlY4psroW276EbtbLvyyKMHDdqNSXjxbdDZIcty58lx751bPsddmDQKBgB9QYWVFNlYebOKpcCHTUTyZQuImi11xpDlOi4/CSizWhG0CbhOlcf6tXEpo7/AvwjxEgW42w62o4fy6pMVO92JbAEEr1UxHzjR8YsoDiGJe/wh0yC8HUq/nLpq1N4ebVyjM8em3ZflLTJFLBGOuxZQnswwBm/0uIoBfEM2vtUgRAoGBAK32oyPMGf/ilGm926EjKG/dPjQbLbUQWOX2tdOY/alRN+ygipR8cxdKuV1MVvX0QAuk4wyG1D7sIzhcANuveCmUxEYDBOpKoI1xOKJou8+wudFqw9ySfdwsEDqwyH/sXqQ42HQypTA5n/SJ2U2X44HiI3t66yzgJHeTWFOhwcJ1";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvLyPHrF1Fm5x4LLu0jzv+gFzf77KyWmhuesmGC/2GLtomlYnq+7AnksX5z+SuPaUXvd5dmNVEchzmX6Y0ugsxTYv4TQQGlYb69+Z9i31YiW0pSAs0v0onh1Zc9bu0rKiQ7Uk8ZM/yVuzVcWtqKbtV6KOEfaoY6BUgWwpLvK5rWv8T4Au3pqT5Pf5763fRaZnFC24KK8jZOJR92mNkiJh3+nhLph/ZF4YeJRS1Tgfyb5Ip9ZfFbfyU3vzq7IEJVeo/8snSbf+T3N7aTwQW226HX5lrlf9Zo+U8Arq80LGsFGMDhZI7/66mIaxzKPTvDzbyMHDHzUWQkBeeLp/H5nqZQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost：8080/successPay";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://www.floda.com:8080/successPay";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "/Users/zayvion/Desktop/";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
