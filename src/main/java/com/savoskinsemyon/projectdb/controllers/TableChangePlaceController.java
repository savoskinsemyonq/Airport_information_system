package com.savoskinsemyon.projectdb.controllers;

import com.savoskinsemyon.projectdb.Navigation;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.Stage;

import java.sql.SQLException;
import java.util.ArrayList;

public class TableChangePlaceController {
    public TableView table_of_places;
    public Button add_button_places;
    public TextField name_of_place_field;
    public Button back_button_place;
    public Text error_message_text;
    @FXML
    private void initialize() {
        Navigation.fillTable(table_of_places, "all_places", null);

        add_button_places.setOnAction(event -> {
            ArrayList<String> variables = new ArrayList<>();
            String field1 = name_of_place_field.getText();
            if (field1 != null && !field1.isEmpty()) {
                variables.add(field1);
                error_message_text.setText("");
                try {
                    Navigation.addItemInTable("insert_places", variables);
                    table_of_places.getColumns().clear();
                    Navigation.fillTable(table_of_places, "all_places", null);
                } catch (SQLException e) {
                    error_message_text.setText(e.getMessage());
                }
            } else {
                error_message_text.setText("Поля не заполнены!");
            }
        });

        back_button_place.setOnAction(event -> {
            Stage stage = (Stage) back_button_place.getScene().getWindow();
            Navigation.navigateBack(stage);
        });
    }
}
