package jj.systemszpitalny.controller;

import jj.systemszpitalny.model.Admin;
import jj.systemszpitalny.resource.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    private static Logger LOG = LogManager.getLogger(AdminController.class);

    @Autowired
    private AdminResource adminResource;

    @Autowired
    private AppointmentResource appointmentResource;

    @Autowired
    private MedicineResource medicineResource;

    @Autowired
    private MedicineCompanyResource companyResource;

    @Autowired
    private MedicineDistributorResource distributorResource;

    @Autowired
    private DoctorResource doctorResource;

    @Autowired
    private PatientResource patientResource;

    @Autowired
    private ReceptionistResource receptionistResource;

    @Autowired
    private PharmacistResource pharmacistResource;

    @GetMapping("/")
    public String goToHomeDuringStart() {
        LOG.info("In Home Page index.jsp");
        return "index";
    }

    @GetMapping("/adminlogin")
    public String goToAdminLoginPage() {
        LOG.info("Redirecting to Admin Login Page.");
        return "adminlogin";
    }

    @GetMapping("/adminregister")
    public String goToAdminRegisterPage() {
        LOG.info("Redirecting to Admin Register Page.");
        return "adminregister";
    }

    @PostMapping("/adminregister")
    public ModelAndView registerAdmin(@ModelAttribute Admin admin, Model model) {
        ModelAndView mv = new ModelAndView();
        if(this.adminResource.addAdmin(admin)==true) {
            mv.addObject("status", admin.getFirstname()+" został pomyślnie zarejestrowany jako ADMINISTRATOR");
            mv.setViewName("adminlogin");
        }

        else {
            mv.addObject("status", admin.getFirstname()+" Nie udało się zarejestrować jako ADMINISTRATOR");
            mv.setViewName("adminregister");
        }

        return mv;
    }

    @PostMapping("/adminlogin")
    public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
        ModelAndView mv = new ModelAndView();
        Admin admin=this.adminResource.loginAdmin(username, password);
        if(admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("active-user", admin);
            session.setAttribute("user-login","admin");
            mv.addObject("status", username+" został zalogowany jako ADMINISTRATOR");
            mv.setViewName("index");
        }

        else {
            mv.addObject("status"," Nie udało się zalogować jako ADMINISTRATOR");
            mv.setViewName("adminlogin");
        }

        return mv;
    }

    @GetMapping("/admindashboard")
    public ModelAndView adminDashboard(@RequestParam String view) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("view", view);

        mv.addObject("appointmentResource", appointmentResource);
        mv.addObject("medicineResource", medicineResource);
        mv.addObject("companyResource", companyResource);
        mv.addObject("distributorResource", distributorResource);
        mv.addObject("patientResource",patientResource );
        mv.addObject("doctorResource", doctorResource);
        mv.addObject("distributorResource",distributorResource );
        mv.addObject("companyResource", companyResource);
        mv.addObject("receptionistResource",receptionistResource);
        mv.addObject("pharmacistResource",pharmacistResource);

        mv.setViewName("admindashboard");
        return mv;
    }

}
