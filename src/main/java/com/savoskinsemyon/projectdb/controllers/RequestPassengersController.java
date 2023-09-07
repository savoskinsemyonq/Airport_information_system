package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.time.LocalDate;
import java.util.ArrayList;

public class RequestPassengersController {
    public DatePicker data_depature;
    public TableView table_requests_passengers_page;
    public Button back_button_requests_passengers_page;
    public Button button_request_international;
    public Button button_request_booked;
    public TextField field_flight_id;
    public Button button_request_all_passengers;

    @FXML
    private void initialize () {

        Navigation.fillTable(table_requests_passengers_page, "all_passengers", null);
        data_depature.setPromptText("Выберите дату, к примеру 2021-12-11");

        button_request_international.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            LocalDate data_dep = data_depature.getValue();
            if (data_dep != null && !data_dep.toString().isEmpty()){
                variables.add(data_dep.toString());
                table_requests_passengers_page.getColumns().clear();
                Navigation.fillTable(table_requests_passengers_page, "passenger_international", variables);
            }
        });

        button_request_booked.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = field_flight_id.getText();
            if (field1 != null && !field1.isEmpty()){
                variables.add(field1);
                table_requests_passengers_page.getColumns().clear();
                Navigation.fillTable(table_requests_passengers_page, "passenger_booked", variables);
            }
        });


        back_button_requests_passengers_page.setOnAction(event -> {
            Stage stage = (Stage) back_button_requests_passengers_page.getScene().getWindow();
            Navigation.navigateBack(stage);
        });
        button_request_all_passengers.setOnAction(actionEvent -> {
            table_requests_passengers_page.getColumns().clear();
            Navigation.fillTable(table_requests_passengers_page, "all_passengers", null);
        });


    }

}
