package cn.lenmotion.donut.system.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author lenmotion
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StartExportLogDTO {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 文件名
     */
    private String fileName;

}
