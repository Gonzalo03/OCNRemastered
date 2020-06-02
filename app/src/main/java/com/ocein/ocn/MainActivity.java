package com.ocein.ocn;

import android.content.Intent;
import android.os.Bundle;
import android.os.Environment;
import android.text.Editable;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.loopj.android.http.*;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import cz.msebera.android.httpclient.Header;

public class MainActivity extends AppCompatActivity{

    ListView listaNombre;
    List<String> listTitle;
    TextView nombre;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listaNombre = findViewById(R.id.listaNombre);
        nombre = findViewById(R.id.nombre);

        iniciarBusqueda();
        listaNombre.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                String query = parent.getItemAtPosition(position).toString();
                nombre.setText(query);
            }
        });

    }

    public void iniciarBusqueda(){
        RequestQueue queue = Volley.newRequestQueue(this);
        String url = "https://ocnremastered.000webhostapp.com/spinner.php";

        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(response.length()>0){
                    try {
                        JSONArray jsonArray = new JSONArray(response);
                        traerDatos(jsonArray);
                    }catch (JSONException jsonException1){
                        Toast.makeText(getApplicationContext(),"ERROR JSON 1 "+ jsonException1.toString(),Toast.LENGTH_LONG).show();
                    }
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(),"ERROR VOLLEY "+ error.toString(),Toast.LENGTH_LONG).show();
            }
        });

        queue.add(stringRequest);
    }

    public void traerDatos(JSONArray jsonArray){
        listTitle = new ArrayList<>();
        try {
            for(int i = 0; i < jsonArray.length(); i++){
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String title = jsonObject.getString("Nombre");
                listTitle.add(title);
            }
        }catch (JSONException jsonException2){
            Toast.makeText(getApplicationContext(), "ERROR JSON 2 "+jsonException2.toString(), Toast.LENGTH_LONG).show();
        }

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item,listTitle);
        listaNombre.setAdapter(adapter);

    }


    public void agregarPC(View view) {
        Intent intent = new Intent(getApplicationContext(), Main2Activity.class);
        intent.putExtra("pc", nombre.getText().toString());
        startActivity(intent);
    }
}
