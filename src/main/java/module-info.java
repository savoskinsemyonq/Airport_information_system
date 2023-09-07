module com.savoskinsemyon.projectdb {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.savoskinsemyon.projectdb to javafx.fxml;
    exports com.savoskinsemyon.projectdb;
    exports com.savoskinsemyon.projectdb.controllers;
    opens com.savoskinsemyon.projectdb.controllers to javafx.fxml;
}