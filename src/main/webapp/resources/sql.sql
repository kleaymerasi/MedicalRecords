use mr;
create table doctor
(
    id         INT(5) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(233),
    last_name  VARCHAR(200),
    age        INT(5),
    city       VARCHAR(200),
    speciality VARCHAR(200),
    address    VARCHAR(200),
    primary key (id)
);

create table supervision
(
    id         INT(5) NOT NULL AUTO_INCREMENT,
    patient_id INT(5) NOT NULL ,
    doctor_id  INT(5) NOT NULL,
    start_date TIMESTAMP,
    end_date   TIMESTAMP,
    note       VARCHAR(300),
    primary key (id),
    foreign key (doctor_id) REFERENCES doctor (id) ON DELETE CASCADE,
    foreign key (patient_id) REFERENCES patient (ID)ON DELETE CASCADE
);

/**
  ========================================================
           INITIAL DATA
  ========================================================

 */

insert into supervision (patient_id, doctor_id, start_date, end_date, note)
values (6 , 1 ,'2016-01-01 00:00:01','2016-02-01 00:00:01','ok');


insert into doctor (first_name, last_name, age, city, speciality, address)
values ('klea', 'ymerasi', 22, 'tirana ', 'surgeon', 'ali visha'),
       ('asim', 'berklli', 23, 'elbasan ', 'surgeon ', 'ali demi'),
       ('sara', 'hasimi', 24, 'tirana', 'infectionist', 'siri kodra'),
       ('tara ', 'molla ', 34, 'vlora', 'pediatric', 'selmi mami');

