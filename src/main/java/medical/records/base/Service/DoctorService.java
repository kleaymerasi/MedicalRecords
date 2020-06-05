package medical.records.base.Service;

import medical.records.base.model.Doctor;

import java.util.List;

public interface DoctorService {
    List<Doctor> findAll() ;
    void save(Doctor doctor);
    void update (Doctor doctor);
    void delete(int doctorId);
    Doctor get(int doctorId);
}
