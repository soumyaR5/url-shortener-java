package com.urlshortner.util;

public class TestCode {

    public static void main(String[] args) {

        for(int i=1;i<=5;i++) {

            System.out.println(
                    ShortCodeGenerator.generateCode()
            );
        }
    }
}