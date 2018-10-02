/*
 * File: RenterDAOImpl.java
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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import transferobjects.Renter;
/**
 *
 * @author Xia Sheng
 */
public class RenterDAOImpl implements RenterDAO {
    private static final String GET_ALL_RENTER = "SELECT"
            +"id,email, password, "
            +"first_name, last_name,phone, gender, date_of_birth, student, "
            +"employed, smoker, rent_start_date, rent_end_date,availability, "
            +"low_price, high_price, referral_source,criminality_check "
            +"FROM renter ORDER BY id";
    
    private static final String INSERT_RENTER = "INSERT INTO renter ("
            +"id,email, password, "
            +"first_name, last_name,phone, gender, date_of_birth, student, "
            +"employed, smoker, rent_start_date, rent_end_date,availability, "
            +"low_price, high_price, referral_source,criminality_check "
            +") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String GET_BY_RENTER_ID = "SELECT"
            +"id,email, password, "
            +"first_name, last_name,phone, gender, date_of_birth, student, "
            +"employed, smoker, rent_start_date, rent_end_date,availability, "
            +"low_price, high_price, referral_source,criminality_check "
            +"FROM renter WHERE id = ?";
    private static final String DELETE_RENTER= "DELETE FROM renter WHERE id = ?";
    private static final String UPDATE_RENTER = "UPDATE renter SET "
            +"id = ?,email = ?, password= ?, "
            +"first_name= ?, last_name= ?,phone= ?, gender= ?, date_of_birth= ?, student= ?, "
            +"employed= ?, smoker= ?, rent_start_date= ?, rent_end_date= ?,availability= ?, "
            +"low_price= ?, high_price= ?, referral_source= ?,criminality_check = ?"
                    +"WHERE id= ?";
    
   @Override
    public List<Renter> getAllRenter(){
        List<Renter> renters = Collections.EMPTY_LIST;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try{
            DataSource ds = new DataSource();
            con = ds.createConnection();
            pstmt = con.prepareStatement(GET_ALL_RENTER);
            rs = pstmt.executeQuery();
            renters = new ArrayList<>(400);
            while(rs.next()){
                Renter renter = new Renter();
                renter.setRenterId(rs.getInt("id"));
                renter.setEmail(rs.getString("email"));
                renter.setPassWord(rs.getString("password"));
                renter.setFirstName(rs.getString("first_name"));
                renter.setLastName(rs.getString("last_name"));
                renter.setPhone(rs.getString("phone"));
                renter.setGender(rs.getInt("gender"));
                renter.setDOB(rs.getDate("date_of_birth"));
                renter.setIsStudent(rs.getBoolean("student"));
                renter.setIsEmployed(rs.getBoolean("employed"));   
                renter.setIsSmoker(rs.getBoolean("smoker"));
                renter.setStartDate(rs.getDate("rent_start_date"));
                renter.setEndDate(rs.getDate("rent_end_date"));
                renter.setAvailability(rs.getInt("availability"));
                renter.setLowPrice(rs.getInt("low_price"));
                renter.setLowPrice(rs.getInt("high_price")); 
                renter.setReferralSource(rs.getString("referral_source"));
                renter.setHasCRCheck(rs.getBoolean("criminality_check"));
                renters.add(renter);
            }
        }catch(SQLException ex){
            Logger.getLogger(RenterDAOImpl.class.getName()).log(Level.SEVERE,null,ex);
        }finally{
            try{
            if(rs !=null){
                rs.close();
            }
          }catch(SQLException ex){
                    System.out.println(ex.getMessage());
          }
            try{
                if(pstmt !=null){
                    pstmt.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
            try{
                if(con !=null){
                    con.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }         
        }
        return renters;
    }
    @Override
    public void addRenter(Renter renter){
        try{
            Connection con=new DataSource().createConnection();
            PreparedStatement pstmt = con.prepareStatement(INSERT_RENTER);
            pstmt.setInt(1,renter.getRenterID());
            pstmt.setString(2,renter.getEmail());
            pstmt.setString(3,renter.getPassWord());           
            pstmt.setString(4,renter.getFirstName());
            pstmt.setString(5,renter.getLastName());
            pstmt.setString(6,renter.getPhone());
            pstmt.setInt(7,renter.getGender());
            pstmt.setDate(8,renter.getDateBirth());
            pstmt.setBoolean(9,renter.getIsStudent());
            pstmt.setBoolean(10,renter.getIsEmployed());
            pstmt.setBoolean(11,renter.getIsSmoker());
            pstmt.setDate(12,renter.getStartDate());
            pstmt.setDate(13,renter.getEndDate());
            pstmt.setInt(14,renter.getAvailability());
            pstmt.setDouble(15,renter.getLowPrice());
            pstmt.setDouble(16,renter.getHighPrice());
            pstmt.setString(17,renter.getReferralSource());
            pstmt.setBoolean(18,renter.getHasCRCheck());
            pstmt.executeUpdate();         
        }catch(SQLException ex){
            Logger.getLogger(RenterDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public Renter getRenterByRenterId(int renterId){
      //List<Student> students = Collections.EMPTY_LIST;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Renter renter = new Renter();
        try{
            DataSource ds = new DataSource();
            con = ds.createConnection();
            pstmt = con.prepareStatement(GET_BY_RENTER_ID);
            pstmt.setInt(1, renterId);
            //pstmt.executeUpdate();
           
            rs = pstmt.executeQuery();
            //students = new ArrayList<>(400);
            if(rs.next()){              
                renter.setRenterId(rs.getInt("id"));
                renter.setEmail(rs.getString("email"));
                renter.setPassWord(rs.getString("password"));
                renter.setFirstName(rs.getString("first_name"));
                renter.setLastName(rs.getString("last_name"));
                renter.setPhone(rs.getString("phone"));
                renter.setGender(rs.getInt("gender"));
                renter.setDOB(rs.getDate("date_of_birth"));
                renter.setIsStudent(rs.getBoolean("student"));
                renter.setIsEmployed(rs.getBoolean("employed"));   
                renter.setIsSmoker(rs.getBoolean("smoker"));
                renter.setStartDate(rs.getDate("rent_start_date"));
                renter.setEndDate(rs.getDate("rent_end_date"));
                renter.setAvailability(rs.getInt("availability"));
                renter.setLowPrice(rs.getInt("low_price"));
                renter.setLowPrice(rs.getInt("high_price")); 
                renter.setReferralSource(rs.getString("referral_source"));
                renter.setHasCRCheck(rs.getBoolean("criminality_check"));
                
            } 
        }catch(SQLException ex){
            Logger.getLogger(RenterDAOImpl.class.getName()).log(Level.SEVERE,null,ex);
        }finally{
            try{
            if(rs !=null){
                rs.close();
            }
          }catch(SQLException ex){
                    System.out.println(ex.getMessage());
          }
            try{
                if(pstmt !=null){
                    pstmt.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
            try{
                if(con !=null){
                    con.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }         
        }
        return renter;
    }
    
    @Override
     public void deleteRenter(int renterId){
         
         Connection con = null;
        PreparedStatement pstmt = null;
      
        try{
            DataSource ds = new DataSource();
            con = ds.createConnection();
            pstmt = con.prepareStatement(DELETE_RENTER);
            pstmt.setInt(1, renterId);
            pstmt.executeUpdate();
           
        }catch(SQLException ex){
            Logger.getLogger(RenterDAOImpl.class.getName()).log(Level.SEVERE,null,ex);
        }finally{
           
            try{
                if(pstmt !=null){
                    pstmt.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
            try{
                if(con !=null){
                    con.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }         
        }    
     }
     
      public void updateRenter(int renterId, String email, String passWord, String firstName, String lastName,String phone,int gender,Date dateBirth, Boolean isStudent,Boolean isEmployed,Boolean isSmoker,Date startDate,Date endDate,int availability, double lowPrice, double highPrice,String referralSource,Boolean hasCRCheck){
            Connection con = null;
        PreparedStatement pstmt = null;
      
        try{
            DataSource ds = new DataSource();
            con = ds.createConnection();
            pstmt = con.prepareStatement(UPDATE_RENTER);
            pstmt.setInt(1,renterId);
            pstmt.setString(2,email);
            pstmt.setString(3,passWord);           
            pstmt.setString(4,firstName);
            pstmt.setString(5,lastName);
            pstmt.setString(6,phone);
            pstmt.setInt(7,gender);
            pstmt.setDate(8,dateBirth);
            pstmt.setBoolean(9,isStudent);
            pstmt.setBoolean(10,isEmployed);
            pstmt.setBoolean(11,isSmoker);
            pstmt.setDate(12,startDate);
            pstmt.setDate(13,endDate);
            pstmt.setInt(14,availability);
            pstmt.setDouble(15,lowPrice);
            pstmt.setDouble(16,highPrice);
            pstmt.setString(17,referralSource);
            pstmt.setBoolean(18,hasCRCheck);
            
            
            pstmt.executeUpdate();
           
        }catch(SQLException ex){
            Logger.getLogger(RenterDAOImpl.class.getName()).log(Level.SEVERE,null,ex);
        }finally{
           
            try{
                if(pstmt !=null){
                    pstmt.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
            try{
                if(con !=null){
                    con.close();
                }
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }         
        }
        
      }
    
}
 