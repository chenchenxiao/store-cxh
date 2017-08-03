
package com.store.ws.emailValidate;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
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
 *         &lt;element name="ValidateEmailAddressProResult" type="{http://www.w3.org/2001/XMLSchema}unsignedByte"/>
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
    "validateEmailAddressProResult"
})
@XmlRootElement(name = "ValidateEmailAddressProResponse")
public class ValidateEmailAddressProResponse {

    @XmlElement(name = "ValidateEmailAddressProResult")
    @XmlSchemaType(name = "unsignedByte")
    protected short validateEmailAddressProResult;

    /**
     * ��ȡvalidateEmailAddressProResult���Ե�ֵ��
     * 
     */
    public short getValidateEmailAddressProResult() {
        return validateEmailAddressProResult;
    }

    /**
     * ����validateEmailAddressProResult���Ե�ֵ��
     * 
     */
    public void setValidateEmailAddressProResult(short value) {
        this.validateEmailAddressProResult = value;
    }

}
