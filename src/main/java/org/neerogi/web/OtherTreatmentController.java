package org.neerogi.web;
import org.neerogi.domain.OtherTreatment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/othertreatments")
@Controller
@RooWebScaffold(path = "othertreatments", formBackingObject = OtherTreatment.class)
public class OtherTreatmentController {
}
