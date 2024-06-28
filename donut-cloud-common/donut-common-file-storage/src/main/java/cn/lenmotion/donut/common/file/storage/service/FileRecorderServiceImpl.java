package cn.lenmotion.donut.common.file.storage.service;

import cn.lenmotion.donut.common.file.storage.entity.converter.FileStorageConverter;
import cn.lenmotion.donut.system.client.SysFileStorageFeignClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.recorder.FileRecorder;
import org.dromara.x.file.storage.core.upload.FilePartInfo;
import org.springframework.stereotype.Component;

/**
 * @author lenmotion
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class FileRecorderServiceImpl implements FileRecorder {

    private final SysFileStorageFeignClient fileStorageFeignClient;

    @Override
    public boolean save(FileInfo fileInfo) {
        var fileStorage = FileStorageConverter.INSTANCE.toModel(fileInfo);
        return fileStorageFeignClient.saveFile(fileStorage);
    }

    @Override
    public void update(FileInfo fileInfo) {
        var fileStorage = FileStorageConverter.INSTANCE.toModel(fileInfo);
        fileStorageFeignClient.saveFile(fileStorage);
    }

    @Override
    public FileInfo getByUrl(String s) {
        var fileStorage = fileStorageFeignClient.getByUrl(s);
        return FileStorageConverter.INSTANCE.toFileInfo(fileStorage);
    }

    @Override
    public boolean delete(String s) {
        return fileStorageFeignClient.deleteFile(s);
    }

    @Override
    public void saveFilePart(FilePartInfo filePartInfo) {
        log.warn("file part storage is not implemented");
    }

    @Override
    public void deleteFilePartByUploadId(String s) {
        log.warn("delete file part storage is not implemented");
    }

}
