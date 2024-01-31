package lk.mobitel.abcbank.util;

import com.fasterxml.jackson.annotation.JsonValue;

public enum RoleType {
    ADMIN("admin"), USER("user");

    private String type;

    RoleType(String type){
        this.type = type;
    }

    @JsonValue
    public String getType(){
        return type;
    }
}
