package utils;

import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;


public class MessageCode {
    private final Integer NUM = 6;

    public void sendMessage(String mobile, HttpServletRequest request) {
        String url = "http://gw.api.taobao.com/router/rest";
        String appkey = "23601562";
        String secret = "4f58489f0a9b3b574654352c2efb0952";
        String code = "";
        Random r = new Random(new Date().getTime());
        for (int i = 0; i < NUM; i++) {
            code = code + r.nextInt(10);
        }
        request.getSession().setAttribute("messageCode", code);
        String json = "{\"code\":\"" + code + "\"}";
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
        req.setExtend("");
        req.setSmsType("normal");
        req.setSmsFreeSignName("测试");
        req.setSmsParamString(json);
        String phone = (String) request.getSession().getAttribute("phone");
        req.setRecNum(phone);
        req.setSmsTemplateCode("SMS_41580034");
        @SuppressWarnings("unused")
        AlibabaAliqinFcSmsNumSendResponse rsp = null;
        try {
            rsp = client.execute(req);
        } catch (ApiException e) {
            e.printStackTrace();
        }
    }
}