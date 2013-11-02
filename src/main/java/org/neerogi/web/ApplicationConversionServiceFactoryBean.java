package org.neerogi.web;

import org.neerogi.domain.Consultation;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

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

    public Converter<Consultation, String> getConsultationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.neerogi.domain.Consultation, java.lang.String>() {
            public String convert(Consultation consultation) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                return new StringBuilder().append(format.format(consultation.getVisitDate().getTime())).toString();
            }
        };
    }
}
