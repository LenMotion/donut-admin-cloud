package cn.lenmotion.donut.system.entity.vo;

import cn.lenmotion.donut.common.core.constants.BaseConstants;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fhs.core.trans.anno.Trans;
import com.fhs.core.trans.constant.TransType;
import com.fhs.core.trans.vo.VO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author lenmotion
 */
@Data
@Schema(description = "文件上传VO")
public class FileUploadVO implements VO {

    @TableId
    @Schema(hidden = true)
    @JsonIgnore
    private String id;

    @Schema(description = "文件访问地址，用于后台保存")
    @Trans(type = TransType.AUTO_TRANS, key = BaseConstants.STORAGE_NAMESPACE, ref  = "previewUrl")
    private String url;

    @Schema(description = "实际获取地址，有访问限制")
    private String previewUrl;

}
