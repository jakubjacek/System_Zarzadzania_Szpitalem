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
import jj.systemszpitalny.model.Pharmacist;
import jj.systemszpitalny.resource.AppointmentResource;
import jj.systemszpitalny.resource.DoctorResource;
import jj.systemszpitalny.resource.MedicineCompanyResource;
import jj.systemszpitalny.resource.MedicineDistributorResource;
import jj.systemszpitalny.resource.MedicineResource;
import jj.systemszpitalny.resource.PatientResource;
import jj.systemszpitalny.resource.PharmacistResource;
import jj.systemszpitalny.resource.ReceptionistResource;

@Controller
public class PharmacistController {

    private static Logger LOG = LogManager.getLogger(PharmacistController.class);

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

    @GetMapping("/pharmacistlogin")
    public String goToPharmacistLoginPage() {
        LOG.info("Redirecting to Pharmacist Login Page.");
        return "pharmacistlogin";
    }

    @GetMapping("/pharmacistregister")
    public String goToPharmacistRegisterPage() {
        LOG.info("Redirecting to Pharmacist Register Page.");
        return "pharmacistregister";
    }

    @PostMapping("/pharmacistregister")
    public ModelAndView registerPharmacist(@ModelAttribute Pharmacist pharmacist, Model model) {
        ModelAndView mv = new ModelAndView();
        if(this.pharmacistResource.addPharmacist(pharmacist)==true) {
            mv.addObject("status", pharmacist.getFirstname()+" został pomyślnie zarejestrowany jako FARMACEUTA");
            mv.setViewName("pharmacistlogin");
        }

        else {
            mv.addObject("status", pharmacist.getFirstname()+" Nie udało się zarejestrować jako FARMACEUTA");
            mv.setViewName("pharmacistregister");
        }

        return mv;
    }

    @PostMapping("/pharmacistlogin")
    public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
        ModelAndView mv = new ModelAndView();
        Pharmacist pharmacist = this.pharmacistResource.loginPharmacist(username, password);
        if(pharmacist!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("active-user", pharmacist);
            session.setAttribute("user-login","pharmacist");
            mv.addObject("status", username+" został pomyślnie zalogowany jako FARMACEUTA");
            mv.setViewName("index");
        }

        else {
            mv.addObject("status"," Nie udało się zalogować jako FARMACEUTA");
            mv.setViewName("pharmacistlogin");
        }

        return mv;
    }

    @GetMapping("/searchpharmacistbyId")
    public ModelAndView searchPharmacistByid(@RequestParam int pharmacistId) {
        LOG.info("Searching pharmacist by id");
        Pharmacist pharmacist = pharmacistResource.getPharmacistById(pharmacistId);
        List<Pharmacist> pharmacists = new ArrayList<Pharmacist>();
        pharmacists.add(pharmacist);
        ModelAndView mv =new ModelAndView();
        mv.addObject("view", AdminView.PHARMACIST.value());
        mv.setViewName("admindashboard");
        mv.addObject("pharmacists", pharmacists);
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

    @GetMapping("/searchpharmacistbyName")
    public ModelAndView searchpharmacistByname(@RequestParam String pharmacistName) {
        LOG.info("Searching pharmacist by name");
        List<Pharmacist> pharmacists = pharmacistResource.getPharmacistsByName(pharmacistName);
        ModelAndView mv =new ModelAndView();
        mv.addObject("view", AdminView.PHARMACIST.value());
        mv.setViewName("admindashboard");
        mv.addObject("pharmacists", pharmacists);
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
