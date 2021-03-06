// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.MedicalSpeciality;
import org.neerogi.domain.MedicalSubSpeciality;

privileged aspect MedicalSpeciality_Roo_DbManaged {
    
    @OneToMany(mappedBy = "medicalSpeciality", cascade = CascadeType.ALL)
    private Set<MedicalCondition> MedicalSpeciality.medicalConditions;
    
    @OneToMany(mappedBy = "medicalSpeciality", cascade = CascadeType.ALL)
    private Set<MedicalSubSpeciality> MedicalSpeciality.medicalSubSpecialities;
    
    @Column(name = "name", length = 1000)
    @NotNull
    private String MedicalSpeciality.name;
    
    public Set<MedicalCondition> MedicalSpeciality.getMedicalConditions() {
        return medicalConditions;
    }
    
    public void MedicalSpeciality.setMedicalConditions(Set<MedicalCondition> medicalConditions) {
        this.medicalConditions = medicalConditions;
    }
    
    public Set<MedicalSubSpeciality> MedicalSpeciality.getMedicalSubSpecialities() {
        return medicalSubSpecialities;
    }
    
    public void MedicalSpeciality.setMedicalSubSpecialities(Set<MedicalSubSpeciality> medicalSubSpecialities) {
        this.medicalSubSpecialities = medicalSubSpecialities;
    }
    
    public String MedicalSpeciality.getName() {
        return name;
    }
    
    public void MedicalSpeciality.setName(String name) {
        this.name = name;
    }
    
}
