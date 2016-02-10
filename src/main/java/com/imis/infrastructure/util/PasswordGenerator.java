package com.imis.infrastructure.util;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import java.util.Random;

/**
 * Created by Bright Huang on 11/3/14.
 */
public class PasswordGenerator {

    public static String encryptPassword(String password, String salt){
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();
        return md5.encodePassword(password, salt);
    }


}
