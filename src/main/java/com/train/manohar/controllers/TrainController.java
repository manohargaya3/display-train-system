package com.train.manohar.controllers;

import com.train.manohar.domain.Train;
import com.train.manohar.domain.TrainCurrentLocation;
import com.train.manohar.services.StationService;
import com.train.manohar.services.TrainService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;


@Controller
public class TrainController {
    private TrainService trainService;
    private StationService stationService;
    private static final String ERROR_500_MSG = "<p>Our system had an issue processing the request, and we're sorry for the trouble!</p><p>To get help creating your Guest account, contact the Support Center by <a href=\"tel:812-855-6789\">phone</a>, <a href=\"mailto:ithelp@iu.edu\"> email</a>, or <a href=\"http://ithelplive.iu.edu/\" target=\"_blank\">chat</a>.</p>";

    @Autowired
    public void setTrainService(TrainService trainService) {
        this.trainService = trainService;
    }

    @Autowired
    public void setStationService(StationService stationService) {
        this.stationService = stationService;
    }

    @RequestMapping("/")
    public ModelAndView redirectToList(){
        ModelAndView view = new ModelAndView("index");
        view.addObject("stations", stationService.listAll());
        return view;
    }

    @RequestMapping({"/train/list", "/train"})
    public ModelAndView listTrains(){
        ModelAndView view = new ModelAndView("train");
        view.addObject("trains", trainService.listAll());
        return view;
    }

    @RequestMapping({"/train/live/location"})
    public ModelAndView listTrainsWithLiveLocation(){
        ModelAndView view = new ModelAndView("liveTrains");
        view.addObject("trains", trainService.getAllTrainsLiveLocations());
        return view;
    }

    @RequestMapping("/train/bytrainid")
    public ModelAndView getTrainByTrainId(@PathParam("trainId") int trainId){
        ModelAndView view = new ModelAndView("show");
        Train train = trainService.getByTrainId(trainId);
        TrainCurrentLocation trainCurrentLocation = trainService.getTrainCurrentLocationByTrainId(trainId);
        List<TrainCurrentLocation> trainRunningStatus = trainService.getTrainRunningStatusByTrainId(trainId);
        view.addObject("train", train);
        view.addObject("trainCurrentLocation", trainCurrentLocation);
        view.addObject("trainRunningStatus", trainRunningStatus);
        return view;
    }

    @RequestMapping("/train/bytrainName")
    public ModelAndView getTrainByTrainName(@PathParam("trainName") String trainName){
        ModelAndView view = new ModelAndView("show");
        Train train = trainService.getByTrainName(trainName);
        if (train==null) {
            view = buildErrorModelAndView(ERROR_500_MSG);
            view.addObject("errMsg", "invalid train name entered");
        } else {
            TrainCurrentLocation trainCurrentLocation = trainService.getTrainCurrentLocationByTrainId(train.getTrainId());
            List<TrainCurrentLocation> trainRunningStatus = trainService.getTrainRunningStatusByTrainId(train.getTrainId());
            view.addObject("train", train);
            view.addObject("trainCurrentLocation", trainCurrentLocation);
            view.addObject("trainRunningStatus", trainRunningStatus);
        }
        return view;
    }

    @RequestMapping("/train/bylocation")
    public ModelAndView getStationByStaionName(@PathParam("stationName") String stationName){
        ModelAndView view;
        Set<Train> trains = null;
        if(StringUtils.isNoneBlank(stationName)) {
            trains = stationService.getByStationName(stationName).getTrains();
        }
        if (StringUtils.isBlank(stationName) || trains==null || trains.isEmpty()) {
            view = buildErrorModelAndView(ERROR_500_MSG);
            view.addObject("errMsg", "invalid station name entered");
        }else {
            view = new ModelAndView("train");
            view.addObject("stationName", stationName);
            view.addObject("trains", trains );
        }
        return view;
    }

    @RequestMapping("/train/bylocations")
    public ModelAndView getStationByFromStaionAndToStation(@PathParam("fromStationName") String fromStationName, @PathParam("toStationName") String toStationName){
        ModelAndView view = new ModelAndView("train");
        List<Integer> stationIdList = new ArrayList<>();
        if(stationService.getByStationName(fromStationName)!=null) {
            stationIdList.add(stationService.getByStationName(fromStationName).getStationId());
        }
        if(stationService.getByStationName(toStationName)!=null){
        stationIdList.add(stationService.getByStationName(toStationName).getStationId());
        }
        view.addObject("fromStationName", fromStationName);
        view.addObject("toStationName", toStationName);
        view.addObject("trains", trainService.getByFromStationAndToStation(Arrays.asList(3,5)));
        return view;
    }

    private ModelAndView buildErrorModelAndView(String errMsg) {
        ModelAndView errMav = new ModelAndView("error");

        if (StringUtils.isNotBlank(errMsg)) {
            errMav.addObject("errMsg", errMsg);
        }

        return errMav;
    }

}
