/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.utils;

import com.dht.services.CategoryServices;
import com.dht.services.LevelServices;
import com.dht.services.question.QuestionServices;
import com.dht.services.UpdateQuestionServices;
import com.dht.services.question.BaseQuestionServices;

/**
 *
 * @author admin
 */
public class Configs {
    public static final CategoryServices cateService = new CategoryServices();
    public static final LevelServices levelService = new LevelServices();
    public static BaseQuestionServices questionService = new QuestionServices();
    public static UpdateQuestionServices uQService = new UpdateQuestionServices();
}
