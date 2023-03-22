package com.example.activitystatesexample;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.mylinearlayout);

        TextView ourTextview1 = findViewById(R.id.txtvw1);
        TextView btn1 = findViewById(R.id.btn1);

        ourTextview1.setText("KYS Class");



        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextView ourInnerTextVw = MainActivity.this.findViewById(R.id.txtvw1);
                ourInnerTextVw.setText("this is coming from button handler");
                ourInnerTextVw.setTextColor(Color.BLUE);
                ourInnerTextVw.setBackgroundColor(Color.GREEN);
                ourInnerTextVw.setTextSize(40);
            }
        });
    }
}