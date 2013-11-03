package org.neerogi.web;
import org.neerogi.domain.MedicalCondition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RequestMapping("/medicalconditions")
@Controller
@RooWebScaffold(path = "medicalconditions", formBackingObject = MedicalCondition.class)
public class MedicalConditionController {
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid MedicalCondition medicalCondition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, medicalCondition);
            return "medicalconditions/create";
        }
        if(medicalCondition.getDiagnosis() == null || medicalCondition.getDiagnosis().length() == 0) {
            populateEditForm(uiModel, medicalCondition);
            bindingResult.rejectValue("diagnosis", "diagnosis_field_required");
            return "medicalconditions/create";
        }

        uiModel.asMap().clear();
        medicalCondition.persist();
        return "redirect:/medicalconditions/" + encodeUrlPathSegment(medicalCondition.getId().toString(), httpServletRequest);
    }
}
