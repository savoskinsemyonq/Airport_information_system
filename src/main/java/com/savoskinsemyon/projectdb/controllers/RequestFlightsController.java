package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.util.ArrayList;

public class RequestFlightsController {
    public TextField field_place_arr;
    public TextField field_model_airplane;
    public TableView table_requests_flights_page;
    public Button back_button_requests_flights_page;
    public Button button_request_local_flights;
    public Button button_request_delayed_flights;
    public TextField field_dep;
    public Button button_request_avg_price;
    public TextField field_avg_price;
    public Button button_request_all_flights;

    @FXML
    private void initialize () {

        Navigation.fillTable(table_requests_flights_page, "all_flights", null);
        field_model_airplane.setPromptText("Airbus_A220");
        button_request_local_flights.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = field_place_arr.getText();
            String field2 = field_model_airplane.getText();
            if (field1 != null && !field1.isEmpty() && field2 != null && !field2.isEmpty()){
                variables.add(field1);
                variables.add(field2);
                table_requests_flights_page.getColumns().clear();
                Navigation.fillTable(table_requests_flights_page, "flights_type", variables);
            }
        });

        button_request_delayed_flights.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = field_dep.getText();
            if (field1 != null && !field1.isEmpty()){
                variables.add(field1);
                table_requests_flights_page.getColumns().clear();
                Navigation.fillTable(table_requests_flights_page, "flights_canceled", variables);
            }
        });
        button_request_avg_price.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = field_avg_price.getText();
            if (field1 != null && !field1.isEmpty()){
                variables.add(field1);
                table_requests_flights_page.getColumns().clear();
                Navigation.fillTable(table_requests_flights_page, "flights_baggage", variables);
            }
        });


        back_button_requests_flights_page.setOnAction(event -> {
            Stage stage = (Stage) back_button_requests_flights_page.getScene().getWindow();
            Navigation.navigateBack(stage);
        });
        button_request_all_flights.setOnAction(actionEvent -> {
            table_requests_flights_page.getColumns().clear();
            Navigation.fillTable(table_requests_flights_page, "all_flights", null);
        });


    }
}
