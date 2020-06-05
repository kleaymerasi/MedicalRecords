package medical.records.base.DAO;

import medical.records.base.model.Supervision;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SupervisionMapper implements RowMapper<Supervision> {
    @Override
    public Supervision mapRow(ResultSet rs, int rowNum) throws SQLException {
        Supervision supervision = new Supervision();
        supervision.setPatientId(rs.getInt("patient_id"));
        supervision.setId(rs.getInt("id"));
        supervision.setDoctorId(rs.getInt("doctor_id"));
        supervision.setNote(rs.getString("note"));
        supervision.setStartDate(rs.getDate("start_date"));
        supervision.setEndDate(rs.getDate("end_date"));
        return supervision;
    }


}
