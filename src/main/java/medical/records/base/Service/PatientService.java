package medical.records.base.Service;

import medical.records.base.model.Doctor;
import medical.records.base.model.Patient;
import java.util.List;

public interface PatientService {
    List<Patient> findAll() ;
    void save(Patient patient);
    void update (Patient patient);
    void delete(int patientId);
    Patient get(int patientId);
}
