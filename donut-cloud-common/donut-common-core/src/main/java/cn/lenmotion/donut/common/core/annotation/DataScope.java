package cn.lenmotion.donut.common.core.annotation;

import cn.lenmotion.donut.common.core.enums.DataScopeTypeEnum;

import java.lang.annotation.*;

/**
 * @author lenmotion
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataScope {

    DataScopeTypeEnum type();

    String deptField() default "";

    String deptAlias() default "";

    String roleField() default "";

    String roleAlias() default "";

    String menuField() default "";

    String menuAlias() default "";

    /**
     * 是否忽略租户管理员
     * @return
     */
    boolean tenantAdminIgnore() default false;

}
