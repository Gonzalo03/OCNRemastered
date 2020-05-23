package com.ocein.ocn;

public class Lugares {

    private int lugarId;
    private String nombre;
    private String tipoLugar;
    private int cantPc;
    private int cantMonitores;
    private int cantImpresoras;
    private int cantLaptop;

    public Lugares (){

    }

    public Lugares(int lugarId, String nombre, String tipoLugar, int cantPc, int cantMonitores, int cantImpresoras, int cantLaptop) {
        this.lugarId = lugarId;
        this.nombre = nombre;
        this.tipoLugar = tipoLugar;
        this.cantPc = cantPc;
        this.cantMonitores = cantMonitores;
        this.cantImpresoras = cantImpresoras;
        this.cantLaptop = cantLaptop;
    }

    public int getLugarId() {
        return lugarId;
    }

    public void setLugarId(int lugarId) {
        this.lugarId = lugarId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoLugar() {
        return tipoLugar;
    }

    public void setTipoLugar(String tipoLugar) {
        this.tipoLugar = tipoLugar;
    }

    public int getCantPc() {
        return cantPc;
    }

    public void setCantPc(int cantPc) {
        this.cantPc = cantPc;
    }

    public int getCantMonitores() {
        return cantMonitores;
    }

    public void setCantMonitores(int cantMonitores) {
        this.cantMonitores = cantMonitores;
    }

    public int getCantImpresoras() {
        return cantImpresoras;
    }

    public void setCantImpresoras(int cantImpresoras) {
        this.cantImpresoras = cantImpresoras;
    }

    public int getCantLaptop() {
        return cantLaptop;
    }

    public void setCantLaptop(int cantLaptop) {
        this.cantLaptop = cantLaptop;
    }

    @Override
    public String toString() {
        return nombre;
    }
}
