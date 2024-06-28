package cn.lenmotion.donut.generator.config;

import cn.dev33.satoken.config.SaTokenConfig;
import io.swagger.v3.oas.models.parameters.Parameter;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author lenmotion
 */
@Configuration
@RequiredArgsConstructor
public class Knife4jConfig {
    private final SaTokenConfig saTokenConfig;

    /**
     * 系统管理模块API文档
     * @return
     */
    @Bean
    public GroupedOpenApi systemApi() {
        return GroupedOpenApi.builder()
                .group("default")
                .displayName("02-代码生成")
                .packagesToScan("cn.lenmotion.donut.generator.controller")
                .packagesToExclude("cn.lenmotion.donut.generator.controller.inner")
                .addOperationCustomizer((operation, handlerMethod) -> operation.addParametersItem(
                        new Parameter()
                                .in("header")
                                .required(true)
                                .description("请求头验证")
                                .name(saTokenConfig.getTokenName())
                ))
                .build();
    }

    // websocket
//    @Bean
//    public ServerEndpointExporter serverEndpointExporter () {
//        return new ServerEndpointExporter();
//    }

}
