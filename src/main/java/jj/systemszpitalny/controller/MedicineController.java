package jj.systemszpitalny.controller;

import java.util.ArrayList;
import java.util.List;

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
import jj.systemszpitalny.model.Medicine;
import jj.systemszpitalny.resource.AppointmentResource;
import jj.systemszpitalny.resource.DoctorResource;
import jj.systemszpitalny.resource.MedicineCompanyResource;
import jj.systemszpitalny.resource.MedicineDistributorResource;
import jj.systemszpitalny.resource.MedicineResource;
import jj.systemszpitalny.resource.PatientResource;
import jj.systemszpitalny.resource.PharmacistResource;
import jj.systemszpitalny.resource.ReceptionistResource;

@Controller
public class MedicineController {

    private static Logger LOG = LogManager.getLogger(MedicineController.class);

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

    @GetMapping("/addmedicine")
    public ModelAndView goToDoctorRegisterPage() {
        LOG.info("Redirecting to Add Medicine Page.");
        return new ModelAndView("addmedicine").addObject("medicineDistributorResource", medicineDistributorResource).addObject("medicineCompanyResource", medicineCompanyResource);
    }

    @PostMapping("/addmedicine")
    public ModelAndView registerAdmin(@ModelAttribute Medicine medicine, Model model) {
        ModelAndView mv = new ModelAndView();
        if(this.medicineResource.addMedicine(medicine)==true) {
            mv.addObject("status", "Lekarstwo "+medicine.getName()+" pomyślnie dodane");
            mv.setViewName("index");
        }

        else {
            mv.addObject("status", "Nie udało się dodać Lekarstwa "+medicine.getName());
            mv.setViewName("addmedicine");
        }

        return mv;
    }

    @GetMapping("/searchmedicine")
    public String searchMedicine() {
        LOG.info("Redirecting to Search Medicine Page.");
        return "searchmedicine";
    }

    @GetMapping("/searchmedicinebyid")
    public ModelAndView searchMedicineById(@RequestParam int medicineId) {
        LOG.info("Searching medicine by id");
        Medicine medicine = medicineResource.getMedicineById(medicineId);
        List<Medicine> medicines = new ArrayList<Medicine>();
        medicines.add(medicine);
        ModelAndView mv =new ModelAndView();
        mv.setViewName("searchmedicine");
        mv.addObject("medicines", medicines);
        mv.addObject("medicineDistributorResource", medicineDistributorResource);
        mv.addObject("medicineCompanyResource", medicineCompanyResource);
        return mv;
    }

    @GetMapping("/searchmedicinebyname")
    public ModelAndView searchMedicineByName(@RequestParam String medicineName) {
        LOG.info("Searching Medicine by medicine name");
        List<Medicine> medicines = medicineResource.getMedicinesByName(medicineName);
        ModelAndView mv =new ModelAndView();
        mv.setViewName("searchmedicine");
        mv.addObject("medicines", medicines);
        mv.addObject("medicineDistributorResource", medicineDistributorResource);
        mv.addObject("medicineCompanyResource", medicineCompanyResource);
        return mv;
    }

    @GetMapping("/searchmedicinebyId")
    public ModelAndView searchMedicineByid(@RequestParam int medicineId) {
        LOG.info("Searching medicine by id");
        Medicine medicine = medicineResource.getMedicineById(medicineId);
        List<Medicine> medicines = new ArrayList<Medicine>();
        medicines.add(medicine);
        ModelAndView mv =new ModelAndView();
        mv.addObject("view", AdminView.MEDICINE.value());
        mv.setViewName("admindashboard");
        mv.addObject("medicines", medicines);
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

    @GetMapping("/searchmedicinebyName")
    public ModelAndView searchMedicineByname(@RequestParam String medicineName) {
        LOG.info("Searching Medicine by medicine name");
        List<Medicine> medicines = medicineResource.getMedicinesByName(medicineName);
        ModelAndView mv =new ModelAndView();
        mv.addObject("view", AdminView.MEDICINE.value());
        mv.setViewName("admindashboard");
        mv.addObject("medicines", medicines);
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

    @GetMapping("/updateMedicine")
    public ModelAndView updateMedicinePage(@RequestParam int medicineId) {
        LOG.info("Called to update medicine");
        Medicine medicine = medicineResource.getMedicineById(medicineId);
        ModelAndView mv =new ModelAndView();
        mv.setViewName("updatemedicine");
        mv.addObject("medicine", medicine);
        mv.addObject("medicineDistributorResource", medicineDistributorResource);
        mv.addObject("medicineCompanyResource", medicineCompanyResource);
        return mv;
    }

    @PostMapping("/updatemedicine")
    public ModelAndView updateMedicine(@ModelAttribute Medicine medicine, Model model) {
        LOG.info("Updating Medicine....");
        Medicine m = medicineResource.updateMedicine(medicine);
        List<Medicine> medicines = new ArrayList<Medicine>();
        medicines.add(medicine);
        ModelAndView mv =new ModelAndView();
        mv.setViewName("searchmedicine");
        mv.addObject("medicines", medicines);
        mv.addObject("medicineDistributorResource", medicineDistributorResource);
        mv.addObject("medicineCompanyResource", medicineCompanyResource);
        return mv;
    }

    @GetMapping("/expiredMedicines")
    public ModelAndView getExpiredMedicines() {
        LOG.info("Expired Medicine....");
        List<Medicine> medicines = medicineResource.getExpiredMedicines();
        ModelAndView mv =new ModelAndView();
        mv.setViewName("searchmedicine");
        mv.addObject("medicines", medicines);
        mv.addObject("medicineDistributorResource", medicineDistributorResource);
        mv.addObject("medicineCompanyResource", medicineCompanyResource);
        return mv;
    }

    @GetMapping("/totalMedicines")
    public ModelAndView getTotalMedicines() {
        LOG.info("get Total Medicines....");
        List<Medicine> medicines = medicineResource.getAllMedicines();
        ModelAndView mv =new ModelAndView();
        mv.setViewName("searchmedicine");
        mv.addObject("medicines", medicines);
        mv.addObject("medicineDistributorResource", medicineDistributorResource);
        mv.addObject("medicineCompanyResource", medicineCompanyResource);
        return mv;
    }

}