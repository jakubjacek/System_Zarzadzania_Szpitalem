package jj.systemszpitalny.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import jj.systemszpitalny.model.Admin;

@Repository("adminDao")
public interface AdminDao extends JpaRepository<Admin, Integer>  {

    Admin findByUsernameAndPassword(String username , String password);

}