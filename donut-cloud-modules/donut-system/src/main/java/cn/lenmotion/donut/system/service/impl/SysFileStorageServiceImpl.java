package cn.lenmotion.donut.system.service.impl;

import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import cn.lenmotion.donut.common.core.constants.BaseConstants;
import cn.lenmotion.donut.common.file.storage.entity.converter.FileStorageConverter;
import cn.lenmotion.donut.system.entity.po.SysFileStorage;
import cn.lenmotion.donut.system.entity.query.FileStorageQuery;
import cn.lenmotion.donut.system.mapper.SysFileStorageMapper;
import cn.lenmotion.donut.system.service.SysFileStorageService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.dromara.x.file.storage.core.platform.FileStorage;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author lenmotion
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SysFileStorageServiceImpl extends ServiceImpl<SysFileStorageMapper, SysFileStorage> implements SysFileStorageService {

    private final SaTokenConfig saTokenConfig;
    private final FileStorageService fileStorageService;

    @Override
    public IPage<SysFileStorage> selectPage(FileStorageQuery query) {
        var queryWrapper = Wrappers.<SysFileStorage>lambdaQuery();
        queryWrapper.like(StrUtil.isNotBlank(query.getOriginalFilename()), SysFileStorage::getOriginalFilename, query.getOriginalFilename())
                .orderByDesc(SysFileStorage::getCreateTime);
        return this.page(query.toPage(), queryWrapper);
    }

    @Override
    public SysFileStorage getByUrl(String url) {
        LambdaQueryWrapper<SysFileStorage> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysFileStorage::getUrl, url)
                .last(BaseConstants.LIMIT_1);
        return this.getOne(queryWrapper);
    }

    @Override
    public boolean delete(String url) {
        LambdaQueryWrapper<SysFileStorage> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysFileStorage::getUrl, url);
        return remove(queryWrapper);
    }

    @Override
    public Map<String, String> genSignedUrl(List<String> urlList) {
        if (CollUtil.isEmpty(urlList)) {
            return new HashMap<>();
        }

        LambdaQueryWrapper<SysFileStorage> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysFileStorage::getUrl, urlList);


        var list = FileStorageConverter.INSTANCE.toFileInfoList(this.list(queryWrapper));
        var map = list.stream().collect(Collectors.toMap(FileInfo::getUrl, e -> e, (k1, k2) -> k1));

        Map<String, String> result = new HashMap<>(urlList.size());

        for (String url : urlList) {
            result.put(url, this.fileInfoToStorageVO(map.get(url)));
        }

        return result;
    }

    /**
     * fileInfo转storageVO
     */
    private String fileInfoToStorageVO(FileInfo fileInfo) {
        if (fileInfo == null) {
            return null;
        }
        try {
            FileStorage fileStorage = fileStorageService.getFileStorage(fileInfo.getPlatform());
            if (Objects.isNull(fileStorage)) {
                return null;
            }

            if (fileStorage.isSupportPresignedUrl()) {
                return fileStorageService.generatePresignedUrl(fileInfo, DateUtil.offsetMinute(new Date(), 30));
            } else if (StpUtil.isLogin()) {
                var prefix = StrUtil.isBlank(saTokenConfig.getTokenPrefix()) ? "" : saTokenConfig.getTokenPrefix() + " ";
                var token = StrUtil.format("{}?{}={}{}", fileInfo.getUrl(), saTokenConfig.getTokenName(), prefix, StpUtil.getTokenValue());
                return URLUtil.encodeBlank(token);
            } else {
                return fileInfo.getUrl();
            }
        } catch (Exception e) {
            log.error("生成文件访问链接异常: {}", e.getMessage());
            return null;
        }
    }

}
