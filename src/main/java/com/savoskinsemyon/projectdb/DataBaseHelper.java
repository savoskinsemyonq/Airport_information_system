package com.savoskinsemyon.projectdb;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class DataBaseHelper {
    private Connection con;
    private Properties props;

    public DataBaseHelper() {
        try {
            con = getConnection();
            System.out.println("Connection to DB succesfull");
        } catch (SQLException e) {
            System.err.println("Connection failed...");
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        props = loadTasksFile();
    }

    private  Connection getConnection() throws SQLException {
        //Получаем данные из фалйа и конектимся
        Properties props = new Properties();
        try(InputStream in = Files.newInputStream(
                Paths.get("src/main/resources/com/savoskinsemyon/projectdb/properties/userInfo.properties"))){
            props.load(in);
        } catch (IOException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
        String url = props.getProperty("url");
        String username = props.getProperty("username");
        String password = props.getProperty("password");

        return DriverManager.getConnection(url, username, password);
    }

    public ResultSet doTask(String taskName, ArrayList<String> variables) throws SQLException {
        String requestFromProperties = getTaskFromFile(taskName);
        ResultSet result = null;
        try {
            Statement statement = con.createStatement();
            if (variables != null && variables.size() != 0) {
                result = statement.executeQuery(createStringRequest(requestFromProperties, variables));
            } else {
                result = statement.executeQuery(requestFromProperties);
            }
        } catch (SQLException e) {
            System.out.println();
        }
        return result;
    }


    public void addItem(String taskName, ArrayList<String> variables) throws SQLException {
        String requestFromProperties = getTaskFromFile(taskName);
        if (variables != null && variables.size() != 0) {
            Statement statement = con.createStatement();
            statement.executeUpdate(createStringRequest(requestFromProperties, variables));
            System.out.println(createStringRequest(requestFromProperties, variables));
        } else {
            throw new RuntimeException("Empty or null variables");
        }

    }

    private Properties loadTasksFile() {
        Properties properties = new Properties();
        try(InputStream in = Files.newInputStream(
                Paths.get("src/main/resources/com/savoskinsemyon/projectdb/properties/requests.properties"))){
            properties.load(in);
        } catch (IOException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
        return properties;
    }

    private String getTaskFromFile(String nameTask) {
        try {
            return new String(Files.readAllBytes(Paths.get(props.getProperty(nameTask))));
        } catch (IOException e ) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    private String createStringRequest(String request, ArrayList<String> variables) {
        String result = request;
        for (String variable : variables) {
            result = result.replaceFirst("\\?\\?", variable);
        }
        return result;
    }
}
