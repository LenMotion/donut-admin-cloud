package cn.lenmotion.donut.system.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @author lenmotion
 */
@Configuration
@EnableWebSocket
public class WebsocketConfig {

    // websocket
    @Bean
    public ServerEndpointExporter serverEndpointExporter () {
        return new ServerEndpointExporter();
    }

}
