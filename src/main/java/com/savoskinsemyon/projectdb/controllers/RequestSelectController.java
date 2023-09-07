package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import com.savoskinsemyon.projectdb.ProjectWindows;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class RequestSelectController {

    public Button passenger_button;
    public Button back_button_request_selection;
    public Button staff_button;
    public Button airplanes_button;
    public Button flights_button;

    @FXML
    private void initialize () {
        passenger_button.setOnAction(event -> {
            Stage stage = (Stage) passenger_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.REQUEST_PASSENGER_PAGE, stage);
        });
        staff_button.setOnAction(event -> {
            Stage stage = (Stage) staff_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.REQUEST_STAFF_PAGE, stage);
        });
        airplanes_button.setOnAction(event -> {
            Stage stage = (Stage) airplanes_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.REQUEST_AIRPLANE_PAGE, stage);
        });
        flights_button.setOnAction(event -> {
            Stage stage = (Stage) flights_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.REQUEST_FLIGHTS_PAGE, stage);
        });
        back_button_request_selection.setOnAction(event -> {
            Stage stage = (Stage) back_button_request_selection.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.START_PAGE, stage);
        });
    }
}
