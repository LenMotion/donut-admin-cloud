package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import cn.lenmotion.donut.system.entity.po.SysOperationLog;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "sysOperationLog",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/operationLog",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysOperationLogFeignClient {

    /**
     * 保存操作日志
     *
     * @param operationLog
     * @return
     */
    @PostMapping("save")
    Boolean saveOperationLog(@RequestBody SysOperationLog operationLog);

}
