package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName Product
 * @Author Create By matrix
 * @Date 2024/2/22 0022 14:39
 */
public class Product implements Serializable {
    private int pId;
    private String pName;
    private String pIcon;
    private String pDescription;
    private String pType;
    private String pShopper;
    private String pPrice;
    private String pImage;

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpIcon() {
        return pIcon;
    }

    public void setpIcon(String pIcon) {
        this.pIcon = pIcon;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpType() {
        return pType;
    }

    public void setpType(String pType) {
        this.pType = pType;
    }

    public String getpShopper() {
        return pShopper;
    }

    public void setpShopper(String pShopper) {
        this.pShopper = pShopper;
    }

    public String getpPrice() {
        return pPrice;
    }

    public void setpPrice(String pPrice) {
        this.pPrice = pPrice;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    @Override
    public String toString() {
        return "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pIcon='" + pIcon + '\'' +
                ", pDescription='" + pDescription + '\'' +
                ", pType='" + pType + '\'' +
                ", pShopper='" + pShopper + '\'' +
                ", pPrice='" + pPrice + '\''+
                ", pImage='" + pImage + '\'';
    }
}
