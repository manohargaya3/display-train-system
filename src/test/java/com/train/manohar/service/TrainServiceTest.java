package com.train.manohar.service;

import com.train.manohar.domain.Train;
import com.train.manohar.repositories.TrainRepository;
import com.train.manohar.services.TrainServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class TrainServiceTest {

   
    @Mock
    private TrainRepository trainRepository;

    @InjectMocks
    private TrainServiceImpl trainService;

    @Before
    public void setUp() throws Exception {
        trainService = new TrainServiceImpl(trainRepository);
        Mockito.when(trainRepository.findByTrainId(ArgumentMatchers.anyInt())).thenReturn(new Train());

    }

    @Test
    public void testCreateAccountBadValues() {
        Train train = trainService.getByTrainId(1);
        Assert.assertNotNull(train);
        Mockito.verify(trainRepository).findByTrainId(ArgumentMatchers.anyInt());
    }
}