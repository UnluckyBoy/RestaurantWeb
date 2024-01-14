package com.server.tools;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @ClassName JsonUtils
 * @Author Create By matrix
 * @Date 2024/1/14 0014 20:07
 */
public class JsonUtils {
    public static String toJson(Object obj) {
        Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .disableHtmlEscaping()
                .create();
        return gson.toJson(obj);
    }
}
