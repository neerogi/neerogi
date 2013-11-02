package org.neerogi.web;
import org.neerogi.domain.MedicalSpeciality;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medicalspecialitys")
@Controller
@RooWebScaffold(path = "medicalspecialitys", formBackingObject = MedicalSpeciality.class)
public class MedicalSpecialityController {
}
