/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import transferobjects.Host;

/**
 *
 * @author chris
 */
public class HostBusinessLayerTest {
    
    public HostBusinessLayerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getAllHost method, of class HostBusinessLayer.
     */
    @Test
    public void testGetAllHost() {
        System.out.println("getAllHost");
        HostBusinessLayer instance = new HostBusinessLayer();
        List<Host> expResult = null;
        List<Host> result = instance.getAllHost();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addHost method, of class HostBusinessLayer.
     */
    @Test
    public void testAddHost() throws Exception {
        System.out.println("addHost");
        Host host = null;
        HostBusinessLayer instance = new HostBusinessLayer();
        instance.addHost(host);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getHostByHostId method, of class HostBusinessLayer.
     */
    @Test
    public void testGetHostByHostId() {
        System.out.println("getHostByHostId");
        int hostId = 0;
        HostBusinessLayer instance = new HostBusinessLayer();
        Host expResult = null;
        Host result = instance.getHostByHostId(hostId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getHostByEmail method, of class HostBusinessLayer.
     */
    @Test
    public void testGetHostByEmail() {
        System.out.println("getHostByEmail");
        String email = "";
        HostBusinessLayer instance = new HostBusinessLayer();
        Host expResult = null;
        Host result = instance.getHostByEmail(email);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteHost method, of class HostBusinessLayer.
     */
    @Test
    public void testDeleteHost() {
        System.out.println("deleteHost");
        int hostId = 0;
        HostBusinessLayer instance = new HostBusinessLayer();
        instance.deleteHost(hostId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateHost method, of class HostBusinessLayer.
     */
    @Test
    public void testUpdateHost_12args() {
        System.out.println("updateHost");
        String email = "";
        String passWord = "";
        String firstName = "";
        String lastName = "";
        String phone = "";
        int gender = 0;
        String dateBirth = "";
        Boolean retired = null;
        Boolean pets = null;
        Boolean smoker = null;
        String referralSource = "";
        int hostId = 0;
        HostBusinessLayer instance = new HostBusinessLayer();
        instance.updateHost(email, passWord, firstName, lastName, phone, gender, dateBirth, retired, pets, smoker, referralSource, hostId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateHost method, of class HostBusinessLayer.
     */
    @Test
    public void testUpdateHost_10args() {
        System.out.println("updateHost");
        String firstName = "";
        String lastName = "";
        String phone = "";
        int gender = 0;
        String dateBirth = "";
        Boolean retired = null;
        Boolean pets = null;
        Boolean smoker = null;
        String referralSource = "";
        int hostId = 0;
        HostBusinessLayer instance = new HostBusinessLayer();
        instance.updateHost(firstName, lastName, phone, gender, dateBirth, retired, pets, smoker, referralSource, hostId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateHost method, of class HostBusinessLayer.
     */
    @Test
    public void testUpdateHost_String_int() {
        System.out.println("updateHost");
        String passWord = "";
        int hostId = 0;
        HostBusinessLayer instance = new HostBusinessLayer();
        instance.updateHost(passWord, hostId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of passwordCorrect method, of class HostBusinessLayer.
     */
    @Test
    public void testPasswordCorrect() {
        System.out.println("passwordCorrect");
        String email = "";
        String password = "";
        HostBusinessLayer instance = new HostBusinessLayer();
        boolean expResult = false;
        boolean result = instance.passwordCorrect(email, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}