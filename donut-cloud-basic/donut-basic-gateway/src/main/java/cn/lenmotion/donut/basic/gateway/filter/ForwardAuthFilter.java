package cn.lenmotion.donut.basic.gateway.filter;

import cn.dev33.satoken.config.SaTokenConfig;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.DependsOn;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @author lenmotion
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class ForwardAuthFilter implements GlobalFilter {

    private final SaTokenConfig saTokenConfig;

    @Override
    @DependsOn("getSaReactorFilter")
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        // 获取原始请求中的 Authorization 头
        String authorizationHeader = exchange.getRequest().getHeaders().getFirst(saTokenConfig.getTokenName());
        log.info("request auth header: {}", authorizationHeader);

        ServerWebExchange newExchange;
        if (StrUtil.isNotBlank(authorizationHeader)) {
            ServerHttpRequest newRequest = exchange.getRequest().mutate().header(saTokenConfig.getTokenName(), authorizationHeader).build();
            newExchange = exchange.mutate().request(newRequest).build();
        } else {
            newExchange = exchange.mutate().request(exchange.getRequest()).build();
        }

        return chain.filter(newExchange);
    }
}
