package lk.mobitel.abcbank.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer implements SuperEntity{
    @Id
    @Column(length = 20)
    private String nic;
    @Column(length = 100,nullable = false)
    private String name;
    @Column(length = 300,nullable = false)
    private String address;
    @Column(name = "mobile_no",length = 20,nullable = false)
    private String mobileNo;
}
