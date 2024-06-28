package cn.lenmotion.common.feign;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import cn.lenmotion.donut.common.core.constants.BaseConstants;
import cn.lenmotion.donut.common.core.context.TenantContext;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author lenmotion
 */
@Configuration
public class DonutFeignRequestInterceptor implements RequestInterceptor {

    @Value("${sa-token.token-prefix:}")
    private String tokenPrefix;

    @Override
    public void apply(RequestTemplate requestTemplate) {
        if (TenantContext.getTenant() != null) {
            requestTemplate.header(BaseConstants.TENANT_HEADER, String.valueOf(TenantContext.getTenant()));
        }

        try {
            if (StpUtil.isLogin()) {
                var tokenInfo = StpUtil.getTokenInfo();
                var tokenValue = (StrUtil.isBlank(tokenPrefix) ? "" : tokenPrefix + " ") + tokenInfo.getTokenValue();
                requestTemplate.header(tokenInfo.getTokenName(), tokenValue);
            }
        } catch (Exception ignored) {
        }
    }

}
