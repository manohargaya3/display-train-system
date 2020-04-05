package com.train.manohar.repositories;

import com.train.manohar.domain.Station;
import org.springframework.data.repository.CrudRepository;


public interface StationRepository extends CrudRepository<Station, Long> {
    Station findByStationName(String stationName);
}
