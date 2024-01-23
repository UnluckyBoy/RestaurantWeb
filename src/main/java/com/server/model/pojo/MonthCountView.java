package com.server.model.pojo;

import java.io.Serializable;

/**
 * @ClassName MonthCountView
 * @Author Create By matrix
 * @Date 2024/1/20 0020 21:33
 */
public class MonthCountView implements Serializable {
    private String mTime;
    private String mCount;

    public String getmTime() {
        return mTime;
    }

    public void setmTime(String mTime) {
        this.mTime = mTime;
    }

    public String getmCount() {
        return mCount;
    }

    public void setmCount(String mCount) {
        this.mCount = mCount;
    }

    @Override
    public String toString() {
        return "mTime='" + mTime + '\'' + ", mCount='" + mCount;
    }
}
