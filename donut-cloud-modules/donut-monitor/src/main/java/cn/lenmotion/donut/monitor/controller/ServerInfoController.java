package cn.lenmotion.donut.monitor.controller;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.monitor.entity.RedisVO;
import cn.lenmotion.donut.monitor.service.MonitorService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lenmotion
 */
@Slf4j
@Tag(name = "系统信息")
@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class ServerInfoController {

    private final MonitorService monitorService;

//    @Operation(summary = "获取系统信息")
//    @GetMapping("server")
//    public ResponseResult<ServerVO> getServerInfo() {
//        //返回服务器信息
//        return ResponseResult.success(monitorService.getServerInfo());
//    }

    @Operation(summary = "获取Redis信息")
    @GetMapping("redis")
    public ResponseResult<RedisVO> getRedisInfo() {
        return ResponseResult.success(monitorService.getRedisInfo());
    }

}
