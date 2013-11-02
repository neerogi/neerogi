// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.MedicalSpeciality;
import org.neerogi.domain.MedicalSubSpeciality;

privileged aspect MedicalSubSpeciality_Roo_DbManaged {
    
    @OneToMany(mappedBy = "medicalSubSpeciality", cascade = CascadeType.ALL)
    private Set<MedicalCondition> MedicalSubSpeciality.medicalConditions;
    
    @ManyToOne
    @JoinColumn(name = "medical_speciality", referencedColumnName = "id", nullable = false)
    private MedicalSpeciality MedicalSubSpeciality.medicalSpeciality;
    
    @Column(name = "name", length = 1000)
    @NotNull
    private String MedicalSubSpeciality.name;
    
    public Set<MedicalCondition> MedicalSubSpeciality.getMedicalConditions() {
        return medicalConditions;
    }
    
    public void MedicalSubSpeciality.setMedicalConditions(Set<MedicalCondition> medicalConditions) {
        this.medicalConditions = medicalConditions;
    }
    
    public MedicalSpeciality MedicalSubSpeciality.getMedicalSpeciality() {
        return medicalSpeciality;
    }
    
    public void MedicalSubSpeciality.setMedicalSpeciality(MedicalSpeciality medicalSpeciality) {
        this.medicalSpeciality = medicalSpeciality;
    }
    
    public String MedicalSubSpeciality.getName() {
        return name;
    }
    
    public void MedicalSubSpeciality.setName(String name) {
        this.name = name;
    }
    
}
