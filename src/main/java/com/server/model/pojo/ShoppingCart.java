package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName ShoppingCart
 * @Author Create By matrix
 * @Date 2024/3/17 0017 23:11
 */
public class ShoppingCart implements Serializable {
    private int cId;
    private String cContent;
    private String cCreator;
    private String cShopper;
    private String cTradingPrice;
    private String cCreateTime;

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcContent() {
        return cContent;
    }

    public void setcContent(String cContent) {
        this.cContent = cContent;
    }

    public String getcCreator() {
        return cCreator;
    }

    public void setcCreator(String cCreator) {
        this.cCreator = cCreator;
    }

    public String getcShopper() {
        return cShopper;
    }

    public void setcShopper(String cShopper) {
        this.cShopper = cShopper;
    }

    public String getcTradingPrice() {
        return cTradingPrice;
    }

    public void setcTradingPrice(String cTradingPrice) {
        this.cTradingPrice = cTradingPrice;
    }

    public String getcCreateTime() {
        return cCreateTime;
    }

    public void setcCreateTime(String cCreateTime) {
        this.cCreateTime = cCreateTime;
    }

    @Override
    public String toString() {
        return "cId=" + cId + ", cContent='" + cContent + '\'' + ", cCreator='" + cCreator + '\'' +
                ", cShopper='" + cShopper + '\'' + ", cTradingPrice='" + cTradingPrice + '\'' +
                ", cCreateTime='" + cCreateTime;
    }
}
