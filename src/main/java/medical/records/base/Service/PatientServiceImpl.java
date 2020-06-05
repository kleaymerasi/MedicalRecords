package medical.records.base.Service;

import medical.records.base.DAO.PatientDAO;
import medical.records.base.model.Patient;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientDAO patientDAO;

    @Override
    public List<Patient> findAll() {
        return patientDAO.findAll();
    }

    @Override
    public void save(Patient patient) {
        patientDAO.save(patient);
    }

    @Override
    public void update(Patient patient) {
        patientDAO.update(patient);
    }

    @Override
    public void delete(int patientId) {
        patientDAO.delete(patientId);
    }

    @Override
    public Patient get(int patientId) {
        return patientDAO.get(patientId);
    }
}
