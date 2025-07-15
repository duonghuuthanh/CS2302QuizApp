/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.services.exam;

import com.dht.pojo.Question;
import com.dht.services.question.BaseQuestionServices;
import com.dht.services.question.LimitQuestionServicesDecorator;
import com.dht.utils.Configs;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public class SpecificExamService extends BaseExamServices {
    private final int num;

    public SpecificExamService(int num) {
        this.num = num;
    }

    @Override
    public List<Question> getQuestions() throws SQLException {
        BaseQuestionServices s = new LimitQuestionServicesDecorator(Configs.questionService, num);
        return s.list();
    }
}
