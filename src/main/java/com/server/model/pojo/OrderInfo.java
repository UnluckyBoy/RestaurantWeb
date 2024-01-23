package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName OrderInfo
 * @Author Create By matrix
 * @Date 2024/1/20 0020 15:42
 */
public class OrderInfo implements Serializable {
    private int mId;
    private String mOrderNumber;
    private String mContent;
    private String mOrder;
    private String mShopper;
    private int mTradingPrice;
    private String mCreateTime;
    private String mEditor;
    private String mEditTime;
    private int mTradingType;

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getmOrderNumber() {
        return mOrderNumber;
    }

    public void setmOrderNumber(String mOrderNumber) {
        this.mOrderNumber = mOrderNumber;
    }

    public String getmContent() {
        return mContent;
    }

    public void setmContent(String mContent) {
        this.mContent = mContent;
    }

    public String getmOrder() {
        return mOrder;
    }

    public void setmOrder(String mOrder) {
        this.mOrder = mOrder;
    }

    public String getmShopper() {
        return mShopper;
    }

    public void setmShopper(String mShopper) {
        this.mShopper = mShopper;
    }

    public int getmTradingPrice() {
        return mTradingPrice;
    }

    public void setmTradingPrice(int mTradingPrice) {
        this.mTradingPrice = mTradingPrice;
    }

    public String getmCreateTime() {
        return mCreateTime;
    }

    public void setmCreateTime(String mCreateTime) {
        this.mCreateTime = mCreateTime;
    }

    public String getmEditor() {
        return mEditor;
    }

    public void setmEditor(String mEdit) {
        this.mEditor = mEdit;
    }

    public String getmEditTime() {
        return mEditTime;
    }

    public void setmEditTime(String mEditTime) {
        this.mEditTime = mEditTime;
    }

    public int getmTradingType() {
        return mTradingType;
    }

    public void setmTradingType(int mTradingType) {
        this.mTradingType = mTradingType;
    }

    @Override
    public String toString() {
        return "mId=" + mId +
                ", mOrderNumber='" + mOrderNumber + '\'' +
                ", mContent='" + mContent + '\'' +
                ", mOrder='" + mOrder + '\'' +
                ", mShopper='" + mShopper + '\'' +
                ", mTradingPrice=" + mTradingPrice +
                ", mCreateTime='" + mCreateTime + '\'' +
                ", mEditor='" + mEditor + '\'' +
                ", mEditTime='" + mEditTime + '\'' +
                ", mTradingType=" + mTradingType;
    }
}
