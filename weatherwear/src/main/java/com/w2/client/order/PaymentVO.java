package com.w2.client.order;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
   
   private String payId;
   private String odId;
   private String payMtd;
   private Date payDate;
   private String payStatus;
   private String clientId;
   
}