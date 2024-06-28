package cn.lenmotion.donut.common.starter.config;

import cn.lenmotion.donut.common.core.entity.ResponseResult;
import cn.lenmotion.donut.common.core.enums.ResponseCodeEnum;
import cn.lenmotion.donut.common.core.exception.BusinessException;
import cn.lenmotion.donut.common.core.utils.AssertUtils;
import com.alibaba.fastjson.JSON;
import feign.FeignException;
import feign.Response;
import feign.Util;
import feign.codec.Decoder;
import feign.optionals.OptionalDecoder;
import org.springframework.cloud.openfeign.support.ResponseEntityDecoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

/**
 * @author lenmotion
 */
@Configuration
public class FeignConfig {

    /**
     * 自定义解析器
     *
     * @return 解析器
     */
    @Bean
    public Decoder decoder() {
        return new OptionalDecoder((new ResponseEntityDecoder(new CustomDecoder())));
    }

    static class CustomDecoder implements Decoder {

        @Override
        public Object decode(Response response, Type type) throws IOException, FeignException {
            ResponseResult<?> responseData = JSON.parseObject(responseBodyToString(response), ResponseResult.class);
            AssertUtils.notNull(responseData, "feign调用失败");
            if (Objects.equals(responseData.getCode(), ResponseCodeEnum.SUCCESS.getCode())) {
                if (responseData.getResult() != null) {
                    return JSON.parseObject(responseData.getResult().toString(), type);
                }
                return null;
            }
            throw new BusinessException(responseData.getMsg());
        }

        public static String responseBodyToString(Response response) throws IOException {
            byte[] bodyBytes = Util.toByteArray(response.body().asInputStream());
            return new String(bodyBytes, StandardCharsets.UTF_8);
        }
    }

}
