package medical.records.base.model;
import java.util.Date;

public class Supervision {
    private int id;
    private String note;
    private Date startDate;
    private Date endDate;
    private int patientId;
    private int doctorId;


    public Supervision() {
    }

    public Supervision(int id, String note, Date startDate, Date endDate , int patientId , int doctorId ) {
        this.id = id;
        this.note = note;
        this.startDate = startDate;
        this.endDate = endDate;
        this.doctorId=doctorId;
        this.patientId=patientId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }


}
