// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import org.neerogi.domain.Allergy;
import org.neerogi.domain.AllergyType;
import org.neerogi.domain.Consultation;
import org.neerogi.domain.Doctor;
import org.neerogi.domain.DrugTreatment;
import org.neerogi.domain.Hospital;
import org.neerogi.domain.Investigation;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.MedicalSpeciality;
import org.neerogi.domain.MedicalSubSpeciality;
import org.neerogi.domain.OtherTreatment;
import org.neerogi.domain.Patient;
import org.neerogi.domain.SocialHistory;
import org.neerogi.domain.Title;
import org.neerogi.domain.Treatment;
import org.neerogi.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Integer, Allergy> ApplicationConversionServiceFactoryBean.getIdToAllergyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Allergy>() {
            public org.neerogi.domain.Allergy convert(java.lang.Integer id) {
                return Allergy.findAllergy(id);
            }
        };
    }
    
    public Converter<String, Allergy> ApplicationConversionServiceFactoryBean.getStringToAllergyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Allergy>() {
            public org.neerogi.domain.Allergy convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Allergy.class);
            }
        };
    }
    
    public Converter<Integer, AllergyType> ApplicationConversionServiceFactoryBean.getIdToAllergyTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.AllergyType>() {
            public org.neerogi.domain.AllergyType convert(java.lang.Integer id) {
                return AllergyType.findAllergyType(id);
            }
        };
    }
    
    public Converter<String, AllergyType> ApplicationConversionServiceFactoryBean.getStringToAllergyTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.AllergyType>() {
            public org.neerogi.domain.AllergyType convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), AllergyType.class);
            }
        };
    }
    
    public Converter<Integer, Consultation> ApplicationConversionServiceFactoryBean.getIdToConsultationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Consultation>() {
            public org.neerogi.domain.Consultation convert(java.lang.Integer id) {
                return Consultation.findConsultation(id);
            }
        };
    }
    
    public Converter<String, Consultation> ApplicationConversionServiceFactoryBean.getStringToConsultationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Consultation>() {
            public org.neerogi.domain.Consultation convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Consultation.class);
            }
        };
    }
    
    public Converter<Integer, Doctor> ApplicationConversionServiceFactoryBean.getIdToDoctorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Doctor>() {
            public org.neerogi.domain.Doctor convert(java.lang.Integer id) {
                return Doctor.findDoctor(id);
            }
        };
    }
    
    public Converter<String, Doctor> ApplicationConversionServiceFactoryBean.getStringToDoctorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Doctor>() {
            public org.neerogi.domain.Doctor convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Doctor.class);
            }
        };
    }
    
    public Converter<Integer, DrugTreatment> ApplicationConversionServiceFactoryBean.getIdToDrugTreatmentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.DrugTreatment>() {
            public org.neerogi.domain.DrugTreatment convert(java.lang.Integer id) {
                return DrugTreatment.findDrugTreatment(id);
            }
        };
    }
    
    public Converter<String, DrugTreatment> ApplicationConversionServiceFactoryBean.getStringToDrugTreatmentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.DrugTreatment>() {
            public org.neerogi.domain.DrugTreatment convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), DrugTreatment.class);
            }
        };
    }
    
    public Converter<Integer, Hospital> ApplicationConversionServiceFactoryBean.getIdToHospitalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Hospital>() {
            public org.neerogi.domain.Hospital convert(java.lang.Integer id) {
                return Hospital.findHospital(id);
            }
        };
    }
    
    public Converter<String, Hospital> ApplicationConversionServiceFactoryBean.getStringToHospitalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Hospital>() {
            public org.neerogi.domain.Hospital convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Hospital.class);
            }
        };
    }
    
    public Converter<Integer, Investigation> ApplicationConversionServiceFactoryBean.getIdToInvestigationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Investigation>() {
            public org.neerogi.domain.Investigation convert(java.lang.Integer id) {
                return Investigation.findInvestigation(id);
            }
        };
    }
    
    public Converter<String, Investigation> ApplicationConversionServiceFactoryBean.getStringToInvestigationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Investigation>() {
            public org.neerogi.domain.Investigation convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Investigation.class);
            }
        };
    }
    
    public Converter<Integer, MedicalCondition> ApplicationConversionServiceFactoryBean.getIdToMedicalConditionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.MedicalCondition>() {
            public org.neerogi.domain.MedicalCondition convert(java.lang.Integer id) {
                return MedicalCondition.findMedicalCondition(id);
            }
        };
    }
    
    public Converter<String, MedicalCondition> ApplicationConversionServiceFactoryBean.getStringToMedicalConditionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.MedicalCondition>() {
            public org.neerogi.domain.MedicalCondition convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), MedicalCondition.class);
            }
        };
    }
    
    public Converter<Integer, MedicalSpeciality> ApplicationConversionServiceFactoryBean.getIdToMedicalSpecialityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.MedicalSpeciality>() {
            public org.neerogi.domain.MedicalSpeciality convert(java.lang.Integer id) {
                return MedicalSpeciality.findMedicalSpeciality(id);
            }
        };
    }
    
    public Converter<String, MedicalSpeciality> ApplicationConversionServiceFactoryBean.getStringToMedicalSpecialityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.MedicalSpeciality>() {
            public org.neerogi.domain.MedicalSpeciality convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), MedicalSpeciality.class);
            }
        };
    }
    
    public Converter<Integer, MedicalSubSpeciality> ApplicationConversionServiceFactoryBean.getIdToMedicalSubSpecialityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.MedicalSubSpeciality>() {
            public org.neerogi.domain.MedicalSubSpeciality convert(java.lang.Integer id) {
                return MedicalSubSpeciality.findMedicalSubSpeciality(id);
            }
        };
    }
    
    public Converter<String, MedicalSubSpeciality> ApplicationConversionServiceFactoryBean.getStringToMedicalSubSpecialityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.MedicalSubSpeciality>() {
            public org.neerogi.domain.MedicalSubSpeciality convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), MedicalSubSpeciality.class);
            }
        };
    }
    
    public Converter<Integer, OtherTreatment> ApplicationConversionServiceFactoryBean.getIdToOtherTreatmentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.OtherTreatment>() {
            public org.neerogi.domain.OtherTreatment convert(java.lang.Integer id) {
                return OtherTreatment.findOtherTreatment(id);
            }
        };
    }
    
    public Converter<String, OtherTreatment> ApplicationConversionServiceFactoryBean.getStringToOtherTreatmentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.OtherTreatment>() {
            public org.neerogi.domain.OtherTreatment convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), OtherTreatment.class);
            }
        };
    }
    
    public Converter<Integer, Patient> ApplicationConversionServiceFactoryBean.getIdToPatientConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Patient>() {
            public org.neerogi.domain.Patient convert(java.lang.Integer id) {
                return Patient.findPatient(id);
            }
        };
    }
    
    public Converter<String, Patient> ApplicationConversionServiceFactoryBean.getStringToPatientConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Patient>() {
            public org.neerogi.domain.Patient convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Patient.class);
            }
        };
    }
    
    public Converter<Integer, SocialHistory> ApplicationConversionServiceFactoryBean.getIdToSocialHistoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.SocialHistory>() {
            public org.neerogi.domain.SocialHistory convert(java.lang.Integer id) {
                return SocialHistory.findSocialHistory(id);
            }
        };
    }
    
    public Converter<String, SocialHistory> ApplicationConversionServiceFactoryBean.getStringToSocialHistoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.SocialHistory>() {
            public org.neerogi.domain.SocialHistory convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), SocialHistory.class);
            }
        };
    }
    
    public Converter<Title, String> ApplicationConversionServiceFactoryBean.getTitleToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Title, java.lang.String>() {
            public String convert(Title title) {
                return new StringBuilder().append(title.getName()).toString();
            }
        };
    }
    
    public Converter<Integer, Title> ApplicationConversionServiceFactoryBean.getIdToTitleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Title>() {
            public org.neerogi.domain.Title convert(java.lang.Integer id) {
                return Title.findTitle(id);
            }
        };
    }
    
    public Converter<String, Title> ApplicationConversionServiceFactoryBean.getStringToTitleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Title>() {
            public org.neerogi.domain.Title convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Title.class);
            }
        };
    }
    
    public Converter<Integer, Treatment> ApplicationConversionServiceFactoryBean.getIdToTreatmentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, org.neerogi.domain.Treatment>() {
            public org.neerogi.domain.Treatment convert(java.lang.Integer id) {
                return Treatment.findTreatment(id);
            }
        };
    }
    
    public Converter<String, Treatment> ApplicationConversionServiceFactoryBean.getStringToTreatmentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.neerogi.domain.Treatment>() {
            public org.neerogi.domain.Treatment convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Treatment.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAllergyToStringConverter());
        registry.addConverter(getIdToAllergyConverter());
        registry.addConverter(getStringToAllergyConverter());
        registry.addConverter(getAllergyTypeToStringConverter());
        registry.addConverter(getIdToAllergyTypeConverter());
        registry.addConverter(getStringToAllergyTypeConverter());
        registry.addConverter(getConsultationToStringConverter());
        registry.addConverter(getIdToConsultationConverter());
        registry.addConverter(getStringToConsultationConverter());
        registry.addConverter(getDoctorToStringConverter());
        registry.addConverter(getIdToDoctorConverter());
        registry.addConverter(getStringToDoctorConverter());
        registry.addConverter(getDrugTreatmentToStringConverter());
        registry.addConverter(getIdToDrugTreatmentConverter());
        registry.addConverter(getStringToDrugTreatmentConverter());
        registry.addConverter(getHospitalToStringConverter());
        registry.addConverter(getIdToHospitalConverter());
        registry.addConverter(getStringToHospitalConverter());
        registry.addConverter(getInvestigationToStringConverter());
        registry.addConverter(getIdToInvestigationConverter());
        registry.addConverter(getStringToInvestigationConverter());
        registry.addConverter(getMedicalConditionToStringConverter());
        registry.addConverter(getIdToMedicalConditionConverter());
        registry.addConverter(getStringToMedicalConditionConverter());
        registry.addConverter(getMedicalSpecialityToStringConverter());
        registry.addConverter(getIdToMedicalSpecialityConverter());
        registry.addConverter(getStringToMedicalSpecialityConverter());
        registry.addConverter(getMedicalSubSpecialityToStringConverter());
        registry.addConverter(getIdToMedicalSubSpecialityConverter());
        registry.addConverter(getStringToMedicalSubSpecialityConverter());
        registry.addConverter(getOtherTreatmentToStringConverter());
        registry.addConverter(getIdToOtherTreatmentConverter());
        registry.addConverter(getStringToOtherTreatmentConverter());
        registry.addConverter(getPatientToStringConverter());
        registry.addConverter(getIdToPatientConverter());
        registry.addConverter(getStringToPatientConverter());
        registry.addConverter(getSocialHistoryToStringConverter());
        registry.addConverter(getIdToSocialHistoryConverter());
        registry.addConverter(getStringToSocialHistoryConverter());
        registry.addConverter(getTitleToStringConverter());
        registry.addConverter(getIdToTitleConverter());
        registry.addConverter(getStringToTitleConverter());
        registry.addConverter(getTreatmentToStringConverter());
        registry.addConverter(getIdToTreatmentConverter());
        registry.addConverter(getStringToTreatmentConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
