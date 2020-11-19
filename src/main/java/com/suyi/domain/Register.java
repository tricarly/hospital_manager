package com.suyi.domain;

import java.util.Date;

public class Register {
    private Integer rid;

    private String name;

    private String idcard;

    private String sinumber;

    private String registermoney;

    private String phone;

    private Integer ispay;

    private Integer sex;

    private Integer age;

    private Integer consultation;

    private Integer department;

    private Integer did;

    private Date createtime;

    private Integer state;

    private String remark;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getSinumber() {
        return sinumber;
    }

    public void setSinumber(String sinumber) {
        this.sinumber = sinumber == null ? null : sinumber.trim();
    }

    public String getRegistermoney() {
        return registermoney;
    }

    public void setRegistermoney(String registermoney) {
        this.registermoney = registermoney == null ? null : registermoney.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getIspay() {
        return ispay;
    }

    public void setIspay(Integer ispay) {
        this.ispay = ispay;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getConsultation() {
        return consultation;
    }

    public void setConsultation(Integer consultation) {
        this.consultation = consultation;
    }

    public Integer getDepartment() {
        return department;
    }

    public void setDepartment(Integer department) {
        this.department = department;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        return "Register{" +
                "rid=" + rid +
                ", name='" + name + '\'' +
                ", idcard='" + idcard + '\'' +
                ", sinumber='" + sinumber + '\'' +
                ", registermoney='" + registermoney + '\'' +
                ", phone='" + phone + '\'' +
                ", ispay=" + ispay +
                ", sex=" + sex +
                ", age=" + age +
                ", consultation=" + consultation +
                ", department=" + department +
                ", did=" + did +
                ", createtime=" + createtime +
                ", state=" + state +
                ", remark='" + remark + '\'' +
                '}';
    }
}