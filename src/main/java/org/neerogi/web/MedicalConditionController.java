package org.neerogi.web;
import org.neerogi.domain.*;
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

@RequestMapping("/medicalconditions")
@Controller
@RooWebScaffold(path = "medicalconditions", formBackingObject = MedicalCondition.class)
public class MedicalConditionController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new MedicalCondition(), request.getParameter("parent_id"));
        uiModel.addAttribute("patient_id", request.getParameter("parent_id"));
        return "medicalconditions/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid MedicalCondition medicalCondition, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        String parentId = (medicalCondition.getPatient() != null) ? medicalCondition.getPatient().getId().toString() : null;
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, medicalCondition, parentId);
            return "medicalconditions/create";
        }
        if(medicalCondition.getDiagnosis() == null || medicalCondition.getDiagnosis().length() == 0) {
            populateEditForm(uiModel, medicalCondition, parentId);
            bindingResult.rejectValue("diagnosis", "diagnosis_field_required");
            return "medicalconditions/create";
        }

        uiModel.asMap().clear();
        medicalCondition.persist();
        return "redirect:/medicalconditions/" + encodeUrlPathSegment(medicalCondition.getId().toString(), request);
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid MedicalCondition medicalCondition, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, medicalCondition, request.getParameter("parent_id"));
            return "medicalconditions/update";
        }
        uiModel.asMap().clear();
        medicalCondition.merge();
        return "redirect:/medicalconditions/" + encodeUrlPathSegment(medicalCondition.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, MedicalCondition.findMedicalCondition(id), request.getParameter("parent_id"));
        return "medicalconditions/update";
    }

    void populateEditForm(Model uiModel, MedicalCondition medicalCondition, String patientId) {
        uiModel.addAttribute("medicalCondition", medicalCondition);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("consultations", prepareConsulationList(patientId));
        uiModel.addAttribute("investigations", Investigation.findAllInvestigations());
        uiModel.addAttribute("medicalspecialitys", MedicalSpeciality.findAllMedicalSpecialitys());
        uiModel.addAttribute("medicalsubspecialitys", MedicalSubSpeciality.findAllMedicalSubSpecialitys());
        uiModel.addAttribute("patients", preparePatientList(patientId));
        uiModel.addAttribute("treatments", Treatment.findAllTreatments());
    }

    private List<Consultation> prepareConsulationList(String patientId) {
        List<Consultation> list = new ArrayList<Consultation>();
        if(patientId != null) {
            for(Consultation consultation : Consultation.findAllConsultations()) {
                if(consultation.getPatient().getId() == Integer.parseInt(patientId)) {
                    list.add(consultation);
                }
            }
        }
        return list;
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
