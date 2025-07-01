/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package com.dht.quizapp;

import com.dht.pojo.Question;
import com.dht.utils.Configs;
import com.dht.utils.MyAlert;
import java.net.URL;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.List;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
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
        // TODO
    }

    public void start(ActionEvent event) throws SQLException {
        try {
            int num = Integer.parseInt(this.txtNum.getText());
            questions = Configs.questionService.getQuestions(num);

            this.currentIndex = 0;
            loadQuestion();
        } catch (InputMismatchException ex) {
            MyAlert.getInstance().showMsg("Số câu không hợp lệ!", Alert.AlertType.WARNING);
        }
    }

    public void check(ActionEvent event) {
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
