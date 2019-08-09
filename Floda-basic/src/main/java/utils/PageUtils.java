package utils;

import org.springframework.stereotype.Component;
import pojo.PageHelper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-07-16 20:29
 * @Description:分页工具类
 */
@Component
public class PageUtils {
    private Integer nowPage;
    private Integer totalPage;
    private Integer totalNum;
    private Integer item;
    private Integer start;
    private Integer end;
    PageHelper pageHelper = new PageHelper();


    public PageHelper getData(int startPage, int item,List<?> list) {
        totalNum = list.size();
        nowPage = startPage;
        System.out.println("size===:"+totalNum);
        this.item = item;
        try {
            if (totalNum % item == 0) {
                totalPage = totalNum / this.item;
            } else {
                totalPage = (totalNum / this.item) + 1;
            }
            if (nowPage <= 1) {
                start=0;
                end = this.item ;
            }else {
            start = (nowPage-1)  * item ;
            end = start+item;}
            boolean b =totalPage == nowPage;
            System.out.println("进来了"+b);
            if( totalPage == nowPage){
                if (totalNum % item == 0){
                    end = start+item;
                }else {
                    end = start+(totalNum % item);
                }
            }
            System.out.println("start:" + start);
            System.out.println("end:" + end);
            List<Object> newList = new ArrayList<Object>();
            for(int i = start;i<end;i++){
                if (i <= list.size()-1){
                    newList.add(list.get(i));
                }else {
                    break;
                }
            }
            pageHelper.setTotalNum(totalNum);
            pageHelper.setTotalPage(totalPage);
            pageHelper.setData(newList);
            pageHelper.setStart(start);
            pageHelper.setEnd(end);
            pageHelper.setNowPage(nowPage);
            pageHelper.setItem(this.item);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageHelper;
    }

}
