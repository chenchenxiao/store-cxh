
package com.store.ws.emailValidate;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="theEmail" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="theEmailPort" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "theEmail",
    "theEmailPort"
})
@XmlRootElement(name = "ValidateEmailAddressPro")
public class ValidateEmailAddressPro {

    protected String theEmail;
    protected int theEmailPort;

    /**
     * ��ȡtheEmail���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTheEmail() {
        return theEmail;
    }

    /**
     * ����theEmail���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTheEmail(String value) {
        this.theEmail = value;
    }

    /**
     * ��ȡtheEmailPort���Ե�ֵ��
     * 
     */
    public int getTheEmailPort() {
        return theEmailPort;
    }

    /**
     * ����theEmailPort���Ե�ֵ��
     * 
     */
    public void setTheEmailPort(int value) {
        this.theEmailPort = value;
    }

}
