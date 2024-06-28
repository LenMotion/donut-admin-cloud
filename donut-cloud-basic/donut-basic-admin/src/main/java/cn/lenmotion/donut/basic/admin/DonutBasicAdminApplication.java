package cn.lenmotion.donut.basic.admin;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author lenmotion
 */

@EnableAdminServer
@EnableDiscoveryClient
@SpringBootApplication
public class DonutBasicAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(DonutBasicAdminApplication.class, args);
    }

}
