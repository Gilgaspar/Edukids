/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Util.Exceptions;

/**
 *
 * @author Gilberto Gaspar
 */
public class RegisterException extends Exception{

    public RegisterException() {
        super("Registro inválido para esta classe.");
    }

    public RegisterException(String message) {
        super(message);
    }
}
