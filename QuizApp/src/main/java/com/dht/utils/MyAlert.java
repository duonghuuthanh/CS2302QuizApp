/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.utils;

import javafx.scene.control.Alert;

/**
 *
 * @author admin
 */
public class MyAlert {
    private static MyAlert instance;
    private final Alert alert;
    
    private MyAlert() {
        alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setHeaderText("Quiz App");
    }
    
    public static MyAlert getInstance() {
        if (instance == null)
            instance = new MyAlert();
        
        return instance;
    }
    
    public void showMsg(String msg) {
        this.alert.setContentText(msg);
        this.alert.showAndWait();
    }
}
