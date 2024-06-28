package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.service.SysConfigService;
import com.fhs.core.trans.anno.IgnoreTrans;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lenmotion
 */
@RestController
@RequestMapping("inner/config")
@RequiredArgsConstructor
public class SysConfigInnerController {

    private final SysConfigService configService;
    private final HttpServletRequest request;

    @IgnoreTrans
    @GetMapping("boolValue/{configKey}")
    public ResponseResult<Boolean> getConfigBoolValue(@PathVariable String configKey) {
        return ResponseResult.success(configService.getConfigBoolValue(configKey));
    }

}
