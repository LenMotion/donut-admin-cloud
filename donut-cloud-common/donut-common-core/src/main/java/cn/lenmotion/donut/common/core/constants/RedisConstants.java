package cn.lenmotion.donut.common.core.constants;

/**
 * @author lenmotion
 */
public interface RedisConstants {

    // 验证码的缓存key
    String CAPTCHA_CODE_KEY = "captcha_codes:";

    String CONFIG_KEY = "cache:config";

    String RATE_LIMIT_KEY = "rate_limit:";

    String USER_READ_NOTICE_LOCK_KEY = "user_read_notice_lock:";

}
