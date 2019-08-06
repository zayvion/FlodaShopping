import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 19:50
 * @Description:
 */

public class FilenameTest {
    @Test
    public void filename(){
        String name = "3idfms.jpg";
        String extension = name.substring(0,name.indexOf("."));
        System.out.println(extension);
    }
    @Test
    public void date(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(new Date());
        System.out.println(format);
    }
}
