package net.codejava.spring.DAO;

import net.codejava.spring.model.Patient;

import java.util.List;

public interface PatientDAO {
    public List<Patient> list();

    public void saveOrUpdate(Patient patient);

    public void delete(int patientId);

    public Patient get(int patientId);
}
