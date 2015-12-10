/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.ClassModels.Users;

import java.util.Date;
import model.ClassModels.GroupIncident;
import model.Util.Register;

/**
 *
 * @author Gilberto Gaspar
 */
public abstract class User implements SystemAccess{
    private String name;
    private String address;
    private Date birthDate;
    private String email;
    private String[] phoneNumber;
    private String password;
    private int[] indexUser;
    private Register regiterClass;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String[] getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String[] phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int[] getIndexUser() {
        return indexUser;
    }

    public void setIndexUser(int[] indexUser) {
        this.indexUser = indexUser;
    }

    public Register getRegiterClass() {
        return regiterClass;
    }

    public void setRegiterClass(Register regiterClass) {
        this.regiterClass = regiterClass;
    }
    
    public abstract void viewRecordsOf(Register register) throws Exception;
    
    public abstract void viewDetailsRecordOf(Register registerForviewDetails) throws Exception;
    
    public abstract void viewPoints(Register register) throws Exception;
    
}
