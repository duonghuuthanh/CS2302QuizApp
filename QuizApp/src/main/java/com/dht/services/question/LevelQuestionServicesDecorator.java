/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.services.question;

import com.dht.pojo.Level;
import java.util.List;

/**
 *
 * @author admin
 */
public class LevelQuestionServicesDecorator extends QuestionServicesDecorator  {
    private Level level;

    public LevelQuestionServicesDecorator(BaseQuestionServices decorator, Level level) {
        super(decorator);
        this.level = level;
    }
    
    public LevelQuestionServicesDecorator(BaseQuestionServices decorator, int levelId) {
        super(decorator);
        this.level = new Level(levelId);
    }

    @Override
    public String getSQL(List<Object> params) {
        String sql = this.decorator.getSQL(params) + " AND level_id=?";
        params.add(this.level.getId());

        return sql;
    }
    
}
