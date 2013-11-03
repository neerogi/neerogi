package org.neerogi.web;

import org.hibernate.engine.jdbc.internal.Formatter;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;

/**
 * Implements application utility methods.
 */
public class ApplicationUtil {

    public static String getEntityLink(String entityName, int id, String displayText) {
       return String.format("<a href=\"%s\">%s</a>", getEntityUrl(entityName, id), displayText);
    }

    public static String getEntityUrl(String entityName, int id) {
        return String.format("%s/%s/%d", getBaseURL(), entityName, id);
    }

    public static String getBaseURL() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        try {
            URL url = new URL(request.getScheme(),
                    request.getServerName(),
                    request.getServerPort(),
                    request.getContextPath());
            return url.toString();
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static SimpleDateFormat getSimpleDateFormat() {
        return new SimpleDateFormat("yyyy-MM-dd");
    }
}
