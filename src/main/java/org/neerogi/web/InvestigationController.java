package org.neerogi.web;

import org.neerogi.domain.Investigation;
import org.neerogi.domain.MedicalCondition;
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

@RequestMapping("/investigations")
@Controller
@RooWebScaffold(path = "investigations", formBackingObject = Investigation.class)
public class InvestigationController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new Investigation(), request.getParameter("parent_id"));
        return "investigations/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Investigation investigation, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, investigation, request.getParameter("parent_id"));
            return "investigations/create";
        }
        uiModel.asMap().clear();
        investigation.persist();
        return "redirect:/investigations/" + encodeUrlPathSegment(investigation.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, Investigation.findInvestigation(id), request.getParameter("parent_id"));
        return "investigations/update";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Investigation investigation, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, investigation, request.getParameter("parent_id"));
            return "investigations/update";
        }
        uiModel.asMap().clear();
        investigation.merge();
        return "redirect:/investigations/" + encodeUrlPathSegment(investigation.getId().toString(), request);
    }

    void populateEditForm(Model uiModel, Investigation investigation, String medicalConditionId) {
        uiModel.addAttribute("investigation", investigation);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("medicalconditions", prepareMedicalConditionList(medicalConditionId));
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
