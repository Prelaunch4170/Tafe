package com.example.activitystatesexample;

import androidx.appcompat.app.AppCompatActivity;
import android.util.Log;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MainActivity extends AppCompatActivity {
    private static String ip = "127.0.0.1";// this is the host ip that your data base exists on you can use 10.0.2.2 for local host                                                    found on your pc. use if config for windows to find the ip if the database exists on                                                    your pc
    private static String port = "3306";// the port sql server runs on
    private static String Classes = "net.sourceforge.jtds.jdbc.Driver";// the driver that is required for this connection use                                                                           "org.postgresql.Driver" for connecting to postgresql
    private static String database = "AndrioidTest";// the data base name
    private static String username = "TestUser";// the user name
    private static String password = "TestPassword1";// the password
    private static String url = "jdbc:mysql://"+ip+":"+port+"/"+database; // the connection url string

    private Connection connection = null;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setContentView(R.layout.activity_main);

    }
    @Override
    protected void onStart() {
        super.onStart();
        System.out.println("onStart");
        TextView TestText = (TextView)findViewById(R.id.textViewBottom);
        TestText.setText("Bottom Text");
        TextView TestTextTop = (TextView)findViewById(R.id.textViewTop);
        TestTextTop.setText("");
    }


    public void TestCode(View view){

        TextView TestBottom = (TextView)findViewById(R.id.textViewBottom);
        TextView TestTop = (TextView)findViewById(R.id.textViewTop);

        if(TestBottom.getText() == ""){
            TestBottom.setText("Bottom Text");
            TestTop.setText("");
        } else if (TestTop.getText() == "") {
            TestBottom.setText("");
            TestTop.setText("Top Text");
        }


    }
}