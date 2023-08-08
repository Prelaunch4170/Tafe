package com.example.groupsms;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.EditText;
import android.view.MenuItem;
import android.os.Bundle;
import android.view.View;
import android.widget.*;
import android.view.MenuItem;

public class EditSend extends AppCompatActivity {
    final static int RESULT_FROM_EDIT_ACT = 13;

    /**
     * @param savedInstanceState sets the editView to be the default number from the GroupSMS using
     *                           "PHONE_KEY" key
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_send);

        Intent editIntent;
        EditText etMessage;
        String theMessage;

        editIntent = this.getIntent();

        theMessage = editIntent.getStringExtra("PHONE_KEY");
        etMessage = (EditText) this.findViewById(R.id.txtViewEditPhone);
        etMessage.setText(theMessage);

        Button btnDone = (Button) this.findViewById(R.id.btnPhoneDone);
        btnDone.setOnClickListener(new View.OnClickListener() {
            /**
             * @param v gets the inputted phone number and sets the "NEW_PHONE" keys value to the number
             *          and returns to GroupSMS activity
             */
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("NEW_PHONE", ((EditText)
                        findViewById(R.id.txtViewEditPhone)).getText().toString());
                setResult(RESULT_FROM_EDIT_ACT, intent);
                finish();
            }
        });
    }
}