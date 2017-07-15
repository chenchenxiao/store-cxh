package com.store.model;

/**
 * Created by 陈晓海 on 2017/7/14.
 */

import java.io.Serializable;

/**
 * Mail属性实体
 *
 * @author shadow
 *
 */
@SuppressWarnings("serial")
public class Mail implements Serializable {
    /**
     * 序列号
     */
    private static final long serialVersionUID = -3562218214168975242L;

    /**
     * 邮件编码
     */
    public static final String ENCODING = "UTF-8";

    /**
     * 服务器地址
     */
    private String host;

    /**
     * 服务器端口号
     */
    private String portNumber;

    /**
     * 发件人的邮箱
     */
    private String sender;

    /**
     * 收件人的邮箱
     */
    private String receiver;

    /**
     * 发件人昵称
     */
    private String name;

    /**
     * 发件人账号
     */
    private String username;

    /**
     * 发件人密码
     */
    private String password;

    /**
     * 邮件的主题
     */
    private String subject;

    /**
     * 信息
     */
    private String message;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public static String getENCODING() {
        return ENCODING;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPortNumber() {
        return portNumber;
    }

    public void setPortNumber(String portNumber) {
        this.portNumber = portNumber;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
