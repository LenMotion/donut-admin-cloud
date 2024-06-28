package cn.lenmotion.donut.auth.config;

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

    @Bean
    public GroupedOpenApi systemApi() {
        return GroupedOpenApi.builder()
                .group("01-授权登录")
                .packagesToScan("cn.lenmotion.donut.auth.controller")
                .addOperationCustomizer((operation, handlerMethod) -> operation.addParametersItem(
                        new Parameter()
                                .in("header")
                                .required(true)
                                .description("请求头验证2323")
                                .name(saTokenConfig.getTokenName())
                ))
                .build();
    }

}
