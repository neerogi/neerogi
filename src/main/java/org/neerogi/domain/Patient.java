package org.neerogi.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "allergies", "consultations", "medicalConditions", "socialHistories", "title" })
@RooJpaActiveRecord(versionField = "", table = "patient", finders = { "ClinicNo" })
public class Patient {
}
