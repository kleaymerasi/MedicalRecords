package medical.records.base.controller;

import medical.records.base.DAO.DoctorDAO;
import medical.records.base.model.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DoctorController {
    @Autowired
    private DoctorDAO doctorDAO;


  @RequestMapping("/Doctor")
    public ModelAndView listDoctor(ModelAndView model) {
        List<Doctor> listDoctor = doctorDAO.findAll();
        model.addObject("listDoctor", listDoctor);
        model.setViewName("DoctorHome");
        return model;
    }

    @RequestMapping(value = "/newDoctor", method = RequestMethod.GET)
    public ModelAndView newDoctor(ModelAndView model) {
        Doctor newDoctor = new Doctor();
        model.addObject("doctor", newDoctor);
        model.setViewName("EditDoctor");
        return model;
    }

    @RequestMapping(value = "/saveDoctor", method = RequestMethod.POST)
    public ModelAndView saveDoctor(@ModelAttribute Doctor doctor) {
        doctorDAO.save(doctor);
        return new ModelAndView("redirect:/Doctor");
    }

    @RequestMapping(value = "/updateDoctor", method = RequestMethod.POST)
    public ModelAndView updateDoctor(@ModelAttribute Doctor doctor) {
        doctorDAO.update(doctor);
        return new ModelAndView("redirect:/DoctorHome");
    }

    @RequestMapping(value = "/deleteDoctor", method = RequestMethod.GET)
    public ModelAndView deleteDoctor (HttpServletRequest request) {
        int doctorId = Integer.parseInt(request.getParameter("id"));
        doctorDAO.delete(doctorId);
        return new ModelAndView("redirect:/Doctor");
    }

    @RequestMapping(value = "/editDoctor", method = RequestMethod.GET)
    public ModelAndView editDoctor(HttpServletRequest request) {
        int doctorId = Integer.parseInt(request.getParameter("id"));
        Doctor doctor = doctorDAO.get(doctorId);
        ModelAndView model = new ModelAndView("EditDoctor");
        model.addObject("doctor", doctor);
        return model;
    }
}
