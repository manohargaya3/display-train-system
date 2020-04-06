package com.train.manohar.domain;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Time;


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
