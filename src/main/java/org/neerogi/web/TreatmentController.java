package org.neerogi.web;

import org.neerogi.Treatment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/treatments")
@Controller
@RooWebScaffold(path = "treatments", formBackingObject = Treatment.class)
public class TreatmentController {
}
