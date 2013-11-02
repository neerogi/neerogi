package org.neerogi.web;
import org.neerogi.domain.MedicalSubSpeciality;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medicalsubspecialitys")
@Controller
@RooWebScaffold(path = "medicalsubspecialitys", formBackingObject = MedicalSubSpeciality.class)
public class MedicalSubSpecialityController {
}
