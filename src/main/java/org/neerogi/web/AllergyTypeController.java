package org.neerogi.web;
import org.neerogi.domain.AllergyType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/allergytypes")
@Controller
@RooWebScaffold(path = "allergytypes", formBackingObject = AllergyType.class)
public class AllergyTypeController {
}
