package org.neerogi.web;

import org.neerogi.domain.Doctor;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/doctors")
@Controller
@RooWebScaffold(path = "doctors", formBackingObject = Doctor.class)
public class DoctorController {
}
