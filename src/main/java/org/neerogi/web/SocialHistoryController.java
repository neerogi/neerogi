package org.neerogi.web;
import org.neerogi.domain.Patient;
import org.neerogi.domain.SocialHistory;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/socialhistorys")
@Controller
@RooWebScaffold(path = "socialhistorys", formBackingObject = SocialHistory.class)
public class SocialHistoryController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new SocialHistory(), request.getParameter("parent_id"));
        return "socialhistorys/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid SocialHistory socialHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, socialHistory, request.getParameter("parent_id"));
            return "socialhistorys/create";
        }
        uiModel.asMap().clear();
        socialHistory.persist();
        return "redirect:/socialhistorys/" + encodeUrlPathSegment(socialHistory.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, SocialHistory.findSocialHistory(id), request.getParameter("parent_id"));
        return "socialhistorys/update";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid SocialHistory socialHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, socialHistory, request.getParameter("parent_id"));
            return "socialhistorys/update";
        }
        uiModel.asMap().clear();
        socialHistory.merge();
        return "redirect:/socialhistorys/" + encodeUrlPathSegment(socialHistory.getId().toString(), request);
    }

    void populateEditForm(Model uiModel, SocialHistory socialHistory, String patientId) {
        uiModel.addAttribute("socialHistory", socialHistory);
        uiModel.addAttribute("patients", preparePatientList(patientId));
    }

    private List<Patient> preparePatientList(String patientId) {
        List<Patient> list = new ArrayList<Patient>();
        if(patientId != null) {
            Patient patient = Patient.findPatient(Integer.parseInt(patientId));
            if(patient != null)
                list.add(patient);
        }
        else {
            list.addAll(Patient.findAllPatients());
        }
        return list;
    }
}
