package cn.lenmotion.donut.system.controller;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.system.entity.vo.FileUploadVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author lenmotion
 */
@Slf4j
@RestController
@Tag(name = "文件上传", description = "文件上传")
@RequestMapping("upload")
@RequiredArgsConstructor
public class FileUploadController {

    private final FileStorageService fileStorageService;

    @Operation(summary = "文件上传")
    @PostMapping("file")
    public ResponseResult<FileUploadVO> upload(@RequestPart MultipartFile file,
                                               @Parameter(description = "是否开放访问") @RequestParam(defaultValue = "false") boolean open) {
        FileInfo fileInfo = fileStorageService.of(file).setPath(open ? "open/" : "").upload();
        FileUploadVO fileUploadVO = new FileUploadVO();
        fileUploadVO.setId(fileInfo.getId());
        fileUploadVO.setUrl(fileInfo.getUrl());
        return ResponseResult.success(fileUploadVO);
    }

}
