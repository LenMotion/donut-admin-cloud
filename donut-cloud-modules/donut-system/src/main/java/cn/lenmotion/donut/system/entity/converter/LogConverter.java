package cn.lenmotion.donut.system.entity.converter;

import cn.lenmotion.donut.system.entity.vo.export.LoginLogExportVO;
import cn.lenmotion.donut.system.entity.po.SysLoginLog;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author lenmotion
 */
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface LogConverter {

    LogConverter INSTANCE = Mappers.getMapper(LogConverter.class);

    LoginLogExportVO toExportVO(SysLoginLog loginLog);

    List<LoginLogExportVO> toExportVO(List<SysLoginLog> loginLog);

}
