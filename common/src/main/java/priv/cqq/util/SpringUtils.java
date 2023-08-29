package priv.cqq.util;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.ConstructorArgumentValues;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanDefinitionRegistryPostProcessor;
import org.springframework.beans.factory.support.GenericBeanDefinition;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import java.lang.annotation.Annotation;
import java.util.Map;

/**
 * Created by Kim QQ.Cong on 2022/12/31 / 14:01
 *
 * @author: CongQingquan
 * @Description: Spring 上下文工具类
 */
@Component
public class SpringUtils implements ApplicationContextAware, BeanDefinitionRegistryPostProcessor {
    
    public static ApplicationContext applicationContext;

    public static BeanDefinitionRegistry beanDefinitionRegistry;
    
    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
        throws BeansException {
        SpringUtils.applicationContext = applicationContext;
    }
    
    @Override
    public void postProcessBeanDefinitionRegistry(BeanDefinitionRegistry beanDefinitionRegistry) throws BeansException {
        SpringUtils.beanDefinitionRegistry = beanDefinitionRegistry;
    }
    
    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        // Do nothing
    }
    
    /**
     * ==================== Registry function ====================
     */
    
    /**
     * 创建 Bean
     * @param beanClass
     * @param constructorArgumentValues
     * @return
     * @param <T>
     */
    public static <T> T createBean(Class<T> beanClass, Object... constructorArgumentValues) {
        GenericBeanDefinition beanDefinition = new GenericBeanDefinition();
        beanDefinition.setBeanClass(beanClass);
        ConstructorArgumentValues argumentValues = new ConstructorArgumentValues();
        for (int i = 0; i < constructorArgumentValues.length; i++) {
            argumentValues.addGenericArgumentValue(constructorArgumentValues[i]);
        }
        beanDefinition.setConstructorArgumentValues(argumentValues);
        beanDefinitionRegistry.registerBeanDefinition(beanDefinition.getBeanClassName(), beanDefinition);
        return getBean(beanClass);
    }
    
    /**
     * ==================== Basic function ====================
     */

    /**
     * 根据BeanName获取Bean
     * @param name
     * @return
     */
    public static Object getBean(String name) {
        return applicationContext.getBean(name);
    }

    /**
     * 根据BeanName获取Bean
     * @param requiredType
     * @return
     */
    public static <T> T getBean(Class<T> requiredType) {
        return applicationContext.getBean(requiredType);
    }

    /**
     * 根据BeanName与Type获取Bean
     * @param name
     * @param requiredType
     * @param <T>
     * @return
     */
    public static <T> T getBean(String name, Class<T> requiredType) {
        return applicationContext.getBean(name, requiredType);
    }

    /**
     * 判断是否包含Bean
     * @param name
     * @return
     */
    public static boolean containsBean(String name) {
        return applicationContext.containsBean(name);
    }

    /**
     * 判断Bean是否为单例
     * @param name
     * @return
     */
    public static boolean isSingleton(String name) {
        return applicationContext.isSingleton(name);
    }

    /**
     * 判断Bean是否为多例
     * @param name
     * @return
     */
    public static boolean isPrototype(String name) {
        return applicationContext.isPrototype(name);
    }

    /**
     * 获取上下文资源
     * @param location
     * @return
     */
    public static Resource getResource(String location) {
        return applicationContext.getResource(location);
    }

    /**
     * 获取标记了指定注解的Bean列表
     * @param annotationClass
     * @return
     */
    public static Map<String, Object> getBeansWithAnnotation(Class<? extends Annotation> annotationClass) {
        return applicationContext.getBeansWithAnnotation(annotationClass);
    }

    /**
     * 获取指定类型的Bean列表
     * @param typeClass
     * @return
     */
    public static <T> Map<String, T> getBeansOfType(Class<T> typeClass) {
        return applicationContext.getBeansOfType(typeClass);
    }

    /**
     * 根据BeanName获取Bean的类型
     * @param name
     * @return
     */
    public static Class<? extends Object> getType(String name) {
        return applicationContext.getType(name);
    }
    
    /**
     * ==================== Environment function ====================
     */
    
    /**
     * 获取应用上下文
     * @return
     */
    public static Environment getEnvironment() {
        return applicationContext.getEnvironment();
    }

    /**
     * 获取程序配置属性
     * @return
     */
    public static String getProperty(String key) {
        return applicationContext.getEnvironment().getProperty(key);
    }

    /**
     * 获取程序配置属性
     * @return
     */
    public static <T> T getProperty(String key, Class<T> typeClass) {
        return applicationContext.getEnvironment().getProperty(key, typeClass);
    }

    /**
     * 获取当前环境
     * @return
     */
    public static String currentEnvironment() {
        String[] activeProfiles = applicationContext.getEnvironment().getActiveProfiles();
        if (ArrayUtils.isEmpty(activeProfiles)) {
            throw new RuntimeException("No environment set");
        }
        return applicationContext.getEnvironment().getActiveProfiles()[0];
    }

    /**
     * 是否在指定环境环境
     * @return
     */
    public static boolean inEnvironment(String environment) {
        return currentEnvironment().equals(environment);
    }

}
