package org.neerogi.web;
import org.neerogi.domain.Allergy;
import org.neerogi.domain.AllergyType;
import org.neerogi.domain.Patient;
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

@RequestMapping("/allergys")
@Controller
@RooWebScaffold(path = "allergys", formBackingObject = Allergy.class)
public class AllergyController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new Allergy(), request.getParameter("parent_id"));
        return "allergys/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Allergy allergy, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, allergy, request.getParameter("parent_id"));
            return "allergys/create";
        }
        uiModel.asMap().clear();
        allergy.persist();
        return "redirect:/allergys/" + encodeUrlPathSegment(allergy.getId().toString(), request);
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Allergy allergy, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, allergy, request.getParameter("parent_id"));
            return "allergys/update";
        }
        uiModel.asMap().clear();
        allergy.merge();
        return "redirect:/allergys/" + encodeUrlPathSegment(allergy.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, Allergy.findAllergy(id), request.getParameter("parent_id"));
        return "allergys/update";
    }

    void populateEditForm(Model uiModel, Allergy allergy, String patientId) {
        uiModel.addAttribute("allergy", allergy);
        uiModel.addAttribute("allergytypes", AllergyType.findAllAllergyTypes());
        uiModel.addAttribute("patients", preparePatientList(patientId));
    }

    private List<Patient> preparePatientList(String patientId) {
        List<Patient> list = new ArrayList<Patient>();
        if(patientId != null) {
            Patient patient = Patient.findPatient(Integer.parseInt(patientId));
            if(patient != null)
                list.add(patient);
        }
        return list;
    }
}
