package cn.lenmotion.donut.common.trans.storage;

import cn.hutool.core.collection.CollUtil;
import cn.lenmotion.donut.common.core.constants.BaseConstants;
import cn.lenmotion.donut.system.client.SysFileStorageFeignClient;
import com.fhs.core.trans.anno.AutoTrans;
import com.fhs.trans.service.AutoTransable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author lenmotion
 */
@Slf4j
@Service
@AutoTrans(namespace = BaseConstants.STORAGE_NAMESPACE, fields = {"url"})
@RequiredArgsConstructor
public class StorageAutoTrans implements AutoTransable<StorageVO> {

    private final SysFileStorageFeignClient fileStorageFeignClient;

    @Override
    public List<StorageVO> selectByIds(List<?> ids) {
        if (CollUtil.isEmpty(ids)) {
            return new ArrayList<>();
        }

        List<String> list = ids.stream().map(Object::toString).collect(Collectors.toList());
        var signedUrl = fileStorageFeignClient.genSignedUrl(list);

        List<StorageVO> result = new ArrayList<>(signedUrl.size());
        signedUrl.forEach((key, value) -> result.add(new StorageVO(key, value)));

        return result;
    }

    @Override
    public StorageVO selectById(Object primaryValue) {
        var signedUrl = fileStorageFeignClient.genSignedUrl(Collections.singletonList(primaryValue.toString()));
        if (CollUtil.isNotEmpty(signedUrl)) {
            return new StorageVO(primaryValue.toString(), signedUrl.get(primaryValue.toString()));
        }
        return null;
    }

}
