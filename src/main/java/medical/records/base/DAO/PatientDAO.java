package medical.records.base.DAO;

import medical.records.base.model.Patient;

import java.util.List;

public interface PatientDAO {

    List <Patient> findAll() ;
    void save(Patient patient);
    void update (Patient patient);
    void delete(int patientId);
    Patient get(int patientId);
}
