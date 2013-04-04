package org.neerogi.web;

import org.neerogi.ProcedureTreatment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/proceduretreatments")
@Controller
@RooWebScaffold(path = "proceduretreatments", formBackingObject = ProcedureTreatment.class)
public class ProcedureTreatmentController {
}
