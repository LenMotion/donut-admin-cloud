package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.entity.po.SysLoginLog;
import cn.lenmotion.donut.system.service.SysLoginLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author lenmotion
 */
@RestController
@RequestMapping("inner/loginLog")
@RequiredArgsConstructor
public class SysLoginLogInnerController {

    private final SysLoginLogService loginLogService;

    @PostMapping("save")
    public ResponseResult<Boolean> saveLoginLog(@RequestBody SysLoginLog loginLog) {
        return ResponseResult.success(loginLogService.save(loginLog));
    }

    /**
     * 查询token对应的登录信息
     * @param tokenValueList
     * @return
     */
    @GetMapping("selectLoginLogByToken")
    public ResponseResult< Map<String, SysLoginLog>> selectLoginLogByToken(@RequestParam List<String> tokenValueList) {
        return ResponseResult.success(loginLogService.selectLoginLogByToken(tokenValueList));
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @GetMapping("info/{id}")
    public ResponseResult<SysLoginLog> getLoginLogById(@PathVariable Long id) {
        return ResponseResult.success(loginLogService.getById(id));
    }

}
