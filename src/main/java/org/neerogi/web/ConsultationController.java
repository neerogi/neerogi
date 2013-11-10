package org.neerogi.web;
import org.neerogi.domain.Consultation;
import org.neerogi.domain.Doctor;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.Patient;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RequestMapping("/consultations")
@Controller
@RooWebScaffold(path = "consultations", formBackingObject = Consultation.class)
public class ConsultationController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, new Consultation(), request.getParameter("parent_id"));
        return "consultations/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Consultation consultation, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, consultation, request.getParameter("parent_id"));
            return "consultations/create";
        }
        uiModel.asMap().clear();
        consultation.persist();
        return "redirect:/consultations/" + encodeUrlPathSegment(consultation.getId().toString(), request);
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Consultation consultation, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, consultation, request.getParameter("parent_id"));
            return "consultations/update";
        }
        uiModel.asMap().clear();
        consultation.merge();
        return "redirect:/consultations/" + encodeUrlPathSegment(consultation.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request) {
        populateEditForm(uiModel, Consultation.findConsultation(id), request.getParameter("parent_id"));
        return "consultations/update";
    }

    @RequestMapping(value = "listByPatient", method = RequestMethod.POST, produces = "text/html")
    @ResponseBody
    public String listByPatient(@RequestParam int patientId) {
        String out = "";
        try {
        out += "   <label for=\"_consultation_id\" id=\"_consultation_id_label\">Consultation:</label>";
        out += "   <select id=\"_consultation_id\" name=\"consultation\">";
        List<Consultation> list = Consultation.findAllConsultations();
        for(Consultation item : list) {
            if(item.getPatient().getId() == patientId) {
                out += "      <option value=\"" + item.getId() + "\">" + formatDate(item.getVisitDate()) + "</option>";
            }
        }
        out += "   </select>";
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return out;
    }

    void populateEditForm(Model uiModel, Consultation consultation, String patientId) {
        uiModel.addAttribute("consultation", consultation);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("doctors", Doctor.findAllDoctors());
        uiModel.addAttribute("medicalconditions", MedicalCondition.findAllMedicalConditions());
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

    private String formatDate(Calendar calendar) {
        Date date = calendar.getTime();
        if(date != null) {
            return ApplicationUtil.getSimpleDateFormat().format(date);
        }
        return "";
    }

}
