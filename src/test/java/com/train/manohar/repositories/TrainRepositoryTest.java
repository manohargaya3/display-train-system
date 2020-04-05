package com.train.manohar.repositories;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class TrainRepositoryTest {

    private static final BigDecimal BIG_DECIMAL_100 = BigDecimal.valueOf(100.00);
    private static final String TRAIN_DESCRIPTION = "a cool train";
    private static final String IMAGE_URL = "http://an-imageurl.com/image1.jpg";

    @Autowired
    private TrainRepository trainRepository;

    @Before
    public void setUp() throws Exception {

    }

    @Test
    public void testPersistence() {

    }
}