package cn.lenmotion.donut.basic.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author lenmotion
 */
@SpringBootApplication
@EnableDiscoveryClient
public class DonutBasicGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(DonutBasicGatewayApplication.class);
    }

}
