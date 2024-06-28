package cn.lenmotion.donut.basic.gateway.filter;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.exception.SaTokenException;
import cn.dev33.satoken.filter.SaFilter;
import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import cn.dev33.satoken.router.SaHttpMethod;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONUtil;
import cn.lenmotion.donut.common.core.entity.ResponseResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author lenmotion
 */
@Slf4j
@Configuration
public class DonutSaReactorFilter {

    @Bean
    public SaFilter getSaReactorFilter() {
        return new SaReactorFilter()
                // 拦截地址 - 拦截全部path
                .addInclude("/**")
                // 开放地址
                .addExclude("/favicon.ico")
                // 鉴权方法：每次访问进入
                // 全局认证函数
                .setAuth(obj -> SaRouter
                        // 拦截的所有接口
                        .match("/**")
                        // 忽略所有登陆相关接口
                        .notMatch("/auth/**",
                                "/ws/**",
                                "/system/config/loginPage",
                                "/system/sysTenant/baseInfo/**")
                        // 忽略所有接口文档相关接口
                        .notMatch("/doc.html",
                                "/webjars/**",
                                "/swagger-resources",
                                "/v3/api-docs/**",
                                "/*/v3/api-docs/**")
                        // 要执行的校验动作，可以写完整的 lambda 表达式
                        .check(r -> StpUtil.checkLogin()))
                // 异常处理函数
                .setError(e -> {
                    if (e instanceof SaTokenException) {
                        return JSONUtil.toJsonStr(ResponseResult.unLogin(e.getMessage()));
                    }
                    return JSONUtil.toJsonStr(ResponseResult.failed(e.getMessage()));
                })
                // 前置函数：在每次认证函数之前执行
                .setBeforeAuth(obj -> {
                    // ---------- 设置跨域响应头 ----------
                    SaHolder.getResponse()
                            // 允许指定域访问跨域资源
                            .setHeader("Access-Control-Allow-Origin", "*")
                            // 允许所有请求方式
                            .setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS")
                            // 有效时间
                            .setHeader("Access-Control-Max-Age", "3600")
                            // 允许的header参数
                            .setHeader("Access-Control-Allow-Headers", "*");
                    // 如果是预检请求，则立即返回到前端
                    SaRouter.match(SaHttpMethod.OPTIONS)
                            .free(r -> log.info("--------OPTIONS预检请求，不做处理--------"))
                            .back();
                });
    }


}
