package medical.records.base.Service;

import medical.records.base.DAO.DoctorDAO;
import medical.records.base.model.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorDAO doctorDao;

    @Override
    public List<Doctor> findAll() {
        return doctorDao.findAll();
    }

    @Override
    public void save(Doctor doctor) {
        doctorDao.save(doctor);
    }

    @Override
    public void update(Doctor doctor) {
        doctorDao.update(doctor);
    }

    @Override
    public void delete(int doctorId) {
        doctorDao.delete(doctorId);

    }

    @Override
    public Doctor get(int doctorId) {
        return doctorDao.get(doctorId);
    }
}
