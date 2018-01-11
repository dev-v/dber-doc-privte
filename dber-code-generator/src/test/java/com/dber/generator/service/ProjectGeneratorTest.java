package com.dber.generator.service;

import com.dber.generator.config.ProjectGeneratorServiceConfig;
import com.dber.generator.entity.Project;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.ConfigFileApplicationContextInitializer;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
@ContextConfiguration(classes = ProjectGeneratorServiceConfig.class, initializers = ConfigFileApplicationContextInitializer.class)
@FixMethodOrder(MethodSorters.JVM)
public class ProjectGeneratorTest {

	@Autowired
	ProjectGenerator generator;

	private String modelPath = "E:\\dber_work\\dber\\dber-code-generate-model\\";
	private String projectDir = "E:\\dber_work\\generate_code\\";

	@Test
	public void test1_generate_dber_plat() {
		generator.createProject(new Project(modelPath, projectDir, "dber_plat", "dber-plat", "plat"));
	}

	@Test
	public void test2_generate_dber_shop() {
		generator.createProject(new Project(modelPath, projectDir, "dber_shop", "dber-shop", "shop"));
	}

}
