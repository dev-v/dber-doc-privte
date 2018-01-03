package com.dber.#{packageName};

import com.dber.#{packageName}.config.#{projectJavaName}AppConfig;
import org.junit.runner.RunWith;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@SpringBootApplication
@Import(#{projectJavaName}AppConfig.class)
public class ApplicationTest {

    public static void main(String[] args) {
        SpringApplication.run(#{projectJavaName}AppConfig.class,args);
    }

}