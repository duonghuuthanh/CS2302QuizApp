module com.dht.quizapp {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.base;
    requires java.sql;
    requires lombok;

    opens com.dht.quizapp to javafx.fxml;
    exports com.dht.quizapp;
    exports com.dht.pojo;
}
