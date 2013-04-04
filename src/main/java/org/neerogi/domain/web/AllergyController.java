package org.neerogi.domain.web;

import org.neerogi.domain.Allergy;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/allergys")
@Controller
@RooWebScaffold(path = "allergys", formBackingObject = Allergy.class)
public class AllergyController {
}
