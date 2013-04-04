// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.neerogi.domain.Consultation;
import org.neerogi.domain.ConsultationDataOnDemand;
import org.neerogi.domain.ConsultationIntegrationTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ConsultationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ConsultationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ConsultationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ConsultationIntegrationTest: @Transactional;
    
    @Autowired
    ConsultationDataOnDemand ConsultationIntegrationTest.dod;
    
    @Test
    public void ConsultationIntegrationTest.testCountConsultations() {
        Assert.assertNotNull("Data on demand for 'Consultation' failed to initialize correctly", dod.getRandomConsultation());
        long count = Consultation.countConsultations();
        Assert.assertTrue("Counter for 'Consultation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ConsultationIntegrationTest.testFindConsultation() {
        Consultation obj = dod.getRandomConsultation();
        Assert.assertNotNull("Data on demand for 'Consultation' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Consultation' failed to provide an identifier", id);
        obj = Consultation.findConsultation(id);
        Assert.assertNotNull("Find method for 'Consultation' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Consultation' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ConsultationIntegrationTest.testFindAllConsultations() {
        Assert.assertNotNull("Data on demand for 'Consultation' failed to initialize correctly", dod.getRandomConsultation());
        long count = Consultation.countConsultations();
        Assert.assertTrue("Too expensive to perform a find all test for 'Consultation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Consultation> result = Consultation.findAllConsultations();
        Assert.assertNotNull("Find all method for 'Consultation' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Consultation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ConsultationIntegrationTest.testFindConsultationEntries() {
        Assert.assertNotNull("Data on demand for 'Consultation' failed to initialize correctly", dod.getRandomConsultation());
        long count = Consultation.countConsultations();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Consultation> result = Consultation.findConsultationEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Consultation' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Consultation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ConsultationIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Consultation' failed to initialize correctly", dod.getRandomConsultation());
        Consultation obj = dod.getNewTransientConsultation(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Consultation' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Consultation' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Consultation' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ConsultationIntegrationTest.testRemove() {
        Consultation obj = dod.getRandomConsultation();
        Assert.assertNotNull("Data on demand for 'Consultation' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Consultation' failed to provide an identifier", id);
        obj = Consultation.findConsultation(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Consultation' with identifier '" + id + "'", Consultation.findConsultation(id));
    }
    
}
