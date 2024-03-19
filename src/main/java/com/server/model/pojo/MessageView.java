package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName MessageView
 * @Author Create By matrix
 * @Date 2024/3/6 0006 15:29
 */
public class MessageView implements Serializable {
    private int aId;
    private String aTitle;
    private String aContent;
    private String aPublisher;
    private String aCreateTime;
    private String aType;

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent;
    }

    public String getaPublisher() {
        return aPublisher;
    }

    public void setaPublisher(String aPublisher) {
        this.aPublisher = aPublisher;
    }

    public String getaCreateTime() {
        return aCreateTime;
    }

    public void setaCreateTime(String aCreateTime) {
        this.aCreateTime = aCreateTime;
    }

    public String getaType() {
        return aType;
    }

    public void setaType(String aType) {
        this.aType = aType;
    }

    @Override
    public String toString() {
        return "MessageView{" +
                "aId=" + aId +
                ", aTitle='" + aTitle + '\'' +
                ", aContent='" + aContent + '\'' +
                ", aPublisher='" + aPublisher + '\'' +
                ", aCreateTime='" + aCreateTime + '\'' +
                ", aType='" + aType + '\'' +
                '}';
    }
}
