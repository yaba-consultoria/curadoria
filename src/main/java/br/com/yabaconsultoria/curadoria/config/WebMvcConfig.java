package br.com.yabaconsultoria.curadoria.config;

import br.com.yabaconsultoria.curadoria.interceptor.HttpInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;
import java.util.Collections;

/**
 * Classe de configuração web do projeto
 * @author Lucas Copque
 * @version 1.0
 * @since 04/09/2020
 */

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * Adiciona HttpInterceptior filter
     * @param registry Custom HttpInterceptor filter
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new HttpInterceptor());
    }

    /**
     * Adiciona Cors filter
     * @param registry Custom Cors filter
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedMethods("*");
    }
}
