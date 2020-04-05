package com.train.manohar.domain;


import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "station")
@Data
public class Station {

    @Id
    @Column(name = "station_id")
    private int stationId;

    @Column(name = "station_name")
    private String stationName;

    @ManyToMany(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
    @JoinTable(
            name = "time_table_for_station",
            joinColumns = @JoinColumn(name = "stationId"),
            inverseJoinColumns = @JoinColumn(name = "train_id"))
    Set<Train> trains;
}
