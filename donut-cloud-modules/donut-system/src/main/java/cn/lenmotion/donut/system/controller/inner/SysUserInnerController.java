package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.entity.converter.UserConverter;
import cn.lenmotion.donut.system.entity.dto.SysUserDTO;
import cn.lenmotion.donut.system.entity.po.SysUser;
import cn.lenmotion.donut.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author lenmotion
 */
@RestController
@RequestMapping("inner/user")
@RequiredArgsConstructor
public class SysUserInnerController {

    private final SysUserService userService;

    @GetMapping("getByUsername")
    public ResponseResult<SysUserDTO> getByUsername(@RequestParam String username) {
        var user = userService.getByUsername(username);
        return ResponseResult.success(UserConverter.INSTANCE.toDto(user));
    }

    @PutMapping("updateUser")
    public ResponseResult<Boolean> updateUser(@RequestBody SysUser user) {
        return ResponseResult.success(userService.updateById(user));
    }

}
