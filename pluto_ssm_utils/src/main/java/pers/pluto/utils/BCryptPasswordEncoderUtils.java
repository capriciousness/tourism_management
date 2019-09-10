package pers.pluto.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();
    public static String encodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }

    public static void main(String[] args) {
        String password="123456";
        String pwd = encodePassword(password);
        //$2a$10$i0wpJMEdTBp7c.T..IZ0veaMhbtG1Z446k6R3Ljbm/ooZYTgiGumK
        System.out.print(pwd);
    }
}
