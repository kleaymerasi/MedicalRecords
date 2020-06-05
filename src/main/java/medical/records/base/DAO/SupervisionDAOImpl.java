package medical.records.base.DAO;

import medical.records.base.model.Supervision;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SupervisionDAOImpl implements SupervisionDAO {

        private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

        public SupervisionDAOImpl (DataSource dataSource) {
            namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        }

        @Override
        public List<Supervision> findAll() {
            String sql = "SELECT * FROM supervision";
            return namedParameterJdbcTemplate.query(sql, new SupervisionMapper());
        }

        @Override
        public void save(Supervision supervision) {
            String sql = "INSERT INTO supervision (patient_id , doctor_id , start_date , end_date, note) VALUES (:patientId , :doctorId , :startDate,:endDate,:note)";
            BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(supervision);
            namedParameterJdbcTemplate.update(sql, paramSource);
        }

        @Override
        public void update(Supervision supervision) {
                String sql = "UPDATE supervision SET patient_id = :patientId , doctor_id = :doctorId ,  start_date = :startDate , end_date= :endDate, note = :note where id = :id";
                BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(supervision);
                namedParameterJdbcTemplate.update(sql, paramSource);

        }

        @Override
        public void delete(int supervisionId) {
            String sql = "DELETE FROM supervision WHERE id = :id";
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("id", supervisionId);
            namedParameterJdbcTemplate.update(sql, paramMap);
        }

        @Override
        public Supervision get(int supervisionId) {
            String sql = "SELECT * FROM `supervision` WHERE id=" + supervisionId;
            return namedParameterJdbcTemplate.query(sql, rs -> {
                if (rs.next()) {
                    Supervision supervision = new Supervision();
                    supervision.setId(rs.getInt("id"));
                    supervision.setPatientId(rs.getInt("patient_id"));
                    supervision.setDoctorId(rs.getInt("doctor_id"));
                    supervision.setNote(rs.getString("note"));
                    supervision.setStartDate(rs.getDate("start_date"));
                    supervision.setEndDate(rs.getDate("end_date"));
                    return supervision;
                }
                return  null;
            });
        }
    }


