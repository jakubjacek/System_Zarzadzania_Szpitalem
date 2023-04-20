package jj.systemszpitalny.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MedicineDistributor {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id")
    private int id;
    @Column(name="Name")
    private String name;
    @Column(name="EmailId")
    private String emailid;
    @Column(name="MobileNo")
    private String mobileno;
    @Column(name="Street")
    private String street;
    @Column(name="City")
    private String city;
    @Column(name="Pincode")
    private String pincode;
    @Column(name="RegisterDate")
    private String registerdate;

}
