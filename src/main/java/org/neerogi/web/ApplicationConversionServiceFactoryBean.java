package org.neerogi.web;

import java.text.SimpleDateFormat;

import org.neerogi.domain.Consultation;
import org.neerogi.domain.MedicalCondition;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

    //private Log log = LogFactory.getLog(this.getClass());

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}
	
    public Converter<Consultation, String> getConsultationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Consultation, java.lang.String>() {
            public String convert(Consultation consultation) {
                try {            	   
                   StringBuilder sb = new StringBuilder();	   
                   sb.append(consultation.getId());
                   sb.append(" - ");
                   if(consultation.getVisitDate() != null) {
                      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");            
                      String visitDate = sdf.format(consultation.getVisitDate().getTime());                      
                      sb.append(visitDate);
                   }
                   return sb.toString();
                }
                catch(Exception e) {
                   return "Error: " + e.getMessage();
                }
            }
        };
    }
    
    public Converter<MedicalCondition, String> getMedicalConditionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.MedicalCondition, java.lang.String>() {
            public String convert(MedicalCondition medicalCondition) {
                return new StringBuilder().append(medicalCondition.getName()).append(' ').append(medicalCondition.getDescription()).append(' ').toString();
            }
        };
    }
}
