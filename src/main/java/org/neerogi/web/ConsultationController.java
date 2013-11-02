package org.neerogi.web;
import org.neerogi.domain.Consultation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/consultations")
@Controller
@RooWebScaffold(path = "consultations", formBackingObject = Consultation.class)
public class ConsultationController {
}
