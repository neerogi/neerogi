package org.neerogi.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "medical_condition")
@RooDbManaged(automaticallyDelete = true)
public class MedicalCondition {
    @Column(name = "follow_up", columnDefinition = "BIT", length = 1)
    @NotNull
    private boolean followUp;
}
