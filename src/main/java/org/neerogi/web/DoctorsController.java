package org.neerogi.web;

import org.neerogi.Doctors;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/doctorses")
@Controller
@RooWebScaffold(path = "doctorses", formBackingObject = Doctors.class)
public class DoctorsController {
}
