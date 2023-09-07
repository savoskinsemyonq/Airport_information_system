package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import com.savoskinsemyon.projectdb.ProjectWindows;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class TableSelectionController {
    public Button back_button_table_selection;
    public Button place_button;
    public Button airplane_button;


    @FXML
    private void initialize () {
        place_button.setOnAction(event -> {
            Stage stage = (Stage) place_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.TABLE_CHANGE_PLACE_PAGE, stage);
        });

        airplane_button.setOnAction(event -> {
            Stage stage = (Stage) airplane_button.getScene().getWindow();
            Navigation.navigateTo(ProjectWindows.TABLE_CHANGE_AIRPLANE_PAGE, stage);
        });

        back_button_table_selection.setOnAction(event -> {
            Stage stage = (Stage) back_button_table_selection.getScene().getWindow();
            Navigation.navigateBack(stage);
        });
    }
}
