/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package com.dht.quizapp;

import com.dht.pojo.Category;
import com.dht.pojo.Level;
import com.dht.pojo.Question;
import com.dht.services.FlyweightFactory;
import com.dht.services.question.BaseQuestionServices;
import com.dht.services.question.CategoryQuestionServicesDecorator;
import com.dht.services.question.LevelQuestionServicesDecorator;
import com.dht.services.question.LimitQuestionServicesDecorator;
import com.dht.utils.Configs;
import com.dht.utils.MyAlert;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.ComboBox;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

/**
 * FXML Controller class
 *
 * @author admin
 */
public class PracticeController implements Initializable {

    @FXML
    private TextField txtNum;
    @FXML
    private Text txtContent;
    @FXML
    private VBox vboxChoices;
    @FXML
    private Text txtResult;
    @FXML
    ComboBox<Category> cbCates;
    @FXML
    ComboBox<Level> cbLevels;

    private List<Question> questions;
    private int currentIndex = 0;

    /**
     * Initializes the controller class.
     *
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

        try {
            this.cbCates.setItems(FXCollections.observableList(FlyweightFactory.getData(Configs.cateService, "categories")));
            this.cbLevels.setItems(FXCollections.observableList(FlyweightFactory.getData(Configs.levelService, "levels")));
        } catch (SQLException ex) {
            Logger.getLogger(PracticeController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

    }

    public void start(ActionEvent event) throws SQLException {
        if (this.txtNum.getText() == null || this.txtNum.getText().isEmpty()) {
            MyAlert.getInstance().showMsg("Vui lòng nhập số câu hỏi!", Alert.AlertType.ERROR);
            return;
        }
        try {
            int num = Integer.parseInt(this.txtNum.getText());

            BaseQuestionServices s = Configs.questionService;
            Category c = this.cbCates.getSelectionModel().getSelectedItem();
            if (c != null) {
                s = new CategoryQuestionServicesDecorator(s, c);
            }

            Level lvl = this.cbLevels.getSelectionModel().getSelectedItem();
            if (lvl != null) {
                s = new LevelQuestionServicesDecorator(s, lvl);
            }

            s = new LimitQuestionServicesDecorator(s, num);
            questions = s.list();

            if (!questions.isEmpty()) {
                this.currentIndex = 0;
                loadQuestion();
            } else {
                MyAlert.getInstance().showMsg("Không có câu hỏi phù hợp!", Alert.AlertType.WARNING);
            }
        } catch (NumberFormatException ex) {
            MyAlert.getInstance().showMsg("Số câu không hợp lệ!", Alert.AlertType.WARNING);
        }
    }

    public void check(ActionEvent event) {
        if (this.currentIndex >= 0) {
            this.txtResult.getStyleClass().clear();

            Question q = this.questions.get(this.currentIndex);
            for (int i = 0; i < q.getChoices().size(); i++) {
                if (q.getChoices().get(i).isCorrect()) {
                    HBox h = (HBox) vboxChoices.getChildren().get(i);
                    h.getStyleClass().add("Space");
                    if (((RadioButton) h.getChildren().get(0)).isSelected()) {
                        this.txtResult.setText("Congratulation, exactly!");
                        this.txtResult.getStyleClass().add("Correct");
                    } else {
                        this.txtResult.setText("So sorry, wrongly!");
                        this.txtResult.getStyleClass().add("Wrong");
                    }

                    break;
                }
            }
        }
    }

    public void next(ActionEvent event) {
        if (this.currentIndex < this.questions.size() - 1) {
            this.txtResult.setText("");
            this.currentIndex++;
            loadQuestion();
        }
    }

    private void loadQuestion() {
        Question q = this.questions.get(this.currentIndex);
        this.txtContent.setText(q.getContent());

        vboxChoices.getChildren().clear();
        ToggleGroup group = new ToggleGroup();
        for (var c : q.getChoices()) {
            HBox h = new HBox();

            RadioButton rdo = new RadioButton();
            rdo.setToggleGroup(group);

            Text txt = new Text(c.getContent());
            txt.getStyleClass().add("Normal");

            h.getChildren().addAll(rdo, txt);

            this.vboxChoices.getChildren().add(h);
        }
    }
}
