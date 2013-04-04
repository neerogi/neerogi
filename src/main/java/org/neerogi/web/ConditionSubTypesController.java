package org.neerogi.web;

import org.neerogi.ConditionSubTypes;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/conditionsubtypeses")
@Controller
@RooWebScaffold(path = "conditionsubtypeses", formBackingObject = ConditionSubTypes.class)
public class ConditionSubTypesController {
}
