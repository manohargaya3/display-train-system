package com.train.manohar.controllers;

import com.train.manohar.repositories.TrainRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@Transactional
@AutoConfigureMockMvc
@TestExecutionListeners(mergeMode = TestExecutionListeners.MergeMode.MERGE_WITH_DEFAULTS)
public class TrainControllerIT {

    @Autowired
    private MockMvc mvc;

    @Autowired
    private TrainRepository trainRepository;

    @Mock
    private TrainRepository trainRepositoryTemp;

    @Before
    public void setUp() throws Exception {
        Mockito.when(trainRepositoryTemp.findByTrainId(ArgumentMatchers.anyInt())).thenReturn(trainRepository.findByTrainId(Integer.valueOf(1)));

    }

    @Test
    public void testGetTrainByTrainId() throws Exception {
        mvc.perform(get("/train/bytrainid").param("trainId", "1"))
                .andExpect(status().isOk());
    }

    public static MockHttpServletRequestBuilder get(String urlTemplate, Object... urlVariables) {
        return MockMvcRequestBuilders.get(urlTemplate, urlVariables).requestAttr("org.springframework.restdocs.urlTemplate", urlTemplate);
    }
}