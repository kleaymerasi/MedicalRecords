package medical.records.base.DAO;

import medical.records.base.model.Patient;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.sql.DataSource;
import java.util.List;


public class PatientDAOImpl implements PatientDAO {
    private JdbcTemplate jdbcTemplate;
    NamedParameterJdbcTemplate template;


    public PatientDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Patient> findAll() {
        String sql = "SELECT * FROM patient";
        return  jdbcTemplate.query(sql, new PatientMapper());
    }

    @Override
    public void save(Patient patient) {
         String sql = "INSERT INTO patient (first_name, last_name, address,city) VALUES (:name, :lastname, :address,:city)";
            BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(patient);
            template.update(sql, paramSource);
        }


    @Override
    public void update(Patient patient) {
        if (patient.getId() > 0) {
            String sql = "UPDATE patient SET first_name=:first_name,last_name=:last_name , address=:address , city=:city  where id=:id";
            BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(patient);
            template.update(sql, paramSource);
        }
    }

    @Override
    public void delete(int patientId) {
        String sql = "DELETE FROM patient WHERE id =?";
        jdbcTemplate.update(sql, patientId);
    }

    @Override
    public Patient get(int patientId) {
        String sql = "SELECT * FROM patient WHERE id=" + patientId;
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
