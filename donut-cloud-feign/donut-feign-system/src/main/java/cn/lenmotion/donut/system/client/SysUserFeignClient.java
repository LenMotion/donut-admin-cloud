package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import cn.lenmotion.donut.system.entity.dto.SysUserDTO;
import cn.lenmotion.donut.system.entity.po.SysUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "sysUser",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/user",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysUserFeignClient {

    /**
     * 根据用户名查询
     * @param username 用户名
     * @return 用户
     */
    @GetMapping("getByUsername")
    SysUserDTO getByUsername(@RequestParam String username);

    /**
     * 更新用户
     *
     * @param user
     * @return 更新结果
     */
    @PutMapping("updateUser")
    Boolean updateUser(@RequestBody SysUser user);

}
