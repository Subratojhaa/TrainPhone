package com.subrat.Project5.service;


import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;



@Service
public class SmsService {

    private static final String ACCOUNT_SID = "AC53b493f484ac6d754c7431564ab1dd84"; // Replace with your Twilio SID
    private static final String AUTH_TOKEN = "e54dbdcf6750e0f1867a0afe597bc1ef"; // Replace with your Twilio Auth Token
    private static final String FROM_PHONE = "+919114500734"; // Your Twilio number

    static {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
    }

    public void sendSMS(String toPhone, String messageBody) {
        Message message = Message.creator(
                new PhoneNumber(toPhone),
                new PhoneNumber(FROM_PHONE),
                messageBody
        ).create();

        System.out.println("SMS sent with SID: " + message.getSid());
    }
}
