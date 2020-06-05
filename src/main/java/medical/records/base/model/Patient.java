package medical.records.base.model;

    public class Patient {
    private int id;
    private String name;
    private String lastName;
    private String address;
    private String city;

    public Patient() {}

    public Patient(String name, String lastName, String address, int id, String city) {
        this.name = name;
        this.lastName = lastName;
        this.address = address;
        this.id = id;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
