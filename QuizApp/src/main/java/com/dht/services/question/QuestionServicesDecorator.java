/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.services.question;

/**
 *
 * @author admin
 */
public abstract class QuestionServicesDecorator extends BaseQuestionServices {
    protected BaseQuestionServices decorator;

    public QuestionServicesDecorator(BaseQuestionServices decorator) {
        this.decorator = decorator;
    }
}
