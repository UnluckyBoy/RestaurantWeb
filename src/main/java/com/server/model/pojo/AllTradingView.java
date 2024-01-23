package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName AllTradingView
 * @Author Create By matrix
 * @Date 2024/1/23 0023 15:16
 */
public class AllTradingView implements Serializable {
    private int id;
    private String mTradingPrice;
    private String pName;
    private String pType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getmTradingPrice() {
        return mTradingPrice;
    }

    public void setmTradingPrice(String mTradingPrice) {
        this.mTradingPrice = mTradingPrice;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpType() {
        return pType;
    }

    public void setpType(String pType) {
        this.pType = pType;
    }

    @Override
    public String toString() {
        return "id='" + id + '\'' +"mTradingPrice='" + mTradingPrice +
                '\'' +", pName='" + pName + '\'' +", pType='" + pType;
    }
}
