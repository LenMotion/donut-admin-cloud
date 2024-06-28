package cn.lenmotion.donut.basic.gateway.handler;

import cn.dev33.satoken.exception.SaTokenException;
import cn.hutool.http.ContentType;
import cn.lenmotion.donut.common.core.entity.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebExceptionHandler;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;

/**
 * @author lenmotion
 */
@Slf4j
@Order(-1)
@Component
public class GlobWebExceptionHandler implements WebExceptionHandler {

    @Override
    public Mono<Void> handle(ServerWebExchange exchange, Throwable ex) {
        String message = JSONObject.toJSONString(this.buildResponseResult(ex), SerializerFeature.WriteNullStringAsEmpty);
        DataBuffer buffer = exchange.getResponse().bufferFactory().wrap(message.getBytes(StandardCharsets.UTF_8));
        exchange.getResponse().setStatusCode(HttpStatus.OK);
        exchange.getResponse().getHeaders().add("Content-Type", ContentType.build(ContentType.JSON, StandardCharsets.UTF_8));
        return exchange.getResponse().writeWith(Mono.just(buffer));
    }

    private ResponseResult<Object> buildResponseResult(Throwable ex) {
        if (ex instanceof SaTokenException tokenException) {
            return ResponseResult.unLogin(tokenException.getCause().getMessage());
        }
        log.error("系统异常", ex);
        return ResponseResult.failed();
    }

}

