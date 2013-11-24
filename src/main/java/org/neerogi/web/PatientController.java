package org.neerogi.web;
import org.neerogi.domain.Patient;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/patients")
@Controller
@RooWebScaffold(path = "patients", formBackingObject = Patient.class)
@RooWebFinder
public class PatientController {
}
