package cn.lenmotion.donut.system.entity.vo.export;

import cn.lenmotion.donut.common.core.constants.DictKeyConstants;
import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fhs.core.trans.anno.Trans;
import com.fhs.core.trans.constant.TransType;
import com.fhs.core.trans.vo.VO;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author lenmotion
 */
@Data
public class LoginLogExportVO implements VO {

    @TableId
    @ExcelIgnore
    private Long id;

    @ExcelProperty(value = "用户名")
    @ColumnWidth(15)
    private String username;

    @ExcelProperty(value = "ip")
    @ColumnWidth(15)
    private String ip;

    @ExcelProperty(value = "浏览器")
    @ColumnWidth(20)
    private String browser;

    @ExcelProperty(value = "系统")
    @ColumnWidth(20)
    private String os;

    @Trans(type = TransType.DICTIONARY, key = DictKeyConstants.SYS_LOGIN_STATUS, ref = "statusName")
    @ExcelIgnore
    private String status;

    @ExcelProperty(value = "状态")
    private String statusName;

    @ExcelProperty(value = "描述")
    @ColumnWidth(35)
    private String msg;

    @ExcelProperty(value = "登录时间")
    @ColumnWidth(25)
    private LocalDateTime loginTime;
}
