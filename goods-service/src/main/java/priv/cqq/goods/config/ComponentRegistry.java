package priv.cqq.goods.config;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanDefinitionRegistryPostProcessor;
import org.springframework.beans.factory.support.GenericBeanDefinition;
import org.springframework.stereotype.Component;
import priv.cqq.exception.GlobalExceptionHandler;

import java.util.Objects;

/**
 * Created by Kim QQ.Cong on 2022/12/31 / 18:27
 *
 * @author: CongQingquan
 * @Description: 组件注册器
 */
@Component
public class ComponentRegistry implements BeanDefinitionRegistryPostProcessor {
    
    @Override
    public void postProcessBeanDefinitionRegistry(BeanDefinitionRegistry registry) throws BeansException {
        // 1. 注册全局异常处理器
         GenericBeanDefinition beanDefinition = new GenericBeanDefinition();
         beanDefinition.setBeanClass(GlobalExceptionHandler.class);
         registry.registerBeanDefinition(Objects.requireNonNull(beanDefinition.getBeanClassName()), beanDefinition);
    }
    
    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        // Do nothing
    }
}
