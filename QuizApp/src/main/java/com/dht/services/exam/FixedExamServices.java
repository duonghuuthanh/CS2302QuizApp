/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.services.exam;

import com.dht.pojo.Question;
import com.dht.services.question.BaseQuestionServices;
import com.dht.services.question.LevelQuestionServicesDecorator;
import com.dht.services.question.LimitQuestionServicesDecorator;
import com.dht.utils.Configs;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class FixedExamServices extends BaseExamServices {
    

    @Override
    public List<Question> getQuestions() throws SQLException {
        double[] rates = {0.4, 0.4, 0.2};
        
        List<Question> questions = new ArrayList<>();
        
        for (int i = 0; i < rates.length; i++) {
            BaseQuestionServices s = new LimitQuestionServicesDecorator(
                    new LevelQuestionServicesDecorator(Configs.questionService, i + 1), 
                    (int)(rates[i]*Configs.NUM_OF_QUESTIONS));
            questions.addAll(s.list());
        }
        
        return questions;
    }
}
