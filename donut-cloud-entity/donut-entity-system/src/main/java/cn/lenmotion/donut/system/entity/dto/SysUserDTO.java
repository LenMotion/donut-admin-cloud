package cn.lenmotion.donut.system.entity.dto;

import cn.lenmotion.donut.common.core.entity.BaseCreatePo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * @author lenmotion
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysUserDTO extends BaseCreatePo {

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 岗位ID
     */
    private Long postId;

    /**
     * 用户编号
     */
    private String userCode;

    /**
     * 用户账号
     */
    private String username;

    /**
     * 用户昵称
     */
    private String nickName;

    /**
     * 真是姓名
     */
    private String realName;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    private String phoneNumber;

    /**
     * 用户性别
     */
    private String sex;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 密码
     */
    private String password;

    /**
     * 民族
     */
    private String nation;

    /**
     * 身份证类型
     */
    private String idType;

    /**
     * 身份证 - 做加密
     */
    private String idCard;

    /**
     * 文化程度
     */
    private String cultureType;

    /**
     * 政治面貌
     */
    private String politicalOutlook;

    /**
     * 住址
     */
    private String address;

    /**
     * 入职时间
     */
    private LocalDate entryDate;

    /**
     * 帐号状态（0正常 1停用）
     */
    private String status;

    /**
     * 最后登录IP
     */
    @Schema(description = "最后登录IP")
    private String loginIp;

    /**
     * 最后登录时间
     */
    private LocalDateTime loginDate;

    /**
     * 快捷导航，首页的快捷菜单id
     */
    private String quickNav;

    /**
     * 备注
     */
    private String remark;
}
