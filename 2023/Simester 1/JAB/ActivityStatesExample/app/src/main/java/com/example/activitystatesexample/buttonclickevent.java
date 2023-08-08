package com.example.activitystatesexample;

import android.app.Activity;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

public class buttonclickevent implements View.OnClickListener{
    private Activity ourMainActivity;

    public buttonclickevent(Activity ourMainActivity) {
        this.ourMainActivity = ourMainActivity;
    }

    public void onClick(View view){
        TextView targetTextView = ourMainActivity.findViewById(R.id.txtvw1);

    }
}
