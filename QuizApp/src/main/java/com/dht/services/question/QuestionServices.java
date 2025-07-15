/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.services.question;

import java.util.List;

/**
 *
 * @author admin
 */
public class QuestionServices extends BaseQuestionServices {
    @Override
    public String getSQL(List<Object> params) {
        return "SELECT * FROM question WHERE 1=1";
    }
}
