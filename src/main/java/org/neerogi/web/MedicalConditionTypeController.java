package org.neerogi.web;

import org.neerogi.domain.MedicalConditionType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medicalconditiontypes")
@Controller
@RooWebScaffold(path = "medicalconditiontypes", formBackingObject = MedicalConditionType.class)
public class MedicalConditionTypeController {
}
