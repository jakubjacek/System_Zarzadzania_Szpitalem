package jj.systemszpitalny.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Medicine {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id")
    private int id;
    @Column(name="Name")
    private String name;
    @Column(name="Type")
    private String type;
    @Column(name="Quantity")
    private int quantity;
    @Column(name="Price")
    private Double price;
    @Column(name="ManufactureDate")
    private String manufacturedate;
    @Column(name="ExpiryDate")
    private String expirydate;
    @Column(name="DateAdded")
    private String dateAdded;
    @Column(name="DistributorId")
    private int distributorid;
    @Column(name="CompanyId")
    private int companyid;
    @ManyToMany
    @JoinColumn
    private List<Appointment> appointments;
}

