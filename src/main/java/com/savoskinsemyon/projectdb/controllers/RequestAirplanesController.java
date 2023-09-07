package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableView;
import javafx.stage.Stage;

import java.time.LocalDate;
import java.util.ArrayList;

public class RequestAirplanesController {
    public DatePicker data_start_insp;
    public Button button_request_international;
    public DatePicker data_end_insp;
    public TableView table_requests_airplanes_page;
    public Button back_button_requests_airplanes_page;
    public Button button_request_all_airplanes;
    public Button button_request_num_flights;
    @FXML
    private void initialize () {

        Navigation.fillTable(table_requests_airplanes_page, "all_airplanes", null);

        data_start_insp.setPromptText("Выберите дату");
        data_end_insp.setPromptText("Выберите дату");

        button_request_international.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            LocalDate data_start = data_start_insp.getValue();
            LocalDate data_end = data_end_insp.getValue();
            if (data_start != null && !data_start.toString().isEmpty() && data_end != null && !data_end.toString().isEmpty()){
                variables.add(data_start.toString());
                variables.add(data_end.toString());
                table_requests_airplanes_page.getColumns().clear();
                Navigation.fillTable(table_requests_airplanes_page, "airplane_inspection", variables);
            }
        });

        button_request_num_flights.setOnAction(actionEvent -> {
            table_requests_airplanes_page.getColumns().clear();
            Navigation.fillTable(table_requests_airplanes_page, "num_flights_plane", null);
        });

        back_button_requests_airplanes_page.setOnAction(event -> {
            Stage stage = (Stage) back_button_requests_airplanes_page.getScene().getWindow();
            Navigation.navigateBack(stage);
        });

        button_request_all_airplanes.setOnAction(actionEvent -> {
            table_requests_airplanes_page.getColumns().clear();
            Navigation.fillTable(table_requests_airplanes_page, "all_airplanes", null);
        });


    }

}

