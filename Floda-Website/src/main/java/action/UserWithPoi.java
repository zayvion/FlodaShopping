package action;

import dao.UserDao;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.User;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Provider;
import java.util.Calendar;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-09 19:19
 * @Description:使用poi实现报表
 */
@Controller
@Scope("prototype")
public class UserWithPoi extends BaseAction {
    @Autowired
    private UserDao userDao;

    public String exportUser() throws IOException {
        List<User> userList = userDao.getUserList();
        //工作薄
        HSSFWorkbook wb = new HSSFWorkbook();
        //工作表
        HSSFSheet sheet = wb.createSheet("first sheet");
        //行
        HSSFRow row = sheet.createRow(0);
        //单元格
        HSSFCell cell = row.createCell(0);//第一行
        cell.setCellValue("序号");//第一行第一列

        cell = row.createCell(1);//第一行
        cell.setCellValue("用户名");//第一行第一列
        cell = row.createCell(2);
        cell.setCellValue("电话号码");
        cell = row.createCell(3);//第一行
        cell.setCellValue("状态");
        for (int i = 0;i<userList.size();i++){
            row = sheet.createRow(i+1);
            cell = row.createCell(0);
            cell.setCellValue(userList.get(i).getUser_id());

            cell = row.createCell(1);
            cell.setCellValue(userList.get(i).getUsername());
            cell = row.createCell(2);
            cell.setCellValue(userList.get(i).getTel());
            cell = row.createCell(3);
            switch (userList.get(i).getStatus()){
                case 0:cell.setCellValue("正常");
                break;
                case 1:cell.setCellValue("停用");
                break;
                default:
                    break;
            }
        }
        //创建数据格式对象
        HSSFDataFormat format = wb.createDataFormat();


        // row.getCell(2).setCellStyle(style);
//        row.getCell(3).setCellStyle(style);
        /**
         * 设置文本对齐方式
         */
        // row.createCell(0).setCellValue("左上");
        // row.createCell(1).setCellValue("中中");
        // row.createCell(2).setCellValue("右下");


       /* //设置字体大小颜色
        style = row.getCell(1).getCellStyle();//取出中中的样式
        HSSFFont font = wb.createFont();
        font.setFontName("方正姚体");
        font.setFontHeightInPoints((short)30);
        font.setItalic(true);//斜体
        font.setColor(HSSFColor.RED.index);

        style.setFont(font);
        //字体旋转
        style = row.getCell(1).getCellStyle();
        style.setRotation((short)-30);*/


        //保存
        wb.write(new FileOutputStream(new File("/Users/zayvion/Desktop/poi.xls")));

        return NONE;
    }
}
