package edu.acc.j2ee.tofka.jpa;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "SIGNUPS")
@NamedQueries({
    @NamedQuery(name = "Signup.findAll", query = "SELECT s FROM Signup s ORDER BY s.joindate DESC"),
    @NamedQuery(name = "Signup.findByFirstName", query = "SELECT s FROM Signup s WHERE s.firstname = :firstname"),
    @NamedQuery(name = "Signup.findByLastName", query = "SELECT s FROM Signup s WHERE s.lastname = :lastname"),
    @NamedQuery(name = "Signup.findByPhoneNumber", query = "SELECT s FROM Signup s WHERE s.phonenumber = :phonenumber"),
    @NamedQuery(name = "Signup.findByEmailAddress", query = "SELECT s FROM Signup s WHERE s.emailaddress = :emailaddress"),
    @NamedQuery(name = "Signup.findByMedicalHistory", query = "SELECT s FROM Signup s WHERE s.medicalhistory = :medicalhistory"),
    @NamedQuery(name = "Signup.findByJoinDate", query = "SELECT s FROM Signup s WHERE s.joindate = :joindate"),
    @NamedQuery(name = "Signup.findById", query = "SELECT s FROM Signup s WHERE s.id = :id")})

public class Signup implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "FIRSTNAME")
    private String firstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "LASTNAME")
    private String lastname;
    @Size(min = 1, max = 10)
    @Column(name = "PHONENUMBER")
    private String phonenumber;
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")
    @Size(max = 50)
    @Column(name = "EMAILADDRESS")
    private String emailaddress;
    @Size(max = 1024)
    @Column(name = "MEDICALHISTORY")
    private String medicalhistory;
    @Column(name = "JOINDATE")
    @Temporal(TemporalType.DATE)
    private Date joindate = CurrentDate.now();
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    
    public Signup() {
    }
    
    public Signup(Integer id) {
        this.id = id;
    }
    
    public Signup(Integer id, String firstname) {
        this.id = id;
        this.firstname = firstname;
    }
            
    public String getFirstName() {
        return firstname;
    }
    
    public void setFirstName(String firstname) {
        this.firstname = firstname;
    }
    
    public String getLastName() {
        return lastname;
    }
    
    public void setLastName(String lastname) {
        this.lastname = lastname;
    }
    
    public String getPhoneNumber() {
        return phonenumber;
    }
    
    public void setPhoneNumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
    
    public String getEmailAddress() {
        return emailaddress;
    }
    
    public void setEmailAddress(String emailaddress) {
        this.emailaddress = emailaddress;
    }
    
    public String getMedicalHistory() {
        return medicalhistory;
    }
    
    public void setMedicalHistory(String medicalhistory) {
        this.medicalhistory = medicalhistory;
    }
    
    public Date getJoindate() {
        return joindate;
    }
    
    public void setJoindate(Date joindate) {
        this.joindate = joindate;
    }
    
    public Integer getId() {
    return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }
    
   @Override
   public boolean equals(Object object) {
       if (!(object instanceof Signup)) {
           return false;
       }
       Signup other = (Signup) object;
       if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
           return false;
       }
       return true;
   }
   
   @Override
   public String toString() {
       return String.format("%s (signedup %s)", firstname, joindate);
   }
}
