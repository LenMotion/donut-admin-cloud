package cn.lenmotion.donut.system.service;

import cn.lenmotion.donut.system.entity.po.SysFileStorage;
import cn.lenmotion.donut.system.entity.query.FileStorageQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * @author lenmotion
 */
public interface SysFileStorageService extends IService<SysFileStorage> {

    /**
     * 分页查询
     *
     * @param query
     * @return
     */
    IPage<SysFileStorage> selectPage(FileStorageQuery query);

    /**
     * 获取文件的签名URL
     *
     * @param urlList
     * @return
     */
    Map<String, String> genSignedUrl(List<String> urlList);

    /**
     * 获取文件信息
     *
     * @param url
     * @return
     */
    SysFileStorage getByUrl(String url);

    /**
     * 删除文件
     *
     * @param url
     * @return
     */
    boolean delete(String url);

}
