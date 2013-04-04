package org.neerogi.domain.web;

import org.neerogi.domain.FollowUp;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/followups")
@Controller
@RooWebScaffold(path = "followups", formBackingObject = FollowUp.class)
public class FollowUpController {
}
