// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.neerogi.domain.ConditionSubTypes;
import org.neerogi.domain.ConditionSubTypesDataOnDemand;
import org.neerogi.domain.ConditionSubTypesIntegrationTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ConditionSubTypesIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ConditionSubTypesIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ConditionSubTypesIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ConditionSubTypesIntegrationTest: @Transactional;
    
    @Autowired
    ConditionSubTypesDataOnDemand ConditionSubTypesIntegrationTest.dod;
    
    @Test
    public void ConditionSubTypesIntegrationTest.testCountConditionSubTypeses() {
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to initialize correctly", dod.getRandomConditionSubTypes());
        long count = ConditionSubTypes.countConditionSubTypeses();
        Assert.assertTrue("Counter for 'ConditionSubTypes' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ConditionSubTypesIntegrationTest.testFindConditionSubTypes() {
        ConditionSubTypes obj = dod.getRandomConditionSubTypes();
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to provide an identifier", id);
        obj = ConditionSubTypes.findConditionSubTypes(id);
        Assert.assertNotNull("Find method for 'ConditionSubTypes' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ConditionSubTypes' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ConditionSubTypesIntegrationTest.testFindAllConditionSubTypeses() {
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to initialize correctly", dod.getRandomConditionSubTypes());
        long count = ConditionSubTypes.countConditionSubTypeses();
        Assert.assertTrue("Too expensive to perform a find all test for 'ConditionSubTypes', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ConditionSubTypes> result = ConditionSubTypes.findAllConditionSubTypeses();
        Assert.assertNotNull("Find all method for 'ConditionSubTypes' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ConditionSubTypes' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ConditionSubTypesIntegrationTest.testFindConditionSubTypesEntries() {
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to initialize correctly", dod.getRandomConditionSubTypes());
        long count = ConditionSubTypes.countConditionSubTypeses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ConditionSubTypes> result = ConditionSubTypes.findConditionSubTypesEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ConditionSubTypes' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ConditionSubTypes' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ConditionSubTypesIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to initialize correctly", dod.getRandomConditionSubTypes());
        ConditionSubTypes obj = dod.getNewTransientConditionSubTypes(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ConditionSubTypes' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ConditionSubTypes' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ConditionSubTypesIntegrationTest.testRemove() {
        ConditionSubTypes obj = dod.getRandomConditionSubTypes();
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConditionSubTypes' failed to provide an identifier", id);
        obj = ConditionSubTypes.findConditionSubTypes(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ConditionSubTypes' with identifier '" + id + "'", ConditionSubTypes.findConditionSubTypes(id));
    }
    
}
