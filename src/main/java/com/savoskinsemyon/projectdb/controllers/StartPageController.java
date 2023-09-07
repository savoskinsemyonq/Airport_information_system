package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import com.savoskinsemyon.projectdb.ProjectWindows;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class StartPageController {
    @FXML
    private Button requests_button;
    @FXML
    private Button change_tables_button;


    @FXML
    private void initialize () {
        requests_button.setOnAction(event -> {
            Stage stage = (Stage) requests_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.REQUEST_SELECTION_PAGE, stage);
        });

        change_tables_button.setOnAction(event -> {
            Stage stage = (Stage) change_tables_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.TABLE_SELECTION_PAGE, stage);
        });
    }
}