package cn.lenmotion.donut.common.starter.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author lenmotion
 */
@Data
@Component
@ConfigurationProperties(prefix = "project")
public class ProjectProperties {

    /**
     * 忽略需要设置租户的表
     */
    private List<String> tenantIgnoreTables;

}
