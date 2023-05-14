package com.example.groupsms;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.telephony.SmsManager;
import android.widget.Toast;
public class GroupSMS extends AppCompatActivity {
    private String message = "";
    private String phone = "";
    ActivityResultLauncher<Intent> launchEditActivity;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Getting to the views defined in the XML files.

        TextView tvMessageDetails = findViewById(R.id.tvMessageDetails);
        tvMessageDetails.setBackgroundColor(Color.GREEN);
        tvMessageDetails.setMovementMethod(new ScrollingMovementMethod());

        message ="Testing Message";
        phone = "0412345678";
        setSummary();
        // Responding to an event - the onClick for the Edit Message Button
        // Using a anonymous inner class
        Button btnEditMessage;
        Button btnSend;
        Button btnEditPhone;

        btnEditMessage = (Button) this.findViewById(R.id.btnEditMessage);
        btnEditPhone = (Button) this.findViewById(R.id.btnEditPhone);
        btnSend = (Button) this.findViewById(R.id.btnSend);
        //Instantiating our lauchActivity object
        launchEditActivity = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                new ActivityResultCallback<ActivityResult>() {
                    @Override
                    public void onActivityResult(ActivityResult result) {
                    }
                });
        btnEditMessage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent editIntent;
                Activity sourceActivity;
                Class destinationClass;

                sourceActivity = GroupSMS.this;
                destinationClass = EditMessage.class;
                editIntent = new Intent(sourceActivity, destinationClass);
                editIntent.putExtra("MESSAGE_KEY",message);
                launchEditActivity.launch(editIntent);
            }
        });
        btnEditPhone.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent editIntent;
                Activity sourceActivity;
                Class destinationClass;

                sourceActivity = GroupSMS.this;
                destinationClass = EditSend.class;
                editIntent = new Intent(sourceActivity, destinationClass);
                editIntent.putExtra("PHONE_KEY",phone);
                launchEditActivity.launch(editIntent);
            }
        });
        //Instantiating our lauchActivity object
        launchEditActivity = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                new ActivityResultCallback<ActivityResult>() {
                    @Override
                    public void onActivityResult(ActivityResult result) {
                        if (result.getResultCode() == 98) {
                            Intent data = result.getData();

                            String resultMessage = (String) (data.getStringExtra("NEW_MESSAGE"));

                            message = resultMessage;
                            setSummary();
                        }
                        else if(result.getResultCode() == 13){
                            Intent data = result.getData();

                            String resultPhone = (String) (data.getStringExtra("NEW_PHONE"));

                            phone = resultPhone;
                            setSummary();
                        }
                    }
                });

        btnSend.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
               /* Intent ourSendIntent;
                Uri ourURI = Uri.parse("smsto:"+phone);
                ourSendIntent = new Intent(Intent.ACTION_SENDTO, ourURI);
                ourSendIntent.putExtra("SMS_BODY_KEY",message);
                startActivity(ourSendIntent);*/
                if (ContextCompat.checkSelfPermission(GroupSMS.this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
                    // Permission is not granted, request it
                    ActivityCompat.requestPermissions(GroupSMS.this, new String[]{Manifest.permission.SEND_SMS}, 1);
                } else {
                    // Permission is already granted, proceed with sending SMS
                    SmsManager smsManager = SmsManager.getDefault();
                    smsManager.sendTextMessage(phone, null, message, null, null);
                    Toast.makeText(getApplicationContext(), "SMS Sent to " + phone,
                            Toast.LENGTH_LONG).show();
                }


            }

        });

    }


    private void setSummary() {
        StringBuilder summary;
        summary = new StringBuilder("Sending To:\n");
        summary.append(phone);
        summary.append("\n\nMessage:\n");
        summary.append(message);
        TextView tvMessageDetails = (TextView) findViewById(R.id.tvMessageDetails);
        tvMessageDetails.setText(summary);



    }

}