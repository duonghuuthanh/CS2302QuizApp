/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package com.dht.quizapp;

import com.dht.pojo.Category;
import com.dht.pojo.Choice;
import com.dht.pojo.Level;
import com.dht.pojo.Question;
import com.dht.services.CategoryServices;
import com.dht.services.FlyweightFactory;
import com.dht.services.LevelServices;
import com.dht.services.question.BaseQuestionServices;
import com.dht.services.question.CategoryQuestionServicesDecorator;
import com.dht.services.question.KeywordQuestionServicesDecorator;
import com.dht.services.question.LevelQuestionServicesDecorator;
import com.dht.services.question.QuestionServices;
import com.dht.services.question.QuestionServicesDecorator;
import com.dht.utils.Configs;
import com.dht.utils.MyAlert;
import java.net.URL;
import java.sql.SQLException;
import java.util.Optional;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

/**
 * FXML Controller class
 *
 * @author admin
 */
public class QuestionsController implements Initializable {

    @FXML
    private VBox vboxChoices;
    @FXML
    private ComboBox<Category> cbCates;
    @FXML
    private ComboBox<Category> cbSearchCates;
    @FXML
    private ComboBox<Level> cbLevels;
    @FXML
    private ComboBox<Level> cbSearchLevels;
    @FXML
    private TextArea txtContent;
    @FXML
    private ToggleGroup toggleChoice = new ToggleGroup();
    @FXML
    private TableView<Question> tbQuestions;
    @FXML
    private TextField txtSearch;


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
            this.cbSearchCates.setItems(FXCollections.observableList(FlyweightFactory.getData(Configs.cateService, "categories")));
            this.cbSearchLevels.setItems(FXCollections.observableList(FlyweightFactory.getData(Configs.levelService, "levels")));

            this.loadColumns();
            this.tbQuestions.setItems(FXCollections.observableList(Configs.questionService.list()));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        this.txtSearch.textProperty().addListener((e) -> {
            try {
                BaseQuestionServices s = new KeywordQuestionServicesDecorator(Configs.questionService, this.txtSearch.getText());
                this.tbQuestions.setItems(FXCollections.observableList(s.list()));
            } catch (SQLException ex) {
                Logger.getLogger(QuestionsController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        });
        
        this.cbSearchCates.getSelectionModel().selectedItemProperty().addListener(e -> {
        try {
                BaseQuestionServices s = new CategoryQuestionServicesDecorator(Configs.questionService, this.cbSearchCates.getSelectionModel().getSelectedItem());
                this.tbQuestions.setItems(FXCollections.observableList(s.list()));
            } catch (SQLException ex) {
                Logger.getLogger(QuestionsController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        });
        
        this.cbSearchLevels.getSelectionModel().selectedItemProperty().addListener(e -> {
        try {
                BaseQuestionServices s = new LevelQuestionServicesDecorator(Configs.questionService, this.cbSearchLevels.getSelectionModel().getSelectedItem());
                this.tbQuestions.setItems(FXCollections.observableList(s.list()));
            } catch (SQLException ex) {
                Logger.getLogger(QuestionsController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        });
    }

    public void handleMoreChoice(ActionEvent event) {
        HBox h = new HBox();
        h.getStyleClass().add("Main");

        RadioButton r = new RadioButton();
        r.setToggleGroup(toggleChoice);

        TextField txt = new TextField();
        txt.getStyleClass().add("Input");

        h.getChildren().addAll(r, txt);

        this.vboxChoices.getChildren().add(h);
    }

    public void handleQuestion(ActionEvent event) {
        try {
            Question.Builder b = new Question.Builder(this.txtContent.getText(),
                    this.cbCates.getSelectionModel().getSelectedItem(),
                    this.cbLevels.getSelectionModel().getSelectedItem());

            for (var c : vboxChoices.getChildren()) {
                HBox h = (HBox) c;
                Choice choice = new Choice(((TextField) h.getChildren().get(1)).getText(),
                        ((RadioButton) h.getChildren().get(0)).isSelected());

                b.addChoice(choice);
            }

            Question q = b.build();
            Configs.uQService.addQuestion(q);
            this.tbQuestions.getItems().add(0, q);
            MyAlert.getInstance().showMsg("Thêm câu hỏi thành công!");
        } catch (SQLException ex) {
            MyAlert.getInstance().showMsg("Thêm câu hỏi thất bại!");
        } catch (Exception ex) {
            MyAlert.getInstance().showMsg("Dữ liệu không hợp lệ!");
        }
    }

    private void loadColumns() {
        TableColumn colId = new TableColumn("Id");
        colId.setCellValueFactory(new PropertyValueFactory("id"));
        colId.setPrefWidth(100);

        TableColumn colContent = new TableColumn("Content");
        colContent.setCellValueFactory(new PropertyValueFactory("content"));
        colContent.setPrefWidth(300);

        TableColumn colAction = new TableColumn();
        colAction.setCellFactory((col) -> {
            TableCell cell = new TableCell();

            Button btn = new Button("Xóa");

            btn.setOnAction(event -> {
                Optional<ButtonType> type = MyAlert.getInstance().showMsg(
                        "Nếu xóa câu hỏi thì các lựa chọn cũng sẽ bị xóa theo. Bạn chắc chắn không?", Alert.AlertType.CONFIRMATION);
                if (type.isPresent() && type.get().equals(ButtonType.OK)) {
                    Question q = (Question)cell.getTableRow().getItem();
                    try {
                        
                        if (Configs.uQService.deleteQuestion(q.getId()) == true) {
                            this.tbQuestions.getItems().remove(q);
                            MyAlert.getInstance().showMsg("Xóa thành công!");
                        } else
                            MyAlert.getInstance().showMsg("Xóa thất bại!");
                    } catch (SQLException ex) {
                        Logger.getLogger(QuestionsController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
                    }
                }
            });

            cell.setGraphic(btn);
//            
            return cell;
        });

        this.tbQuestions.getColumns().addAll(colId, colContent, colAction);
    }
}
