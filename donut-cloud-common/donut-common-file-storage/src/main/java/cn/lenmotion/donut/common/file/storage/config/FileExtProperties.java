package cn.lenmotion.donut.common.file.storage.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author lenmotion
 */
@Data
@Component
@PropertySource(value={"classpath:fileExt.yml"})
@ConfigurationProperties(prefix = "project")
public class FileExtProperties {

    private List<String> fileExt;

}
