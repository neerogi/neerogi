package org.neerogi.web;

import org.neerogi.domain.*;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import javax.servlet.http.HttpServletRequest;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

    public Converter<Allergy, String> getAllergyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Allergy, java.lang.String>() {
            public String convert(Allergy allergy) {
                String displayText = new StringBuilder().append(allergy.getDescription()).toString();
                return ApplicationUtil.getEntityLink("allergys", allergy.getId(), displayText);
            }
        };
    }

    public Converter<AllergyType, String> getAllergyTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.AllergyType, java.lang.String>() {
            public String convert(AllergyType allergyType) {
                String displayText = new StringBuilder().append(allergyType.getName()).toString();
                return ApplicationUtil.getEntityLink("allergytypes", allergyType.getId(), displayText);
            }
        };
    }

    public Converter<DrugTreatment, String> getDrugTreatmentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.DrugTreatment, java.lang.String>() {
            public String convert(DrugTreatment drugTreatment) {
                String displayText = new StringBuilder().append(drugTreatment.getName()).toString();
                return ApplicationUtil.getEntityLink("drugtreatments", drugTreatment.getId(), displayText);
            }
        };
    }

    public Converter<Hospital, String> getHospitalToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Hospital, java.lang.String>() {
            public String convert(Hospital hospital) {
                String displayText = new StringBuilder().append(hospital.getName()).toString();
                return ApplicationUtil.getEntityLink("hospitals", hospital.getId(), displayText);
            }
        };
    }

    public Converter<Investigation, String> getInvestigationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Investigation, java.lang.String>() {
            public String convert(Investigation investigation) {
                String displayText = new StringBuilder().append(investigation.getName()).toString();
                return ApplicationUtil.getEntityLink("investigations", investigation.getId(), displayText);
            }
        };
    }

    public Converter<MedicalCondition, String> getMedicalConditionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.MedicalCondition, java.lang.String>() {
            public String convert(MedicalCondition medicalCondition) {
                String displayText = new StringBuilder().append(medicalCondition.getDiagnosis()).toString();
                return ApplicationUtil.getEntityLink("medicalconditions", medicalCondition.getId(), displayText);
            }
        };
    }

    public Converter<MedicalSpeciality, String> getMedicalSpecialityToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.MedicalSpeciality, java.lang.String>() {
            public String convert(MedicalSpeciality medicalSpeciality) {
                String displayText = new StringBuilder().append(medicalSpeciality.getName()).toString();
                return ApplicationUtil.getEntityLink("medicalspeciality", medicalSpeciality.getId(), displayText);
            }
        };
    }

    public Converter<MedicalSubSpeciality, String> getMedicalSubSpecialityToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.MedicalSubSpeciality, java.lang.String>() {
            public String convert(MedicalSubSpeciality medicalSubSpeciality) {
                String displayText = new StringBuilder().append(medicalSubSpeciality.getName()).toString();
                return ApplicationUtil.getEntityLink("medicalsubspecialitys", medicalSubSpeciality.getId(), displayText);
            }
        };
    }

    public Converter<Doctor, String> getDoctorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Doctor, java.lang.String>() {
            public String convert(Doctor doctor) {
                String displayText = new StringBuilder().append(doctor.getDesignation()).append(" ").append(doctor.getName()).toString();
                return ApplicationUtil.getEntityLink("doctors", doctor.getId(), displayText);
            }
        };
    }

    public Converter<Treatment, String> getTreatmentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Treatment, java.lang.String>() {
            public String convert(Treatment treatment) {
                String displayText = new StringBuilder().append(treatment.getName()).toString();
                return ApplicationUtil.getEntityLink("treatments", treatment.getId(), displayText);
            }
        };
    }

    public Converter<OtherTreatment, String> getOtherTreatmentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.OtherTreatment, java.lang.String>() {
            public String convert(OtherTreatment otherTreatment) {
                String displayText = new StringBuilder().append(otherTreatment.getName()).toString();
                return ApplicationUtil.getEntityLink("othertreatments", otherTreatment.getId(), displayText);
            }
        };
    }

    public Converter<Consultation, String> getConsultationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Consultation, java.lang.String>() {
            public String convert(Consultation consultation) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String displayText = new StringBuilder().append(format.format(consultation.getVisitDate().getTime())).toString();
                return ApplicationUtil.getEntityLink("consultations", consultation.getId(), displayText);
            }
        };
    }

    public Converter<SocialHistory, String> getSocialHistoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.SocialHistory, java.lang.String>() {
            public String convert(SocialHistory socialHistory) {
                String displayText = new StringBuilder().append(socialHistory.getDescription()).toString();
                return ApplicationUtil.getEntityLink("socialhistorys", socialHistory.getId(), displayText);
            }
        };
    }

    public Converter<Patient, String> getPatientToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Patient, java.lang.String>() {
            public String convert(Patient patient) {
                String displayText = new StringBuilder().append(patient.getTitle().getName()).append(" ").append(patient.getName()).toString();
                return ApplicationUtil.getEntityLink("patients", patient.getId(), displayText);
            }
        };
    }
}
