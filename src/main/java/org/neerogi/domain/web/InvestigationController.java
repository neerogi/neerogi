package org.neerogi.domain.web;

import org.neerogi.domain.Investigation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/investigations")
@Controller
@RooWebScaffold(path = "investigations", formBackingObject = Investigation.class)
public class InvestigationController {
}
