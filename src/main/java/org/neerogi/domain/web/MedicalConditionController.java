package org.neerogi.domain.web;

import org.neerogi.domain.MedicalCondition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medicalconditions")
@Controller
@RooWebScaffold(path = "medicalconditions", formBackingObject = MedicalCondition.class)
public class MedicalConditionController {
}
