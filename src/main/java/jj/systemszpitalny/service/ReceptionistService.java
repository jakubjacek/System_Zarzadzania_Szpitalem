package jj.systemszpitalny.service;

import java.util.List;

import jj.systemszpitalny.model.Receptionist;

public interface ReceptionistService {
    Receptionist addReceptionist(Receptionist receptionist);
    void deleteReceptionistById(Integer id);
    Receptionist getReceptionistById(Integer id);
    Receptionist updateReceptionist(Receptionist receptionist);
    Receptionist loginReceptionist(String username, String password);
    Long getReceptionistTotalCount();
    List<Receptionist> getReceptionistsByFirstName(String firstName);
    Long getReceptionistCountByRegisteredDate(String registerDate);
}
