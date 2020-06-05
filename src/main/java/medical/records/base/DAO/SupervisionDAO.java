package medical.records.base.DAO;

import medical.records.base.model.Supervision;
import java.util.List;

public interface SupervisionDAO {
    List<Supervision> findAll();
    void update(Supervision supervision);
    void save (Supervision supervision);
    void delete(int supervisionId);
    Supervision get(int supervisionId);
}
