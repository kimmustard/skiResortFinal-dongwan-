package com.web.www.config;

import java.util.concurrent.Executor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;


@Configuration
@EnableAsync
public class AsyncConfig {

    @Bean(name = "RegionInit")
    public Executor regionIntExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(2);	//스레드풀 사이즈
        executor.setMaxPoolSize(10);	//스레드 풀 최대 개수
        executor.setQueueCapacity(500);	//스레드 풀 작업 대기열 크기
        executor.setThreadNamePrefix("RegionInit-");	
        executor.initialize();
        return executor;
    }
}
