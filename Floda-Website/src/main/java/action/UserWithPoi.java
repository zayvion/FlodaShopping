package action;

import dao.UserDao;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.User;

import java.io.*;
import java.net.URLEncoder;
import java.security.Provider;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
        //样式
        HSSFCellStyle setBorder = wb.createCellStyle();
        setBorder.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
        setBorder.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
        setBorder.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
        setBorder.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
        setBorder.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
        HSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 14);//设置字体大小
        setBorder.setFont(font);//选择需要用到的字体格式
        //行
        HSSFRow row = sheet.createRow(0);
        //单元格
        HSSFCell cell = row.createCell(0);//第一行
        cell.setCellValue("序号");//第一行第一列
        cell.setCellStyle(setBorder);

        cell = row.createCell(1);//第一行
        cell.setCellValue("用户名");//第一行第一列
        cell.setCellStyle(setBorder);
        cell = row.createCell(2);
        cell.setCellValue("电话号码");
        cell.setCellStyle(setBorder);
        cell = row.createCell(3);//第一行
        cell.setCellValue("状态");
        cell.setCellStyle(setBorder);
        for (int i = 0; i < userList.size(); i++) {
            row = sheet.createRow(i + 1);
            cell = row.createCell(0);
            cell.setCellValue(userList.get(i).getUser_id());
            cell.setCellStyle(setBorder);
            cell = row.createCell(1);
            cell.setCellValue(userList.get(i).getUsername());
            cell.setCellStyle(setBorder);
            cell = row.createCell(2);
            cell.setCellValue(userList.get(i).getTel());
            cell.setCellStyle(setBorder);
            cell = row.createCell(3);
            switch (userList.get(i).getStatus()) {
                case 0:
                    cell.setCellValue("正常");
                    cell.setCellStyle(setBorder);
                    break;
                case 1:
                    cell.setCellValue("封号");
                    cell.setCellStyle(setBorder);
                    break;
                default:
                    break;
            }
        }
        //设置列宽自适应
        sheet.autoSizeColumn(0, true);
        sheet.autoSizeColumn(1, true);
        sheet.autoSizeColumn(2, true);
        sheet.autoSizeColumn(3, true);
        sheet.autoSizeColumn(4, true);
        sheet.autoSizeColumn(5, true);
        //保存
        //wb.write(new FileOutputStream(new File("/Users/zayvion/Desktop/poi.xls")));、
        String downFileName = new String("userexport_" + getDate() + ".xls");
        try {
            //若不进行编码在IE下会乱码
            downFileName = URLEncoder.encode(downFileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        try {
            // 清空response
            response.reset();
            response.setContentType("application/msexcel");//设置生成的文件类型
            response.setCharacterEncoding("UTF-8");//设置文件头编码方式和文件名
            response.setHeader("Content-Disposition", "attachment; filename=" + new String(downFileName.getBytes("utf-8"), "ISO8859-1"));
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 生成文件名后面的日期
     * @return
     */
    public String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
        String format = sdf.format(new Date());
        return format;
    }

}
