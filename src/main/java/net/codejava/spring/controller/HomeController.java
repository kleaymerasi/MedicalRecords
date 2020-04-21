package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.codejava.spring.DAO.PatientDAO;
import net.codejava.spring.model.Patient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * This controller routes accesses to the application to the appropriate
 * hanlder methods.
 *
 * @author www.codejava.net
 */
@Controller
public class HomeController {

    @Autowired
    private PatientDAO patientDAO;

    @RequestMapping(value = "/")
    public ModelAndView listPatient(ModelAndView model) {
        List<Patient> listPatient = patientDAO.list();
        model.addObject("listPatient", listPatient);
        model.setViewName("home");

        return model;
    }

    @RequestMapping(value = "/newPatient", method = RequestMethod.GET)
    public ModelAndView newPatient(ModelAndView model) {
        Patient newPatient = new Patient();
        model.addObject("patient", newPatient);
        model.setViewName("PatientForm");
        return model;
    }

    @RequestMapping(value = "/savePatient", method = RequestMethod.POST)
    public ModelAndView savePatient(@ModelAttribute Patient patient) {
        patientDAO.saveOrUpdate(patient);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/deletePatient", method = RequestMethod.GET)
    public ModelAndView deletePatient(HttpServletRequest request) {
        int patientId = Integer.parseInt(request.getParameter("id"));
        patientDAO.delete(patientId);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/editPatient", method = RequestMethod.GET)
    public ModelAndView editPatient(HttpServletRequest request) {
        int patientId = Integer.parseInt(request.getParameter("id"));
        Patient patient = patientDAO.get(patientId);
        ModelAndView model = new ModelAndView("PatientForm");
        model.addObject("patient", patient);

        return model;
    }
}
