package com.dber.base.config;

import com.dber.base.util.JdbcPoolConfig;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("dber")
@Data
public class SystemConfig {
    private final Service service = new Service();
    private final Web web = new Web();

    @Data
    public static class Service {
        private String name;

        private JdbcPoolConfig database = new JdbcPoolConfig();
    }

    @Data
    public static class Web {
        private String baseUrl;
    }
}
