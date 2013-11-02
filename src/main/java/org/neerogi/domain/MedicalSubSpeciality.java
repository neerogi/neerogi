package org.neerogi.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "medical_sub_speciality")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "medicalConditions", "medicalSpeciality" })
public class MedicalSubSpeciality {
}
