package jj.systemszpitalny.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Appointment {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id")
    private int id;
    @Column(name="PatientId")
    private int patientid;
    @Column(name="DoctorId")
    private int doctorid;
    @Column(name="AppointmentTakenDate")
    private String appointmenttakendate;
    @Column(name="AppointmentTakenTime")
    private String appointmenttakentime;
    @Column(name="AppointmentDate")
    private String appointmentdate;
    @Column(name="AppointmentTime")
    private String appointmenttime;
    @Column(name="ProblemDescription")
    private String problemdescription;
    @Column(name="TreatmentStatus")
    private String treatmentstatus;
    @ManyToMany
    @Column(name="MedicineAssigned")
    private List<Medicine> medicines;
    @Column(name="TreatmentPrice")
    private double treatmentprice;
    @Column(name="BillMade")
    private String billMade;
    @Column(name="BillingDate")
    private String billingDate;
    @Column(name="WantMedicine")
    private String wantMedicine;


}

