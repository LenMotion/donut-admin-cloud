package cn.lenmotion.donut.system.controller.inner;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.entity.po.SysFileStorage;
import cn.lenmotion.donut.system.service.SysFileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author lenmotion
 */
@RestController
@RequestMapping("inner/fileUpload")
@RequiredArgsConstructor
public class SysFileUploadInnerController {

    private final SysFileStorageService fileStorageService;

    @GetMapping("genSignedUrl")
    public ResponseResult<Map<String, String>> genSignedUrl(@RequestParam List<String> urlList) {
        return ResponseResult.success(fileStorageService.genSignedUrl(urlList));
    }

    @PostMapping("/save")
    public ResponseResult<Boolean> saveFile(@RequestBody SysFileStorage fileStorage) {
        return ResponseResult.success(fileStorageService.saveOrUpdate(fileStorage));
    }

    @GetMapping("/detail")
    public ResponseResult<SysFileStorage> getByUrl(@RequestParam String url) {
        return ResponseResult.success(fileStorageService.getByUrl(url));
    }

    @DeleteMapping("/delete")
    public ResponseResult<Boolean> deleteFile(@RequestParam String url) {
        return ResponseResult.success(fileStorageService.delete(url));
    }

}
