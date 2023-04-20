package jj.systemszpitalny.service;

import java.util.List;

import jj.systemszpitalny.model.Admin;

public interface AdminService {
    Admin addAdmin(Admin admin);
    Admin loginAdmin(String username, String password);
    void deleteAdminById(Integer id);
    Admin getAdminById(Integer id);
    List<Admin> getAllAdmin();
    Admin updateAdmin(Admin admin);
}
