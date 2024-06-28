package cn.lenmotion.donut.common.starter.annotation;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

import java.lang.annotation.*;

/**
 * @author lenmotion
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
@Documented
@EnableFeignClients("cn.lenmotion.donut")
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan({"cn.lenmotion.donut"})
public @interface DonutApplication {
}
