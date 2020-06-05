package medical.records.base.DAO;

import medical.records.base.model.Patient;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PatientDAOImpl implements PatientDAO {
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;


    public PatientDAOImpl(DataSource dataSource) {
        namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public List<Patient> findAll() {
        String sql = "SELECT * FROM patient";
        return namedParameterJdbcTemplate.query(sql, new PatientMapper());
    }

    @Override
    public void save(Patient patient) {
            String sql = "INSERT INTO patient (first_name, last_name, address,city) VALUES (:name, :lastName, :address,:city)";
            BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(patient);
            namedParameterJdbcTemplate.update(sql, paramSource);

    }

    @Override
    public void update(Patient patient) {
            String sql = "UPDATE patient SET first_name=:first_name,last_name=:lastName , address=:address , city=:city  where id=:id";
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("id", patient.getId())
                .addValue("address", patient.getAddress())
                .addValue("city", patient.getCity())
                .addValue("last_name", patient.getLastName())
                  .addValue("first_name", patient.getName());
        namedParameterJdbcTemplate.update(sql,param, holder);
        }


    @Override
    public void delete(int patientId) {
        String sql = "DELETE FROM patient WHERE  id = :id";
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("id", patientId);
        namedParameterJdbcTemplate.update (sql, paramMap);
    }

    @Override
    public Patient get(int patientId) {
        String sql = "SELECT * FROM patient WHERE id=" + patientId;
        return namedParameterJdbcTemplate.query(sql, rs -> {
            if (rs.next()) {
                Patient patient = new Patient();
                patient.setId(rs.getInt("id"));
                patient.setName(rs.getString("first_name"));
                patient.setCity(rs.getString("city"));
                patient.setAddress(rs.getString("address"));
                patient.setLastName(rs.getString("last_name"));
                return patient;
            }
      return  null;
        });


    }


}
