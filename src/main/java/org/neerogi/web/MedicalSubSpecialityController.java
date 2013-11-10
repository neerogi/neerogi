package org.neerogi.web;

import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.MedicalSpeciality;
import org.neerogi.domain.MedicalSubSpeciality;
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

@RequestMapping("/medicalsubspecialitys")
@Controller
@RooWebScaffold(path = "medicalsubspecialitys", formBackingObject = MedicalSubSpeciality.class)
public class MedicalSubSpecialityController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new MedicalSubSpeciality(), request.getParameter("parent_id"));
        return "medicalsubspecialitys/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid MedicalSubSpeciality medicalSubSpeciality, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, medicalSubSpeciality, request.getParameter("parent_id"));
            return "medicalsubspecialitys/create";
        }
        uiModel.asMap().clear();
        medicalSubSpeciality.persist();
        return "redirect:/medicalsubspecialitys/" + encodeUrlPathSegment(medicalSubSpeciality.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, MedicalSubSpeciality.findMedicalSubSpeciality(id), request.getParameter("parent_id"));
        return "medicalsubspecialitys/update";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid MedicalSubSpeciality medicalSubSpeciality, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, medicalSubSpeciality, request.getParameter("parent_id"));
            return "medicalsubspecialitys/update";
        }
        uiModel.asMap().clear();
        medicalSubSpeciality.merge();
        return "redirect:/medicalsubspecialitys/" + encodeUrlPathSegment(medicalSubSpeciality.getId().toString(), request);
    }

    void populateEditForm(Model uiModel, MedicalSubSpeciality medicalSubSpeciality, String specialityId) {
        uiModel.addAttribute("medicalSubSpeciality", medicalSubSpeciality);
        uiModel.addAttribute("medicalconditions", MedicalCondition.findAllMedicalConditions());
        uiModel.addAttribute("medicalspecialitys", prepareMedicalSpecialityList(specialityId));
    }

    protected List<MedicalSpeciality> prepareMedicalSpecialityList(String specialityId) {
        List<MedicalSpeciality> list = new ArrayList<MedicalSpeciality>();
        if (specialityId != null) {
            MedicalSpeciality speciality = MedicalSpeciality.findMedicalSpeciality(Integer.parseInt(specialityId));
            if (speciality != null)
                list.add(speciality);
        } else {
            list.addAll(MedicalSpeciality.findAllMedicalSpecialitys());
        }
        return list;
    }
}
