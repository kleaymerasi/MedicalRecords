package medical.records.base.model;

    public class Doctor {
    private String firstName;
    private String lastName;
    private String address;
    private int id;
    private String city;
    private String speciality;
    private int age;

    public Doctor() {}

    public Doctor(String firstName, String lastname, String address, int id, String city, String speciality, int age) {
        this.firstName = firstName;
        this.lastName = lastname;
        this.address = address;
        this.id = id;
        this.city = city;
        this.speciality = speciality;
        this.age =age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
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

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

        public int getAge() {
            return age;
        }

        public void setAge(int Age) {
            this.age = Age;
        }

    }


