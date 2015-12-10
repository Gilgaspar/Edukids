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
public interface SystemAccess {
    
    /**
     *
     * @param user
     * @return boolean, case the user logoff normally.
     * @throws Exception
     */
    boolean logoffSystem(User user) throws Exception;
    
    /**
     *
     * @param user
     * @return
     * @throws Exception
     */
    boolean cadastrateFirstUser(Administrator user) throws Exception;
    
    /**
     *
     * @param user
     * @return
     * @throws Exception
     */
    boolean loginSystem(User user) throws Exception;
    
}
