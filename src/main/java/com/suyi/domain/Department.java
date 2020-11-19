package com.suyi.domain;

public class Department {
    private Integer dno;

    private String dname;

    public Integer getDno() {
        return dno;
    }

    public void setDno(Integer dno) {
        this.dno = dno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    @Override
    public String toString() {
        return "Department{" +
                "dno=" + dno +
                ", dname='" + dname + '\'' +
                '}';
    }
}