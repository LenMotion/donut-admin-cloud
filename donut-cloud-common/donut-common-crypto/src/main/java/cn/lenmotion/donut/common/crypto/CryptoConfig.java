package cn.lenmotion.donut.common.crypto;

import cn.hutool.crypto.asymmetric.RSA;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author lenmotion
 */
@Configuration
@RequiredArgsConstructor
public class CryptoConfig {

    @Value("${project.rsaPublicKey}")
    private String rsaPublicKey;

    @Value("${project.rsaPrivateKey}")
    private String rsaPrivateKey;

    @Bean("loginRsa")
    public RSA loginRsa() {
        return new RSA(rsaPrivateKey, rsaPublicKey);
    }

}
