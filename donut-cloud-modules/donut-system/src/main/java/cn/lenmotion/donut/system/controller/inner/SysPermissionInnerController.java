package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.common.core.enums.DataScopeEnum;
import cn.lenmotion.donut.common.core.utils.EnumUtils;
import cn.lenmotion.donut.system.entity.po.SysRole;
import cn.lenmotion.donut.system.service.SysRoleMenuService;
import cn.lenmotion.donut.system.service.SysUserDeptService;
import cn.lenmotion.donut.system.service.SysUserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author lenmotion
 */
@RestController
@RequestMapping("inner/permission")
@RequiredArgsConstructor
public class SysPermissionInnerController {

    private final SysRoleMenuService roleMenuService;
    private final SysUserRoleService userRoleService;
    private final SysUserDeptService userDeptService;

    @GetMapping("roleKeys/{userId}")
    public ResponseResult<Set<String>> getRolePermission(@PathVariable Long userId) {
        return ResponseResult.success(userRoleService.getRoleKeysByUserId(userId));
    }

    @GetMapping("menuPerms/{userId}")
    public ResponseResult<Set<String>> getMenuPermission(@PathVariable Long userId) {
        return ResponseResult.success(roleMenuService.getPermsByUserId(userId));
    }

    @GetMapping("deptAncestors/{userId}")
    public ResponseResult<Set<String>> getDeptAncestors(@PathVariable Long userId) {
        return ResponseResult.success(userDeptService.getDeptAncestorsByUserId(userId));
    }

    @GetMapping("roleDataScope/{userId}")
    public ResponseResult<Set<DataScopeEnum>> getRoleDataScope(@PathVariable Long userId) {
        List<SysRole> roleList = userRoleService.getRolesByUserId(userId);
        return ResponseResult.success(roleList.stream()
                .map(SysRole::getDataScope)
                .map(e -> EnumUtils.getByCode(DataScopeEnum.class, e))
                .collect(Collectors.toSet()));
    }
}
