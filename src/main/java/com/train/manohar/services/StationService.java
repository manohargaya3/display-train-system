package com.train.manohar.services;

import com.train.manohar.domain.Station;

import java.util.List;

public interface StationService {

    List<Station> listAll();
    Station getByStationName(String stationName);
}
