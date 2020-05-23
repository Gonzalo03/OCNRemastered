package com.ocein.ocn;

import android.os.Bundle;
import android.os.Environment;
import android.text.Editable;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import com.loopj.android.http.*;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;

import java.io.File;
import java.util.ArrayList;

import cz.msebera.android.httpclient.Header;

public class MainActivity extends AppCompatActivity{

    private AsyncHttpClient cliente;
    private Spinner spinner;

    TextView testeo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        cliente = new AsyncHttpClient();
        spinner = findViewById(R.id.spinner);
        testeo = findViewById(R.id.testeo);

        llenarSpinner();

    }

    private void llenarSpinner(){
        String url = "https://ocnremastered.000webhostapp.com/spinner.php";
        cliente.post(url, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if(statusCode == 200){
                    cargarSpinner(new String(responseBody));
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {

            }
        });
    }

    private void cargarSpinner(String respuesta) {
        ArrayList<Lugares> lista = new ArrayList<Lugares>();

        try {
            JSONArray jsonArreglo = new JSONArray(respuesta);

            for (int i=0; i<jsonArreglo.length(); i++){
                Lugares l = new Lugares();
                l.setNombre(jsonArreglo.getJSONObject(i).getString("Nombre"));
                lista.add(l);

            }
            ArrayAdapter<Lugares> a = new ArrayAdapter<Lugares>(this, android.R.layout.simple_dropdown_item_1line, lista);
            spinner.setAdapter(a);


        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
