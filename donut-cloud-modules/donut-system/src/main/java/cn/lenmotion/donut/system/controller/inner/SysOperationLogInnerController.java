package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.entity.po.SysLoginLog;
import cn.lenmotion.donut.system.entity.po.SysOperationLog;
import cn.lenmotion.donut.system.service.SysOperationLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author LenMotion
 */
@RestController
@RequestMapping("inner/operationLog")
@RequiredArgsConstructor
public class SysOperationLogInnerController {

    private final SysOperationLogService operationLogService;

    @PostMapping("save")
    public ResponseResult<Boolean> saveOperationLog(@RequestBody SysOperationLog operationLog) {
        return ResponseResult.success(operationLogService.save(operationLog));
    }

}
