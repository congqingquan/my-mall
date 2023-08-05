package priv.cqq.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

//@Configuration
public class GlobalCorsConfig {

    private final List<String> allowOrigins = Arrays.asList("http://localhost:8001", "http://localhost:8002", "http://localhost:8003");
    
    private final List<String> allowMethods = Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS");
    
    private final List<String> allowHeaders = Arrays.asList("header1", "header2");

    @Bean
    public CorsWebFilter corsWebFilter() {
        CorsConfiguration config = new CorsConfiguration();
        // allowOrigins.forEach(config::addAllowedOrigin);
        config.setAllowedOrigins(Collections.singletonList("*"));
        allowMethods.forEach(config::addAllowedMethod);
        allowHeaders.forEach(config::addAllowedHeader);
        config.setAllowCredentials(true);
        config.setMaxAge(360000L);
        config.addExposedHeader("*"); // 暴露头部信息
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource(); // org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource
        source.registerCorsConfiguration("/**", config);
        return new CorsWebFilter(source);
    }
}