package org.neerogi.web;

import org.neerogi.domain.DrugTreatment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/drugtreatments")
@Controller
@RooWebScaffold(path = "drugtreatments", formBackingObject = DrugTreatment.class)
public class DrugTreatmentController {
}
