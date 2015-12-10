/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.ClassModels.Users;

import model.ClassModels.Incident;

/**
 *
 * @author Gilberto Gaspar
 */
public class Liable extends User{
    
    public boolean addIncident(Incident incident, Children children){
        return true;
    }
    
}
