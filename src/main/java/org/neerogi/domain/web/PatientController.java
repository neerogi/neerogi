package org.neerogi.domain.web;

import org.neerogi.domain.Patient;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/patients")
@Controller
@RooWebScaffold(path = "patients", formBackingObject = Patient.class)
public class PatientController {
}
