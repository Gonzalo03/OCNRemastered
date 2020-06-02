package com.ocein.ocn;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.provider.ContactsContract;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {

    TextView texto;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        texto = findViewById(R.id.texto);

        Bundle bundle =getIntent().getExtras();
        String text = bundle.getString("pc");
        texto.setText(text);

    }
}
