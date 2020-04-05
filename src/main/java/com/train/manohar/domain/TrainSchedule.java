package com.train.manohar.domain;


import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.sql.Time;
import java.util.Set;


@Entity
@Table(name = "train_schedule")
@Data
public class TrainSchedule {

    @Id
    @Column(name = "train_id")
    private int trainId;
    @Column(name = "train_name")
    private String trainName;
    @Column(name = "train_type")
    private String dasRunningOn;
    @Column(name = "days_running_on")
    private Time startTime;
    @Column(name = "start_time")
    private String trainScheduleTrainId;
}
