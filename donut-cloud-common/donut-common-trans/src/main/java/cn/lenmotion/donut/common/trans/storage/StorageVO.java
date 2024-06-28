package cn.lenmotion.donut.common.trans.storage;

import com.fhs.core.trans.vo.VO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author lenmotion
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StorageVO implements VO {

    private String id;

    private String url;

}
