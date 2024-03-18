package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName ShoppingCart
 * @Author Create By matrix
 * @Date 2024/3/17 0017 23:11
 */
public class ShoppingCart implements Serializable {
    private int cId;
    private String cTitle;
    private String cContent;
    private String cCreator;
    private String cShopper;
    private int cNumber;
    private String cTradingPrice;
    private String cCreateTime;

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle;
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

    public int getcNumber() {
        return cNumber;
    }

    public void setcNumber(int cNumber) {
        this.cNumber = cNumber;
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
        return "cId=" + cId +
                ", cTitle='" + cTitle + '\'' +
                ", cContent='" + cContent + '\'' +
                ", cCreator='" + cCreator + '\'' +
                ", cShopper='" + cShopper + '\'' +
                ", cNumber=" + cNumber +
                ", cTradingPrice='" + cTradingPrice + '\'' +
                ", cCreateTime='" + cCreateTime + '\'';
    }
}
