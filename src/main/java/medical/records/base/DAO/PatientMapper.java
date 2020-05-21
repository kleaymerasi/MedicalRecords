package medical.records.base.DAO;


import  medical.records.base.model.Patient;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;



public class PatientMapper implements RowMapper<Patient> {

    @Override
    public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
        Patient patient = new Patient();
        patient.setId(rs.getInt("id"));
        patient.setName(rs.getString("first_name"));
        patient.setLastName(rs.getString("last_name"));
        patient.setAddress(rs.getString("address"));
        patient.setCity(rs.getString("city"));
        return patient;
    }
}