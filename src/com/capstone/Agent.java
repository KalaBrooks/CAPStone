package com.capstone;

public class Agent {
    public int agent_ID;
    private String name;
    private String password;
    private String phone;
    private String Address;

    public int getAgent_ID(){
        return agent_ID;
    }

    public void setAgent_ID(int agent_ID){
        this.agent_ID = agent_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }


}


