package cn.lenmotion.donut.system.entity.converter;

import cn.lenmotion.donut.system.entity.request.SysRoleRequest;
import cn.lenmotion.donut.system.entity.po.SysRole;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.mapstruct.factory.Mappers;

/**
 * @author lenmotion
 */
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface RoleConverter {

    RoleConverter INSTANCE = Mappers.getMapper(RoleConverter.class);

    SysRole requestToPo(SysRoleRequest request);

}
