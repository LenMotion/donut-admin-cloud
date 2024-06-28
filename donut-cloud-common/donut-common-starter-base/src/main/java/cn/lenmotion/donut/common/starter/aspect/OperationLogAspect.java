package cn.lenmotion.donut.common.starter.aspect;

import cn.dev33.satoken.stp.StpUtil;
import cn.lenmotion.donut.common.core.annotation.OperationLog;
import cn.lenmotion.donut.common.core.enums.BaseStatusEnum;
import cn.lenmotion.donut.common.core.utils.IpUtils;
import cn.lenmotion.donut.common.core.utils.JoinPointUtils;
import cn.lenmotion.donut.system.client.SysOperationLogFeignClient;
import cn.lenmotion.donut.system.entity.po.SysOperationLog;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Component;

/**
 * 操作日志记录处理
 *
 * @author lenmotion
 */
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class OperationLogAspect {

    private final SysOperationLogFeignClient operationLogFeignClient;
    private final HttpServletRequest request;
    private final TaskExecutor taskExecutor;

    /**
     * 处理完请求后执行
     *
     * @param joinPoint 切点
     */
    @AfterReturning(pointcut = "@annotation(operation)", returning = "jsonResult")
    public void doAfterReturning(JoinPoint joinPoint, OperationLog operation, Object jsonResult) {
        handleLog(joinPoint, operation, null, jsonResult);
    }

    /**
     * 拦截异常操作
     *
     * @param joinPoint 切点
     * @param e         异常
     */
    @AfterThrowing(value = "@annotation(operation)", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, OperationLog operation, Exception e) {
        handleLog(joinPoint, operation, e, null);
    }

    /**
     * 保存操作日志
     */
    protected void handleLog(final JoinPoint joinPoint, OperationLog operation, final Exception e, Object jsonResult) {
        try {
            // 生成日志
            SysOperationLog operationLog = new SysOperationLog();
            operationLog.setStatus(BaseStatusEnum.ENABLED.getCode());
            // 请求的地址
            String ip = IpUtils.getIpAddr(request);
            operationLog.setIp(ip);
            operationLog.setUrl(request.getRequestURI());
            if (StpUtil.isLogin()) {
                operationLog.setUserId(StpUtil.getLoginIdAsLong());
            }
            // 是否有异常
            if (e != null) {
                operationLog.setStatus(BaseStatusEnum.ENABLED.getCode());
                operationLog.setErrorMsg(StringUtils.substring(e.getMessage(), 0, 2000));
            }
            // 设置方法名称
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            operationLog.setMethod(className + "." + methodName);
            // 设置请求方式
            operationLog.setRequestMethod(request.getMethod());
            // 设置标题
            operationLog.setTitle(operation.value());
            // 获取参数的信息，传入到数据库中。
            setRequestValue(joinPoint, operationLog);
            taskExecutor.execute(() -> operationLogFeignClient.saveOperationLog(operationLog));
        } catch (Exception exp) {
            log.error("记录操作日志失败", exp);
        }
    }

    /**
     * 获取请求的参数，放到log中
     */
    private void setRequestValue(JoinPoint joinPoint, SysOperationLog operationLog) {
        String params = JoinPointUtils.getJoinPointParams(joinPoint, request);
        operationLog.setParams(StringUtils.substring(params, 0, 2000));
    }

}
