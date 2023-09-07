package com.savoskinsemyon.projectdb;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Callback;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;


public class Navigation {
    private static final Map<ProjectWindows, String> viewResource = new HashMap<>();
    private static ProjectWindows currentWindow = ProjectWindows.START_PAGE;
    private static final Stack<ProjectWindows> previousWindows = new Stack<>();

    private static final DataBaseHelper dataBaseHelper = new DataBaseHelper();

    public static void init() {
        viewResource.put(ProjectWindows.START_PAGE,"StartPage.fxml");
        viewResource.put(ProjectWindows.TABLE_CHANGE_AIRPLANE_PAGE,"TableChangeAirplanesPage.fxml");
        viewResource.put(ProjectWindows.TABLE_CHANGE_PLACE_PAGE,"TableChangePlacesPage.fxml");
        viewResource.put(ProjectWindows.TABLE_SELECTION_PAGE,"TableSelectionPage.fxml");
        viewResource.put(ProjectWindows.REQUEST_SELECTION_PAGE,"RequestSelect.fxml");
        viewResource.put(ProjectWindows.REQUEST_AIRPLANE_PAGE,"RequestAirplanes.fxml");
        viewResource.put(ProjectWindows.REQUEST_FLIGHTS_PAGE,"RequestFlights.fxml");
        viewResource.put(ProjectWindows.REQUEST_PASSENGER_PAGE,"RequestPassengers.fxml");
        viewResource.put(ProjectWindows.REQUEST_STAFF_PAGE,"RequestStaff.fxml");
    }

    public static void navigateTo(ProjectWindows window, Stage stage) {
        previousWindows.push(currentWindow);
        currentWindow = window;
        navigate(stage);
    }

    public static void navigateBack(Stage stage) {
        currentWindow = previousWindows.pop();
        navigate(stage);
    }

    private static void navigate(Stage stage) {
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(MyApp.class.getResource(viewResource.get(currentWindow)));
        try {
            Parent root = fxmlLoader.load();
            stage = new Stage();
            stage.setTitle("Transport company Database");
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.setScene(new Scene(root));
            stage.setResizable(false);
            stage.show();
        } catch (IOException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public static void fillTable(TableView<Object> tableview, String taskName, ArrayList<String> variables){
        try {
            ResultSet result = dataBaseHelper.doTask(taskName, variables);
            ObservableList<Object> data = FXCollections.observableArrayList();

            for (int i = 0; i < result.getMetaData().getColumnCount(); i++) {
                int j = i;
                TableColumn col = new TableColumn(result.getMetaData().getColumnName(i + 1));
                col.setCellValueFactory((Callback<TableColumn.CellDataFeatures<ObservableList, String>,
                        ObservableValue<String>>)
                        param -> new SimpleStringProperty(param.getValue().get(j).toString()));

                tableview.getColumns().addAll(col);
            }

            while (result.next()) {
                ObservableList<String> row = FXCollections.observableArrayList();
                for (int i = 1; i <= result.getMetaData().getColumnCount(); i++) {
                    if (result.getString(i) == null)
                        row.add("NULL");
                    else
                        row.add(result.getString(i));
                }
                data.add(row);

            }
            tableview.setItems(data);
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }

   public static void addItemInTable(String task, ArrayList<String> variables) throws SQLException{
       dataBaseHelper.addItem(task, variables);
    }

}
