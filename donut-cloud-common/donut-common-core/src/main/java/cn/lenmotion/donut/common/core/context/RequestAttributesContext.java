package cn.lenmotion.donut.common.core.context;

import com.alibaba.ttl.TransmittableThreadLocal;
import jakarta.annotation.Nullable;
import org.springframework.web.context.request.RequestAttributes;

/**
 * @author LenMotion
 */
public class RequestAttributesContext {
    private static final TransmittableThreadLocal<RequestAttributes> CONTEXT =
            new TransmittableThreadLocal<>();

    public static void resetRequestAttributes() {
        CONTEXT.remove();
    }


    public static void setRequestAttributes(@Nullable RequestAttributes attributes) {
        if (attributes == null) {
            resetRequestAttributes();
        } else {
            CONTEXT.set(attributes);
        }
    }

    public static RequestAttributes getRequestAttributes() {
        return CONTEXT.get();
    }

}
