package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.entity.dto.StartExportLogDTO;
import cn.lenmotion.donut.system.entity.po.SysExportLog;
import cn.lenmotion.donut.system.service.SysExportLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lenmotion
 */
@RestController
@RequestMapping("inner/exportLog")
@RequiredArgsConstructor
public class SysExportLogInnerController {

    private final SysExportLogService exportLogService;

    @PostMapping("start")
    public ResponseResult<SysExportLog> startExport(@RequestBody StartExportLogDTO exportLogDTO) {
        return ResponseResult.success(exportLogService.startExport(exportLogDTO));
    }

    @PostMapping("end")
    public ResponseResult<Void> endExport(@RequestBody SysExportLog exportLog) {
        exportLogService.endExport(exportLog);
        return ResponseResult.success();
    }

}
