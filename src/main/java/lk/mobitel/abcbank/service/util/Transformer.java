package lk.mobitel.abcbank.service.util;

import lk.mobitel.abcbank.dto.CustomerDTO;
import lk.mobitel.abcbank.dto.RoleDTO;
import lk.mobitel.abcbank.dto.UserDTO;
import lk.mobitel.abcbank.entity.Customer;
import lk.mobitel.abcbank.entity.Role;
import lk.mobitel.abcbank.entity.User;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
public class Transformer {
    private final ModelMapper mapper;

    public Transformer(ModelMapper mapper) {
        this.mapper = mapper;
    }

    public Customer fromCustomerDTO(CustomerDTO customerDTO){
        return mapper.map(customerDTO, Customer.class);
    }
    public CustomerDTO toCustomerDTO(Customer customer){
        return mapper.map(customer, CustomerDTO.class);
    }

    public User fromUserDTO(UserDTO userDTO){
        mapper.getConfiguration().setAmbiguityIgnored(true);
        mapper.typeMap(RoleDTO.class,Role.class)
                .addMapping(RoleDTO::getId,Role::setId)
                .addMapping(RoleDTO::getName, Role::setName);
        return mapper.map(userDTO, User.class);
    }
    public UserDTO toUserDTO(User user){
        return mapper.map(user, UserDTO.class);
    }

    public Role fromRoleDTO(RoleDTO roleDTO){
        return mapper.map(roleDTO, Role.class);
    }
    public RoleDTO toRoleDTO(Role role){
        return mapper.map(role, RoleDTO.class);
    }


}
