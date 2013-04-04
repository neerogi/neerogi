package org.neerogi.web;

import org.neerogi.Condition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/conditions")
@Controller
@RooWebScaffold(path = "conditions", formBackingObject = Condition.class)
public class ConditionController {
}
