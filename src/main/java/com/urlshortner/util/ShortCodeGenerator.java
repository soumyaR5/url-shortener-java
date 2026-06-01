package com.urlshortner.util;

import java.util.Random;

public class ShortCodeGenerator {

    private static final String CHARACTERS =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    private static final int LENGTH = 6;

    public static String generateCode() {

        Random random = new Random();

        StringBuilder code = new StringBuilder();

        for (int i = 0; i < LENGTH; i++) {

            int index = random.nextInt(CHARACTERS.length());

            code.append(CHARACTERS.charAt(index));
        }

        return code.toString();
    }
}