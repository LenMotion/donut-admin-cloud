package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import cn.lenmotion.donut.common.core.enums.DataScopeEnum;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Set;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "sysPermission",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/permission",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysPermissionFeignClient {

    /**
     * 获取角色数据权限
     *
     * @param userId 用户信息
     * @return 角色权限信息
     */
    @GetMapping("roleKeys/{userId}")
    Set<String> getRolePermission(@PathVariable Long userId);

    /**
     * 获取菜单数据权限
     *
     * @param userId 用户信息
     * @return 菜单权限信息
     */
    @GetMapping("menuPerms/{userId}")
    Set<String> getMenuPermission(@PathVariable Long userId);

    /**
     * 获取部门的权限信息
     * @param userId
     * @return
     */
    @GetMapping("deptAncestors/{userId}")
    Set<String> getDeptAncestors(@PathVariable Long userId);

    /**
     * 获取角色数据权限
     *
     * @param userId 用户信息
     * @return 角色权限信息
     */
    @GetMapping("roleDataScope/{userId}")
    Set<DataScopeEnum> getRoleDataScope(@PathVariable Long userId);

}
