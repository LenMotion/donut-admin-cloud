package cn.lenmotion.donut.common.starter.listener;

import cn.lenmotion.donut.common.core.context.RequestAttributesContext;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @author LenMotion
 */
public class DonutServletRequestListener implements ServletRequestListener {

    private static final String REQUEST_ATTRIBUTES_ATTRIBUTE =
            DonutServletRequestListener.class.getName() + ".REQUEST_ATTRIBUTES";

    /**
     * 初始化
     *
     * @param requestEvent Information about the request
     */
    @Override
    public void requestInitialized(ServletRequestEvent requestEvent) {
        if (!(requestEvent.getServletRequest() instanceof HttpServletRequest request)) {
            throw new IllegalArgumentException(
                    "Request is not an HttpServletRequest: " + requestEvent.getServletRequest());
        }
        ServletRequestAttributes attributes = new ServletRequestAttributes(request);
        request.setAttribute(REQUEST_ATTRIBUTES_ATTRIBUTE, attributes);
        LocaleContextHolder.setLocale(request.getLocale());
        RequestAttributesContext.setRequestAttributes(attributes);
    }

}
