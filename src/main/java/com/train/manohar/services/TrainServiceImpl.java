package com.train.manohar.services;

import com.train.manohar.domain.Train;
import com.train.manohar.domain.TrainCurrentLocation;
import com.train.manohar.repositories.TrainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

@Service
public class TrainServiceImpl implements TrainService {

    private TrainRepository trainRepository;

    @Autowired
    public TrainServiceImpl(TrainRepository trainRepository) {
        this.trainRepository = trainRepository;
    }


    @Override
    public List<Train> listAll() {
        List<Train> trains = new ArrayList<>();
        trainRepository.findAll().forEach(trains::add);
        return trains;
    }

    @Override
    public Train getByTrainName(String trainName) {
        return trainRepository.findByTrainName(trainName);
    }

    @Override
    public Train getByTrainId(int trainId) {
        return trainRepository.findByTrainId(Integer.valueOf(trainId));
    }


    @Override
    public TrainCurrentLocation getTrainCurrentLocationByTrainId(int trainId) {
        List<Object[]> list = trainRepository.findTrainCurrentLocationByTrainId(Integer.valueOf(trainId));
        TrainCurrentLocation trainCurrentLocation = new TrainCurrentLocation();
        for(Object[] obj : list){
            String trainName = (String) obj[0];
            trainCurrentLocation.setTrainName(trainName);
            String stationName = (String) obj[1];
            trainCurrentLocation.setStationName(stationName);
            Time trainTime = (Time) obj[2];
            trainCurrentLocation.setTime(trainTime);
        }
        return trainCurrentLocation;
    }

    @Override
    public List<TrainCurrentLocation> getAllTrainsLiveLocations() {
        List<Train> allTrains = listAll();
        List<TrainCurrentLocation> trainLiveLocations = new ArrayList<>();
        for (Train train: allTrains) {
            List<Object[]> list = trainRepository.findTrainCurrentLocationByTrainId(Integer.valueOf(train.getTrainId()));
            TrainCurrentLocation trainCurrentLocation = new TrainCurrentLocation();
            for (Object[] obj : list) {
                String trainName = (String) obj[0];
                trainCurrentLocation.setTrainName(trainName);
                String stationName = (String) obj[1];
                trainCurrentLocation.setStationName(stationName);
                Time trainTime = (Time) obj[2];
                trainCurrentLocation.setTime(trainTime);
                trainLiveLocations.add(trainCurrentLocation);
            }
        }
        return trainLiveLocations;
    }

    @Override
    public List<TrainCurrentLocation> getTrainRunningStatusByTrainId(int trainId) {
        List<Object[]> list = trainRepository.findTrainRunningStatusByTrainId(Integer.valueOf(trainId));
        List<TrainCurrentLocation> locations = new ArrayList<>();
        for(Object[] obj : list){
            TrainCurrentLocation location = new TrainCurrentLocation();
            String trainName = (String) obj[0];
            location.setTrainName(trainName);
            String stationName = (String) obj[1];
            location.setStationName(stationName);
            Time trainTime = (Time) obj[2];
            location.setTime(trainTime);
            locations.add(location);
        }
        return locations;
    }

    @Override
    public List<Train> getByFromStationAndToStation(List<Integer> stations){

        List<Train> trains= trainRepository.findByFromStationNameAndToStationName(stations);
        return trains;
    }
}
