package cn.lenmotion.donut.system.service;

import cn.lenmotion.donut.common.core.service.DonutService;
import cn.lenmotion.donut.system.entity.dto.StartExportLogDTO;
import cn.lenmotion.donut.system.entity.po.SysExportLog;
import cn.lenmotion.donut.system.entity.query.SysExportLogQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;

/**
 * @author lenmotion
 */
public interface SysExportLogService extends DonutService<SysExportLog> {

    /**
     * 分页查询
     * @param query 查询条件
     * @return      分页数据
     */
    IPage<SysExportLog> selectPageList(SysExportLogQuery query);

    /**
     * 开始导出
     * @param exportLogDTO
     * @return
     */
    SysExportLog startExport(StartExportLogDTO exportLogDTO);

    /**
     * 结束导出
     * @param exportLog
     */
    void endExport(SysExportLog exportLog);

}
