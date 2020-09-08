package br.com.yabaconsultoria.curadoria.config;

import br.com.yabaconsultoria.curadoria.interceptor.HttpInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 04/09/2020
 */

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    //
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // LogInterceptor apply to all URLs.
        registry.addInterceptor(new HttpInterceptor());

    }

}
