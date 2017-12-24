package com.dber.generator.service;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.ConfigFileApplicationContextInitializer;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dber.generator.config.GeneratorServiceConfig;
import com.dber.generator.entity.Project;

/**
 * <li>文件名称: ProjectGeneratorTest.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月24日
 * @author dev-v
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@ContextConfiguration(classes = GeneratorServiceConfig.class, initializers = ConfigFileApplicationContextInitializer.class)
@FixMethodOrder(MethodSorters.JVM)
public class ProjectGeneratorTest {

	@Autowired
	ProjectGenerator generator;

	String modelPath = "E:\\dber_work\\dber\\dber-code-generate-model\\";
	String projectDir = "E:\\dber_work\\dber-generator-test";

	@Test
	public void test() {
		generator.createProject(new Project(modelPath, projectDir,"dber_plat", "dber-plat", "plat"));
	}

}
