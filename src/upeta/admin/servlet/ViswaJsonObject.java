package upeta.admin.servlet;
import java.util.List;

import upeta.admin.bean.member;

public class ViswaJsonObject {
    int draw ;
    int iTotalDisplayRecords;

    int iTotalRecords;

    String sEcho;

    String sColumns;

    List<member> aaData;
    public int getDraw() {
    return draw;
    }

    public void setDraw(int draw) {
    this.draw = draw;
    }

    public int getiTotalRecords() {
    return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
    this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
    return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
    this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public String getsEcho() {
    return sEcho;
    }

    public void setsEcho(String sEcho) {
    this.sEcho = sEcho;
    }

    public String getsColumns() {
    return sColumns;
    }

    public void setsColumns(String sColumns) {
    this.sColumns = sColumns;
    }

    public List<member> getAaData() {
        return aaData;
    }

    public void setAaData(List<member> aaData) {
        this.aaData = aaData;
    }


}
