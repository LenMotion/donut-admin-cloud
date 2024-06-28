package cn.lenmotion.donut.common.starter.service;

import cn.dev33.satoken.stp.StpInterface;
import cn.lenmotion.donut.system.client.SysPermissionFeignClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LenMotion
 * sa-token获取用户的权限
 */
@Component
@RequiredArgsConstructor
public class StpInterfaceServiceImpl implements StpInterface {

    private final SysPermissionFeignClient permissionFeignClient;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return new ArrayList<>(permissionFeignClient.getMenuPermission(Long.parseLong(loginId.toString())));
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        return new ArrayList<>(permissionFeignClient.getRolePermission(Long.parseLong(loginId.toString())));
    }

}
