package jj.systemszpitalny.service;

import java.util.List;

import jj.systemszpitalny.model.Pharmacist;

public interface PharmacistService {
    Pharmacist addPharmacist(Pharmacist Pharmacist);
    void deletePharmacistById(Integer id);
    Pharmacist getPharmacistById(Integer id);
    Pharmacist updatePharmacist(Pharmacist Pharmacist);
    Pharmacist loginPharmacist(String username, String password);
    Long getPharmacistsTotalCount();
    List<Pharmacist> getPharmacistsByFirstName(String firstName);
    Long getPharmacistCountByDate(String date);
}
