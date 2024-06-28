package cn.lenmotion.donut.common.core.entity;

import cn.lenmotion.donut.common.core.enums.DataScopeEnum;
import lombok.Data;

import java.util.Set;

/**
 * 登录信息
 * @author lenmotion
 */
@Data
public class LoginInfo {

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 用户id
     */
    private String username;

    /**
     * 用户的权限范围
     */
    private Set<DataScopeEnum> roleDataScopes;

    /**
     * 部门结构
     */
    private Set<String> deptAncestors;

}
