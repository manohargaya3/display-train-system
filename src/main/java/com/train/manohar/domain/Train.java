package com.train.manohar.domain;


import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "train")
@Data
public class Train {

    @Id
    @Column(name = "train_id")
    private int trainId;
    @Column(name = "train_name")
    private String trainName;
    @Column(name = "train_type")
    private String trainType;
    @Column(name = "from_station")
    private String fromStation;
    @Column(name = "to_Station")
    private String toStation;
    @Column(name = "train_class_type_train_id")
    private int trainClassTypeTrainId;
    @Column(name = "train_schedule_train_id")
    private String trainScheduleTrainId;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "time_table_for_station",
            joinColumns = @JoinColumn(name = "train_id"),
            inverseJoinColumns = @JoinColumn(name = "stationId"))
    private Set<Station> stations;
}
