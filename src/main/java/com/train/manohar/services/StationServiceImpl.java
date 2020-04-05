package com.train.manohar.services;

import com.train.manohar.domain.Station;
import com.train.manohar.repositories.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StationServiceImpl implements StationService {

    private StationRepository stationRepository;

    @Autowired
    public StationServiceImpl(StationRepository stationRepository) {
        this.stationRepository = stationRepository;
    }

    @Override
    public List<Station> listAll() {
        List<Station> trains = new ArrayList<>();
        stationRepository.findAll().forEach(trains::add);
        return trains;
    }

    @Override
    public Station getByStationName(String stationName){
        return stationRepository.findByStationName(stationName);
    }


}
