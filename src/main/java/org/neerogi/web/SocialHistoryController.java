package org.neerogi.web;

import org.neerogi.domain.SocialHistory;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/socialhistorys")
@Controller
@RooWebScaffold(path = "socialhistorys", formBackingObject = SocialHistory.class)
public class SocialHistoryController {
}
