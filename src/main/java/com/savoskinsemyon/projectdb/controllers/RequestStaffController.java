package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.util.ArrayList;

public class RequestStaffController {
    public TableView table_requests_staff_page;
    public Button back_button_requests_staff_page;
    public TextField field_gender_staff;
    public TextField field_number_children_staff;
    public Button button_request_dispatchers;
    public Button button_request_brigade;
    public TextField field_brigade_staff;
    public Button button_request_pilots;
    public Button button_request_all_staff;

    @FXML
    private void initialize () {

        Navigation.fillTable(table_requests_staff_page, "all_staff", null);

        button_request_dispatchers.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = field_gender_staff.getText();
            String field2 = field_number_children_staff.getText();
            if (field1 != null && !field1.isEmpty() && field2 != null && !field2.isEmpty()){
                variables.add(field1);
                variables.add(field2);
                table_requests_staff_page.getColumns().clear();
                Navigation.fillTable(table_requests_staff_page, "dispatchers", variables);
            }
        });

        button_request_brigade.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = field_brigade_staff.getText();
            if (field1 != null && !field1.isEmpty()){
                variables.add(field1);
                table_requests_staff_page.getColumns().clear();
                Navigation.fillTable(table_requests_staff_page, "staff_brigade", variables);
            }
        });

        button_request_pilots.setOnAction(actionEvent -> {
            table_requests_staff_page.getColumns().clear();
            Navigation.fillTable(table_requests_staff_page, "pilots", null);
        });

        back_button_requests_staff_page.setOnAction(event -> {
            Stage stage = (Stage) back_button_requests_staff_page.getScene().getWindow();
            Navigation.navigateBack(stage);
        });
        button_request_all_staff.setOnAction(actionEvent -> {
            table_requests_staff_page.getColumns().clear();
            Navigation.fillTable(table_requests_staff_page, "all_staff", null);
        });


    }
}


