package cn.lenmotion.donut.system.client;

import cn.lenmotion.common.feign.DonutFeignRequestInterceptor;
import cn.lenmotion.donut.common.core.constants.ServerNameConstants;
import cn.lenmotion.donut.system.entity.po.SysFileStorage;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author lenmotion
 */
@FeignClient(
        contextId = "fileStorage",
        value = ServerNameConstants.SYSTEM_SERVER,
        path = "/system/inner/fileUpload",
        configuration = DonutFeignRequestInterceptor.class
)
public interface SysFileStorageFeignClient {

    @GetMapping("/genSignedUrl")
    Map<String, String> genSignedUrl(@RequestParam List<String> urlList);

    @PostMapping("/save")
    Boolean saveFile(@RequestBody SysFileStorage fileStorage);

    @PostMapping("/update")
    Boolean updateFile(@RequestBody SysFileStorage fileStorage);

    @GetMapping("/detail")
    SysFileStorage getByUrl(@RequestParam String url);

    @DeleteMapping("/delete")
    Boolean deleteFile(@RequestParam String url);

}
