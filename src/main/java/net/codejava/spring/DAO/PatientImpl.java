package net.codejava.spring.DAO;

import net.codejava.spring.model.Patient;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;


import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PatientImpl implements PatientDAO {
    private JdbcTemplate jdbcTemplate;

    public PatientImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Patient> list() {
        String sql = "SELECT * FROM patient";
        List<Patient> listPatient = jdbcTemplate.query(sql, new RowMapper<Patient>() {

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

        });

        return listPatient;
    }

    @Override
    public void saveOrUpdate(Patient patient) {
        if (patient.getId() > 0) {
            // update
            String sql = "UPDATE patient SET first_name=?, last_name=?, address=?, "
                    + "city=? WHERE id=?";
            jdbcTemplate.update(sql, patient.getName(), patient.getCity(),
                    patient.getAddress(), patient.getLastName(), patient.getId());
        } else {
            // insert
            String sql = "INSERT INTO patient (first_name, last_name, address, city)"
                    + " VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, patient.getName(), patient.getLastName(),
                    patient.getAddress(), patient.getCity());
        }
    }

    @Override
    public void delete(int patientId) {
        String sql = "DELETE FROM patient WHERE id =?";
        jdbcTemplate.update(sql, patientId);
    }

    @Override
    public Patient get(int patientId) {
        String sql = "SELECT * FROM patient WHERE Id=" + patientId;
        return jdbcTemplate.query(sql, rs -> {
            if (rs.next()) {
                Patient patient = new Patient();
                patient.setId(rs.getInt("Id"));
                patient.setName(rs.getString("first_name"));
                patient.setCity(rs.getString("city"));
                patient.setAddress(rs.getString("address"));
                patient.setLastName(rs.getString("last_name"));
                return patient;
            }

            return null;
        });
    }


}
