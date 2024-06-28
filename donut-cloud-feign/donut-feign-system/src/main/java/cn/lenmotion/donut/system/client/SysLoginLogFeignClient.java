package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import cn.lenmotion.donut.system.entity.po.SysLoginLog;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "sysLoginLog",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/loginLog",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysLoginLogFeignClient {

    /**
     * 保存登陆日志
     *
     * @param loginLog
     * @return
     */
    @PostMapping("save")
    Boolean saveLoginLog(@RequestBody SysLoginLog loginLog);

    /**
     * 查询token对应的登录信息
     * @param tokenValueList
     * @return
     */
    @GetMapping("selectLoginLogByToken")
    Map<String, SysLoginLog> selectLoginLogByToken(@RequestParam List<String> tokenValueList);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @GetMapping("info/{id}")
    SysLoginLog getLoginLogById(@PathVariable Long id);

}
