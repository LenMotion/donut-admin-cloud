package cn.lenmotion.donut.system.entity.dto;

import lombok.Data;
import java.io.File;

/**
 * @author lenmotion
 */
@Data
public class FileUploadDTO {

    /**
     * 文件
     */
    private File file;

    /**
     * 文件名字
     */
    private String fileName;

    /**
     * 上传路径
     */
    private String path;

    /**
     * 文件类型
     */
    private String objectType;

}
