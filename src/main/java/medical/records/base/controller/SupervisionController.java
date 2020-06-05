package medical.records.base.controller;
import medical.records.base.DAO.SupervisionDAO;
import medical.records.base.model.Supervision;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SupervisionController {

    @Autowired
    private SupervisionDAO supervisionDAO;

    @RequestMapping("/Supervision")
    public ModelAndView listSupervision (ModelAndView model) {
        List<Supervision> listSupervision = supervisionDAO.findAll();
        model.addObject("listSupervision", listSupervision);
        model.setViewName("SupervisionHome");
        return model;
    }

    @RequestMapping(value = "/newSupervision", method = RequestMethod.GET)
    public ModelAndView newSupervision(ModelAndView model) {
        Supervision newSupervision = new Supervision();
        model.addObject("supervision", newSupervision);
        model.setViewName("EditSupervision");
        return model;
    }


    @RequestMapping(value = "/updateSupervision", method = RequestMethod.POST)
    public ModelAndView updateSupervision (@ModelAttribute Supervision supervision) {
        supervisionDAO.update(supervision);
        return new ModelAndView("redirect:/SupervisionHome");
    }

    @RequestMapping(value = "/deleteSupervision", method = RequestMethod.GET)
    public ModelAndView deleteSupervision (HttpServletRequest request) {
        int supervisionId = Integer.parseInt(request.getParameter("id"));
        supervisionDAO.delete(supervisionId);
        return new ModelAndView("redirect:/Supervision");
    }

    @RequestMapping(value = "/editSupervision", method = RequestMethod.GET)
    public ModelAndView editSupervision (HttpServletRequest request) {
        int supervisionId = Integer.parseInt(request.getParameter("id"));
        Supervision supervision = supervisionDAO.get(supervisionId);
        ModelAndView model = new ModelAndView("EditSupervision");
        model.addObject("supervision",supervision);
        return model;
    }
}

