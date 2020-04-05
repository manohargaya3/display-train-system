package com.train.manohar.domain;

import lombok.Data;

import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.SqlResultSetMapping;
import java.sql.Time;

@SqlResultSetMapping(
        name = "trainCurrentLocation", // If @Query does not specify name, the method name will be used by default.
        classes = {
                @ConstructorResult(
                        targetClass = TrainCurrentLocation.class,
                        columns = {
                        @ColumnResult( name = "train_name", type = String.class),
                        @ColumnResult( name = "station_name", type = String.class),
                        @ColumnResult( name = "train_timings", type = Time.class)
                }
                )
        }
)
@Data
public class TrainCurrentLocation {
    private String trainName;
    private String stationName;
    private Time time;
}
