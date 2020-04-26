package medical.records.base.DAO;


import medical.records.base.model.Patient;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;



public class PatientMapper implements RowMapper<Patient> {

    @Override
    public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
        Patient aPatient = new Patient();
        aPatient.setId(rs.getInt("id"));
        aPatient.setName(rs.getString("first_name"));
        aPatient.setLastName(rs.getString("last_name"));
        aPatient.setAddress(rs.getString("address"));
        aPatient.setCity(rs.getString("city"));
        return aPatient;
    }

}