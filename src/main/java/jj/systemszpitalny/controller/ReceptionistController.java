package jj.systemszpitalny.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import jj.systemszpitalny.constants.DatabaseConstants.AdminView;
import jj.systemszpitalny.model.Receptionist;
import jj.systemszpitalny.resource.AppointmentResource;
import jj.systemszpitalny.resource.DoctorResource;
import jj.systemszpitalny.resource.MedicineCompanyResource;
import jj.systemszpitalny.resource.MedicineDistributorResource;
import jj.systemszpitalny.resource.MedicineResource;
import jj.systemszpitalny.resource.PatientResource;
import jj.systemszpitalny.resource.PharmacistResource;
import jj.systemszpitalny.resource.ReceptionistResource;

@Controller
public class ReceptionistController {

    private static Logger LOG = LogManager.getLogger(ReceptionistController.class);

    @Autowired
    private MedicineResource medicineResource;

    @Autowired
    private MedicineDistributorResource medicineDistributorResource;

    @Autowired
    private MedicineCompanyResource medicineCompanyResource;

    @Autowired
    private AppointmentResource appointmentResource;

    @Autowired
    private DoctorResource doctorResource;

    @Autowired
    private PatientResource patientResource;

    @Autowired
    private ReceptionistResource receptionistResource;

    @Autowired
    private PharmacistResource pharmacistResource;

    @GetMapping("/receptionistlogin")
    public String goToReceptionistLoginPage() {
        LOG.info("Redirecting to Receptionist Login Page.");
        return "receptionistlogin";
    }

    @GetMapping("/receptionistregister")
    public String goToReceptionistRegisterPage() {
        LOG.info("Redirecting to Receptionist Register Page.");
        return "receptionistregister";
    }

    @PostMapping("/receptionistregister")
    public ModelAndView registerReceptionist(@ModelAttribute Receptionist receptionist, Model model) {
        ModelAndView mv = new ModelAndView();
        if(this.receptionistResource.addReceptionist(receptionist)==true) {
            mv.addObject("status", receptionist.getFirstname()+" został pomyślnie zarejestrowany jako RECEPCJONISTA");
            mv.setViewName("index");
        }

        else {
            mv.addObject("status", receptionist.getFirstname()+" Nie udało się zarejestrować jako RECEPCJONISTA");
            mv.setViewName("receptionistlogin");
        }

        return mv;
    }

    @PostMapping("/receptionistlogin")
    public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
        ModelAndView mv = new ModelAndView();
        Receptionist receptionist = this.receptionistResource.loginReceptionist(username, password);
        if(receptionist!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("active-user", receptionist);
            session.setAttribute("user-login","receptionist");
            mv.addObject("status", username+" został pomyślnie zalogowany jako RECEPCJONISTA");
            mv.setViewName("index");
        }

        else {
            mv.addObject("status"," Nie udało się zalogować jako RECEPCJONISTA");
            mv.setViewName("receptionistlogin");
        }

        return mv;
    }

    @GetMapping("/searchreceptionistbyId")
    public ModelAndView searchReceptionistByid(@RequestParam int receptionistId) {
        LOG.info("Searching receptionist by id");
        Receptionist receptionist = receptionistResource.getReceptionistById(receptionistId);
        List<Receptionist> receptionists = new ArrayList<Receptionist>();
        receptionists.add(receptionist);
        ModelAndView mv =new ModelAndView();
        mv.addObject("view", AdminView.RECEPTIONIST.value());
        mv.setViewName("admindashboard");
        mv.addObject("receptionists", receptionists);
        mv.addObject("appointmentResource", appointmentResource);
        mv.addObject("medicineResource", medicineResource);
        mv.addObject("companyResource", medicineCompanyResource);
        mv.addObject("distributorResource", medicineDistributorResource);
        mv.addObject("patientResource",patientResource );
        mv.addObject("doctorResource", doctorResource);
        mv.addObject("receptionistResource",receptionistResource);
        mv.addObject("pharmacistResource",pharmacistResource);
        return mv;
    }

    @GetMapping("/searchreceptionistbyName")
    public ModelAndView searchdoctorByname(@RequestParam String receptionistName) {
        LOG.info("Searching receptionist by name");
        List<Receptionist> receptionists = receptionistResource.getReceptionistsByFirstname(receptionistName);
        ModelAndView mv =new ModelAndView();
        mv.addObject("view", AdminView.RECEPTIONIST.value());
        mv.setViewName("admindashboard");
        mv.addObject("receptionists", receptionists);
        mv.addObject("appointmentResource", appointmentResource);
        mv.addObject("medicineResource", medicineResource);
        mv.addObject("companyResource", medicineCompanyResource);
        mv.addObject("distributorResource", medicineDistributorResource);
        mv.addObject("patientResource",patientResource );
        mv.addObject("doctorResource", doctorResource);
        mv.addObject("receptionistResource",receptionistResource);
        mv.addObject("pharmacistResource",pharmacistResource);
        return mv;
    }

}

