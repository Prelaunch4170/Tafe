package com.example.activitystatesexample;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import org.w3c.dom.Text;

public class nestActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nest);

        Intent thisIntent;
        String transportedText;
        TextView thisActivityText = findViewById(R.id.newTxtView);

        thisIntent = this.getIntent();

        transportedText = thisIntent.getStringExtra("stuffComingFromMain");
        thisActivityText.setText(transportedText);
    }
}