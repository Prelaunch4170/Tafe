package com.example.activitystatesexample;

import androidx.appcompat.app.AppCompatActivity;
import android.util.Log;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }
    @Override
    protected void onStart() {
        super.onStart();
        System.out.println("onStart");
        TextView TestText = (TextView)findViewById(R.id.textView);
        TestText.setText("Main Test Text");
    }
    @Override
    protected void onStop(){
        super.onStop();
        System.out.println("onStop");
    }
    @Override
    protected void onPause(){
        super.onPause();
        System.out.println("onPause");
    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
        System.out.println("onDestroy");
    }
    @Override
    protected void onResume(){
        super.onResume();
        System.out.println("onResume");
    }


    public void TestCode(View view){
        TextView Test = (TextView)findViewById(R.id.textView);
        Test.setText("My Awesome Text");
    }
}