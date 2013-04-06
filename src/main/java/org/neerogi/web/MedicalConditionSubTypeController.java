package org.neerogi.web;

import org.neerogi.domain.MedicalConditionSubType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medicalconditionsubtypes")
@Controller
@RooWebScaffold(path = "medicalconditionsubtypes", formBackingObject = MedicalConditionSubType.class)
public class MedicalConditionSubTypeController {
}
