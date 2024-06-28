package cn.lenmotion.donut.auth.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author lenmotion
 */
@Data
@Component
@ConfigurationProperties(prefix = "project")
public class ProjectProperties {

    /**
     * 验证码过期时间
     */
    private Long captchaExpire;

    /**
     * 临时目录，用于存放临时文件，之后会被删除，以/结尾
     */
    private String templatePath;

}
