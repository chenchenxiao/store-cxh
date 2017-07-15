package com.store.util;

import com.store.model.Mail;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;


/**
 * 邮件工具类
 * 
 * @author Switch
 * @data 2016年10月23日
 * @version V1.0
 */
public class MailUtils {
    /**
     * 发送邮件
     *
     * @param
     *
     */
    public static String send(String emailAddress) {
        String checkNumber = CheckNumberUtil.getCheckNumber();
        Mail mail = new Mail();
        mail.setHost("smtp.qq.com");    // 设置邮件服务器，如果是QQ之外的，自己找
        mail.setPortNumber("465");      // 设置邮件服务器端口，默认25
        mail.setSender("1275043312@qq.com");      // 发送人
        mail.setName("cxh的商城");            // 发送人昵称
        mail.setReceiver(emailAddress);    // 接收人
        mail.setUsername("1275043312@qq.com");    // 登录账号
        mail.setPassword("wboplegqfoldhibj");   //登录密码，就是生成授权验证码
        mail.setSubject("商城邮箱验证");          // 设置邮件的标题
        mail.setMessage("cxh的商城：你本次的校验码为:" + checkNumber);      // 邮件的内容
        //发送email对象
        HtmlEmail email = new HtmlEmail();
        try {
            //这里是SMTP发送服务器的名字  
            email.setHostName(mail.getHost());
            //端口号不为空时,用户自定义的端口号为SMTP发送服务器端口号  
            if(!"".equals(mail.getPortNumber())){
                email.setSSLOnConnect(true);
                email.setSslSmtpPort(mail.getPortNumber());
            }
            //字符编码集的设置
            email.setCharset(Mail.ENCODING);
            //收件人的邮箱    
            email.addTo(mail.getReceiver());
            //发送人的邮箱    
            email.setFrom(mail.getSender(), mail.getName());
            // 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码    
            email.setAuthentication(mail.getUsername(), mail.getPassword());
            // 要发送的邮件主题    
            email.setSubject(mail.getSubject());
            // 要发送的信息，由于使用了HtmlEmail，可以在邮件内容中使用HTML标签    
            email.setMsg(mail.getMessage());
            // 发送    
            email.send();
        }catch(EmailException e) {
            e.printStackTrace();
        }
        return checkNumber;
    }
}