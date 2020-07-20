package com.model;

public class SuperType {
  private int ID = -1;
  private String typename="";
  public void SuperType() {
  }

  public int getID() {
    return ID;
  }

  public void setID(int ID) {
    this.ID = ID;
  }

  public String gettypename(){
    return typename;
  }
  public void settypename(String typename){
    this.typename=typename;
  }
}
