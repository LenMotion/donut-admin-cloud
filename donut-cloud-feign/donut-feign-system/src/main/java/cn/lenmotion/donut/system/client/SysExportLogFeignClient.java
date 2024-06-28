package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import cn.lenmotion.donut.system.entity.dto.StartExportLogDTO;
import cn.lenmotion.donut.system.entity.po.SysExportLog;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "exportLog",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/exportLog",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysExportLogFeignClient {

    @PostMapping("start")
    SysExportLog startExport(@RequestBody StartExportLogDTO exportLogDTO);

    @PostMapping("end")
    void endExport(@RequestBody SysExportLog exportLog);

}
