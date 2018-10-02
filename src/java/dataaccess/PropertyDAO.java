/*
 * File: PropertyDAO.java
 * Description:
 * Create: Sep,30,2018
 * Author: Bits & Bytes Team-Christopher Labelle,Liangliang Du,Melissa Rajala,Zhan Shen,Xia Sheng,Bin Yang
 * Clients: Michelle Bilek,Farheen Khan
 * Course: Software Development Project
 * Professor: Dr. Anu Thomas
 * Project: A Home to Share
 * Copyright @ 2018
 */
package dataaccess;
import java.sql.Date;
import java.util.List;
import transferobjects.Property;
/**
 *
 * @author Xia Sheng
 */
public interface PropertyDAO {
    List<Property> getAllProperty();
    void addProperty(Property property);
    Property getPropertyByPropertyId(int propertyId);  
    void deleteProperty(int propertyId);
    void updateProperty(int hostId, String address, String city, String postalCode, String province,String country,int famMembers,Boolean isSmokerFriendly, Boolean isPetFriendly,double price,Date startDate,Date endDate,String chores,int availability,int propertyId);
}