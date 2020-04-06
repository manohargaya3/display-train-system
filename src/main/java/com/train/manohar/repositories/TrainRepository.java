package com.train.manohar.repositories;

import com.train.manohar.domain.Train;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource
public interface TrainRepository extends CrudRepository<Train, Long> {
    Train findByTrainId(int trainId);
    Train findByTrainName(String trainName);

    @Query(name = "trainInfoByLocations", value = "select train_id, train_name, train_type, from_station, to_station, train_class_type_train_id, train_schedule_train_id "+
            "from train where train_id in (select ts.train_id from time_table_for_station ts where ts.station_id in (:stations) group by train_id having count(*)>1)"
            , nativeQuery = true)
    List<Train> findByFromStationNameAndToStationName(List<Integer> stations);

    @Query(name = "trainCurrentLocation", value = "SELECT t.train_name, s.station_name, ts.train_timings " +
            "FROM train t, station s, time_table_for_station ts " +
            "where t.train_id = :trainId and t.train_id = ts.train_id and s.station_id = ts.station_id and ts.train_timings < CURRENT_TIME order by ts.train_timings desc LIMIT 1", nativeQuery=true)
    List<Object[]> findTrainCurrentLocationByTrainId(int trainId);

    @Query(name = "trainCurrentLocation", value = "SELECT t.train_name, s.station_name, ts.train_timings " +
            "FROM train t, station s, time_table_for_station ts " +
            "where t.train_id = :trainId and t.train_id = ts.train_id and s.station_id = ts.station_id order by ts.train_timings asc", nativeQuery=true)
    List<Object[]> findTrainRunningStatusByTrainId(int trainId);
}
