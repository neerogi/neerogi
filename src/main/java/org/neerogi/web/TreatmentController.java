package org.neerogi.web;

import org.neerogi.domain.DrugTreatment;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.OtherTreatment;
import org.neerogi.domain.Treatment;
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

@RequestMapping("/treatments")
@Controller
@RooWebScaffold(path = "treatments", formBackingObject = Treatment.class)
public class TreatmentController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new Treatment(), request.getParameter("parent_id"));
        return "treatments/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Treatment treatment, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, treatment, request.getParameter("parent_id"));
            return "treatments/create";
        }
        uiModel.asMap().clear();
        treatment.persist();
        return "redirect:/treatments/" + encodeUrlPathSegment(treatment.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, Treatment.findTreatment(id), request.getParameter("parent_id"));
        return "treatments/update";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Treatment treatment, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, treatment, request.getParameter("parent_id"));
            return "treatments/update";
        }
        uiModel.asMap().clear();
        treatment.merge();
        return "redirect:/treatments/" + encodeUrlPathSegment(treatment.getId().toString(), request);
    }

    void populateEditForm(Model uiModel, Treatment treatment, String medicalConditionId) {
        uiModel.addAttribute("treatment", treatment);
        uiModel.addAttribute("drugtreatments", DrugTreatment.findAllDrugTreatments());
        uiModel.addAttribute("medicalconditions", prepareMedicalConditionList(medicalConditionId));
        uiModel.addAttribute("othertreatments", OtherTreatment.findAllOtherTreatments());
    }

    protected List<MedicalCondition> prepareMedicalConditionList(String medicalConditionId) {
        List<MedicalCondition> list = new ArrayList<MedicalCondition>();
        if (medicalConditionId != null) {
            for (MedicalCondition condition : MedicalCondition.findAllMedicalConditions()) {
                if (condition.getId() == Integer.parseInt(medicalConditionId)) {
                    list.add(condition);
                }
            }
        } else {
            list.addAll(MedicalCondition.findAllMedicalConditions());
        }
        return list;
    }
}
