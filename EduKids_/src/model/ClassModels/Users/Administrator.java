/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.ClassModels.Users;

/**
 *
 * @author Gilberto Gaspar
 */
public class Administrator extends Liable{
    
    public boolean removeUser(User user){
        return true;
    }
    
    public User addUser(User user){
        return user;
    }
}
