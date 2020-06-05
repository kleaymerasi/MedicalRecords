package medical.records.base.DAO;

import medical.records.base.model.Doctor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DoctorDAOImpl implements DoctorDAO {
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public DoctorDAOImpl(DataSource dataSource) {
        namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public List<Doctor> findAll() {
        String sql = "SELECT * FROM doctor";
        return namedParameterJdbcTemplate.query(sql, new DoctorMapper());
    }

    @Override
    public void save(Doctor doctor) {
        String sql = "INSERT INTO doctor (first_name, last_name, address,city,speciality,age) VALUES (:firstName, :lastName, :address,:city,:speciality , :age)";
        BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(doctor);
        namedParameterJdbcTemplate.update(sql, paramSource);
    }

    @Override
    public void update(Doctor doctor) {
            String sql = "UPDATE doctor SET first_name = :firstName ,last_name = :lastName , address = :address , city = :city , speciality = :speciality , age = :age where id = :id";
            BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(doctor);
            namedParameterJdbcTemplate.update(sql, paramSource);

    }

    @Override
    public void delete(int doctorId) {
        String sql = "DELETE FROM doctor WHERE id = :id";
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("id", doctorId);
        namedParameterJdbcTemplate.update(sql, paramMap);

    }

    @Override
    public Doctor get(int doctorId) {
        String sql = "SELECT * FROM doctor WHERE id=" + doctorId;
        return namedParameterJdbcTemplate.query(sql, rs -> {
            if (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setId(rs.getInt("id"));
                doctor.setFirstName(rs.getString("first_name"));
                doctor.setCity(rs.getString("city"));
                doctor.setAddress(rs.getString("address"));
                doctor.setLastName(rs.getString("last_name"));
                doctor.setSpeciality(rs.getString("speciality"));
                doctor.setAge(rs.getInt("age"));
                return doctor;
            }
            return null;
        });
    }
}
