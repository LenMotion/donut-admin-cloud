package cn.lenmotion.donut.system.service;

import cn.lenmotion.donut.system.entity.po.SysLoginLog;
import cn.lenmotion.donut.system.entity.query.LoginLogQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * @author lenmotion
 */
public interface SysLoginLogService extends IService<SysLoginLog> {

    /**
     * 分页查询
     * @param query
     * @return
     */
    IPage<SysLoginLog> selectPage(LoginLogQuery query);

    /**
     * 导出数据
     * @param query
     */
    void exportLog(LoginLogQuery query);

    /**
     * 查询token对应的登录信息
     * @param tokenValueList
     * @return
     */
    Map<String, SysLoginLog> selectLoginLogByToken(List<String> tokenValueList);

}
