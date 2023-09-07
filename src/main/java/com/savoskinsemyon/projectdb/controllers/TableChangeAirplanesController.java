package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.text.Text;
import javafx.stage.Stage;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javafx.util.StringConverter;

public class TableChangeAirplanesController {

    public DatePicker date_airplane_start;
    public TextField number_seats_field;
    public TextField model_airplane_field;
    public Button back_button_airplanes;
    public TableView table_of_airplanes;
    public Button add_button_airplane;
    public Text error_message_text;

    @FXML
    private void initialize () {

        Navigation.fillTable(table_of_airplanes, "all_airplanes", null);

        date_airplane_start.setPromptText("Выберите дату");

        add_button_airplane.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            LocalDate start_data = date_airplane_start.getValue();
            String field2 = number_seats_field.getText();
            String field3 = model_airplane_field.getText();
            if (start_data != null && !start_data.toString().isEmpty() && field2 != null && field3 != null){
                variables.add(start_data.toString());
                variables.add(field2);
                variables.add(field3);
                error_message_text.setText("");
                try {
                    Navigation.addItemInTable("insert_airplanes", variables);
                    table_of_airplanes.getColumns().clear();
                    Navigation.fillTable(table_of_airplanes, "all_airplanes", null);
                } catch (SQLException e) {
                    error_message_text.setText(e.getMessage());
                }
            } else {
                error_message_text.setText("Поля не заполнены!");
            }
        });

        back_button_airplanes.setOnAction(event -> {
            Stage stage = (Stage) back_button_airplanes.getScene().getWindow();
            Navigation.navigateBack(stage);
        });
    }

}
