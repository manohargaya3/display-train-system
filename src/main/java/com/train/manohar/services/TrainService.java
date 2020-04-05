package com.train.manohar.services;

import com.train.manohar.domain.Train;
import com.train.manohar.domain.TrainCurrentLocation;

import java.util.List;

public interface TrainService {

    List<Train> listAll();

    Train getByTrainId(int trainId);

    Train getByTrainName(String trainName);

    List<TrainCurrentLocation> getAllTrainsLiveLocations();

    TrainCurrentLocation getTrainCurrentLocationByTrainId(int trainId);

    List<TrainCurrentLocation> getTrainRunningStatusByTrainId(int trainId);

    List<Train> getByFromStationAndToStation(List<Integer> stations);
}
