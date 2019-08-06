package pojo;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-07-16 20:14
 * @Description:分页类
 */
public class PageHelper {
    private Integer nowPage;
    private Integer totalPage;
    private Integer totalNum;
    private Integer item;
    private Integer start;
    private Integer end;
    private List<?> data;

    public Integer getNowPage() {
        return nowPage;
    }

    public void setNowPage(Integer nowPage) {
        this.nowPage = nowPage;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getItem() {
        return item;
    }

    public void setItem(Integer item) {
        this.item = item;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "PageHelper{" +
                "nowPage=" + nowPage +
                ", totalPage=" + totalPage +
                ", totalNum=" + totalNum +
                ", item=" + item +
                ", start=" + start +
                ", end=" + end +
                ", data=" + data +
                '}';
    }
}
