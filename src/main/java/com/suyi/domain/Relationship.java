package com.suyi.domain;

public class Relationship {
    private Integer docid;

    private Integer depid;

    public Integer getDocid() {
        return docid;
    }

    public void setDocid(Integer docid) {
        this.docid = docid;
    }

    public Integer getDepid() {
        return depid;
    }

    public void setDepid(Integer depid) {
        this.depid = depid;
    }

    @Override
    public String toString() {
        return "Relationship{" +
                "docid=" + docid +
                ", depid=" + depid +
                '}';
    }
}