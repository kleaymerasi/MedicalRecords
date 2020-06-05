package medical.records.base.DAO;

import medical.records.base.model.Doctor;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DoctorMapper implements RowMapper<Doctor> {
    @Override
    public Doctor mapRow(ResultSet rs, int rowNum)  throws SQLException {
        Doctor doctor = new Doctor();
        doctor.setId(rs.getInt("id"));
        doctor.setFirstName(rs.getString("first_Name"));
        doctor.setLastName(rs.getString("last_Name"));
       doctor.setAddress(rs.getString("address"));
        doctor.setCity(rs.getString("city"));
        doctor.setSpeciality(rs.getString("speciality"));
        doctor.setAge(rs.getInt("age"));
        return doctor;
    }
}
