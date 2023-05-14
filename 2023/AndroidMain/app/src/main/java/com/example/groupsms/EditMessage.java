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

public class EditMessage extends AppCompatActivity {
    final static int RESULT_FROM_EDIT_ACT = 98;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_message);

        Intent editIntent;
        EditText etMessage;
        String theMessage;

        editIntent = this.getIntent();

        theMessage = editIntent.getStringExtra("MESSAGE_KEY");
        etMessage = (EditText) this.findViewById(R.id.txtViewEditMessage);
        etMessage.setText(theMessage);

        Button btnDone = (Button) this.findViewById(R.id.btnEditDone);
        btnDone.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("NEW_MESSAGE", ((EditText)
                        findViewById(R.id.txtViewEditMessage)).getText().toString());
                setResult(RESULT_FROM_EDIT_ACT, intent);
                finish();
            }
        });
    }
}