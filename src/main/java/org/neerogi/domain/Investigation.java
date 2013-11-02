package org.neerogi.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "investigation")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "medicalCondition" })
public class Investigation {
}
