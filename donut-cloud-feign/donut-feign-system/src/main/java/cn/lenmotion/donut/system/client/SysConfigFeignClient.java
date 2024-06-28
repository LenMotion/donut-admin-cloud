package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "sysConfig",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/config",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysConfigFeignClient {

    /**
     * 获取布尔类型的配置
     * @param configKey
     * @return
     */
    @GetMapping("boolValue/{configKey}")
    Boolean getConfigBoolValue(@PathVariable String configKey);

}
