package medical.records.base.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import medical.records.base.DAO.DoctorDAO;
import medical.records.base.DAO.PatientDAO;
import medical.records.base.DAO.SupervisionDAO;
import medical.records.base.model.Doctor;
import medical.records.base.model.Patient;
import medical.records.base.model.Supervision;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PatientController {

    @Autowired
    private PatientDAO patientDAO;

  @Autowired
  private  SupervisionDAO supervisionDAO;
  @Autowired
  private DoctorDAO doctorDAO;

    @RequestMapping("/Patient")
    public ModelAndView listPatient(ModelAndView model) {
        List<Patient> listPatient = patientDAO.findAll();
        model.addObject("listPatient", listPatient);
        model.setViewName("PatientHome");

        return model;
    }

    @RequestMapping(value = "/newPatient", method = RequestMethod.GET)
    public ModelAndView newPatient(ModelAndView model) {
        Patient newPatient = new Patient();
        model.addObject("patient", newPatient);
        model.setViewName("EditPatient");
        return model;
    }

    @RequestMapping(value = "/savePatient", method = RequestMethod.POST)
    public ModelAndView savePatient(@ModelAttribute Patient patient) {
        patientDAO.save(patient);
        return new ModelAndView("redirect:/Patient");
    }


    @RequestMapping(value = "/updatePatient", method = RequestMethod.POST)
    public ModelAndView updatePatient(@ModelAttribute Patient patient) {
        patientDAO.update(patient);
        return new ModelAndView("redirect:/PatientHome");
    }



    @RequestMapping(value = "/deletePatient", method = RequestMethod.GET)
    public ModelAndView deletePatient(HttpServletRequest request) {
        int patientId = Integer.parseInt(request.getParameter("id"));
        patientDAO.delete(patientId);
        return new ModelAndView("redirect:/Patient");
    }

    @RequestMapping(value = "/editPatient", method = RequestMethod.GET)
    public ModelAndView editPatient(HttpServletRequest request) {
        int patientId = Integer.parseInt(request.getParameter("id"));
        Patient patient = patientDAO.get(patientId);
        ModelAndView model = new ModelAndView("EditPatient");
        model.addObject("patient", patient);
        return model;
    }

    @RequestMapping(value="/assignDoctor", method = RequestMethod.GET)
    public ModelAndView assignDoctor(HttpServletRequest request) {
        Supervision supervision = new Supervision();
        supervision.setPatientId(Integer.parseInt(request.getParameter("id")));
        List<Doctor> listDoctor = doctorDAO.findAll();
        ModelAndView model = new ModelAndView("EditSupervision");
        model.addObject("supervision" , supervision);
        model.addObject("listDoctor", listDoctor);
        return model;
    }

    @RequestMapping(value = "/saveSupervision", method = RequestMethod.POST)
    public ModelAndView saveSupervision(@ModelAttribute Supervision supervision) {
        supervisionDAO.save(supervision);
        return new ModelAndView("redirect:/Patient");
    }



}
