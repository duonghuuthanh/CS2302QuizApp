/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package com.dht.quizapp;

import com.dht.pojo.Choice;
import com.dht.pojo.Question;
import com.dht.services.exam.BaseExamServices;
import com.dht.services.exam.ExamTypes;
import com.dht.services.exam.FixedExamServices;
import com.dht.services.exam.SpecificExamService;
import com.dht.utils.MyAlert;
import java.net.URL;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

/**
 * FXML Controller class
 *
 * @author admin
 */
public class ExamController implements Initializable {

    @FXML
    private ComboBox<ExamTypes> cbTypes;
    @FXML
    private ListView<Question> lvQuestions;
    @FXML
    private TextField txtNum;

    private BaseExamServices exService;
    private List<Question> questions;
    private Map<Integer, Choice> results;

    /**
     * Initializes the controller class.
     *
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        this.txtNum.setVisible(false);

        this.cbTypes.getSelectionModel().selectedItemProperty().addListener(e -> {
            if (this.cbTypes.getSelectionModel().getSelectedItem() == ExamTypes.SPECIFIC) {
                this.txtNum.setVisible(true);
            } else {
                this.txtNum.setVisible(false);
            }
        });

        this.cbTypes.setItems(FXCollections.observableArrayList(ExamTypes.values()));
    }

    public void handleStart(ActionEvent event) throws SQLException {
        if (this.cbTypes.getSelectionModel().getSelectedItem() == ExamTypes.SPECIFIC)
            try {
            exService = new SpecificExamService(Integer.parseInt(this.txtNum.getText()));
        } catch (NumberFormatException ex) {
            MyAlert.getInstance().showMsg("Vui lòng nhập số câu hỏi hợp lệ!", Alert.AlertType.ERROR);
        } else {
            exService = new FixedExamServices();
        }

        this.results = new HashMap<>();

        this.questions = exService.getQuestions();

        this.lvQuestions.setItems(FXCollections.observableList(questions));

        this.lvQuestions.setCellFactory(param -> new ListCell<Question>() {
            @Override
            protected void updateItem(Question question, boolean empty) {
                super.updateItem(question, empty);

                if (question == null || empty == true) {
                    this.setGraphic(null);
                } else {
                    VBox v = new VBox(5);
                    v.setStyle("-fx-padding: 10; -fx-border-color: gray; -fx-border-width: 2;");

                    Text t = new Text(question.getContent());
                    v.getChildren().add(t);

                    ToggleGroup g = new ToggleGroup();
                    for (var c : question.getChoices()) {
                        RadioButton r = new RadioButton(c.getContent());
                        r.setToggleGroup(g);

                        // bổ sung
                        if (results.get(question.getId()) == c) {
                            r.setSelected(true);
                        }
                        // ...

                        r.setOnAction(e -> {
                            if (r.isSelected()) {
                                results.put(question.getId(), c);
                            }
                        });

                        v.getChildren().add(r);
                    }

                    this.setGraphic(v);
                }
            }

        });
    }

    public void handleFinish(ActionEvent event) {
        int count = 0;
        for (var c : this.results.values()) {
            if (c.isCorrect() == true) {
                count++;
            }
        }

        MyAlert.getInstance().showMsg(String.format("Bạn làm đúng %d/%d!", count,
                questions.size()), Alert.AlertType.INFORMATION);
    }

    public void handleSave(ActionEvent event) {
        if (questions == null || questions.isEmpty()) {
            MyAlert.getInstance().showMsg("Không có câu hỏi để lưu.", Alert.AlertType.WARNING);
        } else {
            Optional<ButtonType> type = MyAlert.getInstance().showMsg("Bạn chắc chắn lưu đề thi?", Alert.AlertType.CONFIRMATION);
            if (type.isPresent() && type.get().equals(ButtonType.OK)) {
                try {
                    exService.addExam(questions);
                    MyAlert.getInstance().showMsg("Lưu bài thi thành công!", Alert.AlertType.INFORMATION);
                } catch (SQLException ex) {
                    MyAlert.getInstance().showMsg("Hệ thống đã xảy ra lỗi, lý do: " + ex.getMessage(), Alert.AlertType.ERROR);
                }
            }
        }
    }
}
