package com.example.activitystatesexample;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContract;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView txtView;
    EditText edtText;
    ActivityResultLauncher<Intent> ourActivityLauncher;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btn1 = findViewById(R.id.btn1);
        ourActivityLauncher = registerForActivityResult(
            new ActivityResultContracts.StartActivityForResult(),
            new ActivityResultCallback<ActivityResult>() {
                @Override
                public void onActivityResult(ActivityResult result) {

                }
            }
        );

        btn1.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                String textEdit;
                Intent ourIntent;
                Activity sourceActivity;
                Class destinationActivityClass;

                sourceActivity = MainActivity.this;
                destinationActivityClass = nestActivity.class;


                edtText = findViewById(R.id.edittext1);
                textEdit = edtText.getText().toString();

                ourIntent = new Intent(sourceActivity, destinationActivityClass);
                ourIntent.putExtra( "stuffComingFromMain", textEdit);
                ourActivityLauncher.launch(ourIntent);
            }

        });
    }

    private void  updateTextView(){
        txtView = findViewById(R.id.txtvw1);
        txtView.setText("testing");
    }
}